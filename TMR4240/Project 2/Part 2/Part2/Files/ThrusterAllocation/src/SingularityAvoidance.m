classdef SingularityAvoidance < handle
    %JFTF_controller Thruster allocation with rotable thrusters
    %
    %    Copyright: 	NTNU, Trondheim, Norway
    %    Created:  	??.??.2014  Aleksander Veksler
    %    Revised:	28.03.2014  Torstein Ingebrigtsen B???
    %
    %
    
    
    
    properties
        cfg; % Configuration
        Nthrusters; % Number of thrusters
        Nrotable; % Number of rotable thrusters
        Beq; % Thrust matrix \tau = B u
        LENGTH_BASE = 100;
    end
    methods
        function o = SingularityAvoidance(thrusterPositionX,thrusterPositionY,angle,rotable,forcemax,thruster2swb)
            o = o@handle();
            %% Scale
            thrusterPositionX = thrusterPositionX/o.LENGTH_BASE;
            thrusterPositionY = thrusterPositionY/o.LENGTH_BASE;
                     
            o.Nthrusters = length(thrusterPositionX);
            o.cfg = struct('ship',struct('thruster',{cell(o.Nthrusters,1)},'switchboards',max(thruster2swb)));
            
            for i = 1:o.Nthrusters
                o.cfg.ship.thruster{i} = struct(...
                    'location',[thrusterPositionX(i), thrusterPositionY(i)],....
                    'force_max',forcemax(i),...
                    'switchboard',thruster2swb(i),...
                    'rotable',rotable(i),...
                    'angle',angle(i));
            end
           
            
            B_r = [];
            B_f = [];
            o.Nrotable = 0;
            for i = 1:o.Nthrusters
                if o.cfg.ship.thruster{i}.rotable
                    o.Nrotable = o.Nrotable ...
                        + 1;
                end
            end
            
            
            for i = 1:o.Nthrusters
                loc = o.cfg.ship.thruster{i}.location;
                B_r_ = [[1 0 -loc(2)]' [0 1 loc(1)]']*o.cfg.ship.thruster{i}.force_max;
                B_r = [B_r B_r_]; % Per equation B_r = , just below (5)
            end
            o.Beq = [B_r, B_f]; % (5)
            o.get_cost_singularity(o.Beq);
            
        end
        
             

        
        function get_cost_singularity(o,B)
            if exist('singularitycost.mat','file')
                load('singularitycost.mat');
                if (all(all(B_ == B)) &&  o.varrho == varrho_ && o.epsilon == epsilon_)
                    %load('singularitycost.mat','f');
                    o.singularityAvoidanceCost = f;
                    return;
                end
            end
            singularity_cost = 0;
            syms varrho 
            syms epsilon
            u = sym('u',[o.Nthrusters*2 1]);
            isOn = sym('isOn',[o.Nthrusters 1]);
            
            for ignoreSwb = 1:o.cfg.ship.switchboards
                Y = sym('y',[3 o.Nthrusters]);
                idx = 1;
                for i = 1:o.Nthrusters
                    if (o.cfg.ship.thruster{i}.switchboard ~= ignoreSwb)
                        u1 = u(i*2-1);
                        u2 = u(i*2);
                        U1 = isOn(i)*u1/(sqrt(u1^2+u2^2));
                        U2 = isOn(i)*u2/(sqrt(u1^2+u2^2));
                        Y(:,i) = [U1; U2; B(3,i*2-1)*U1+B(3,i*2)*U2];
                    else
                        Y(:,i) = [0;0;0];
                    end
                end
                T = det(Y*Y.');
                singularity_cost = singularity_cost+ varrho/(epsilon+T);
            end
		            fid = fopen('singularity_cost.cpp','wt');
            fprintf(fid,'#define NTHRUSTERS %d\n',o.Nthrusters);
            fprintf(fid,'#include <cmath>\n');
            fprintf(fid,'void singularityCost(double epsilon, double varrho, const bool isOn[], const double* x, double* f){\n');
            for i = 1:length(isOn)
                fprintf(fid,'bool isOn%d = isOn[%d];\n',i,i-1);
            end
            for i = 1:(length(u))
                fprintf(fid,'double u%d = x[%d];\n',i,i-1);
            end
            fstr = ccode(singularity_cost);
            fprintf(fid,'*f = %s\n',fstr(7:end));
            fprintf(fid,'}\n');
            fclose(fid);

            F = gradient(singularity_cost,u);
%             H = jacobian(F,u);

%             hstr = cell(length(F),1);
%             parfor i = 1:length(F)
%                 tmp = cell(1,length(F));
%                 for j = i:length(F)
%                     tmp{1,j} = ccode(H(i,j));
%                     %hstr{j,i} = hstr{i,j};
%                 end
%                 hstr{i} = tmp;
%             end
%             fid = fopen('singularity_cost_hessian.cpp','wt');
%             printf(fid,'#include <cmath>');
%             fprintf(fid,'void singularityCostHessian(double epsilon, double varrho, const bool isOn[], const double ux[], const double uy[], double H[%d][%d]){\n',length(F),length(F));
%             for i = 1:(length(F)/2)
%                 fprintf(fid,'bool isOn%d = isOn[%d];\n',i,i-1);
%             end
%             k = 0;
%             for i = 1:(length(F)/2)
%                 k = k +1;
%                 fprintf(fid,'double u%d = ux[%d];\n',k,i-1);
%                 k = k +1;
%                 fprintf(fid,'double u%d = uy[%d];\n',k,i-1);
%             end
%             for i = 1:length(F)
%                 for j = i:length(F)
%                     fprintf(fid,'H[%d][%d]\t= %s\n',i-1,j-1,hstr{i}{1,j}(7:end));
%                     if (j>i)
%                         fprintf(fid,'H[%d][%d]\t=  H[%d][%d];\n',i-1,j-1,j-1,i-1);
%                     end
%                 end
%             end
%             fprintf(fid,'}\n');
%             fclose(fid);
            
            fid = fopen('singularity_cost_gradient.cpp','wt');
            fprintf(fid,'#include <cmath>\n');
            fstr = cell(length(F),1);
            for i = 1:length(F)
                fstr{i} = ccode(F(i));
            end
            fprintf(fid,'void singularityCostGradient(double epsilon, double varrho, const bool isOn[], const double x[], double f[%d]){\n',length(F));
            for i = 1:length(F)
                fprintf(fid,'bool isOn%d = isOn[%d];\n',i,i-1);
            end
            for i = 1:(length(u))
                fprintf(fid,'double u%d = x[%d];\n',i,i-1);
            end
            for i = 1:length(F)
                fprintf(fid,'f[%d] = %s\n',i-1,fstr{i}(7:end));
            end
            fprintf(fid,'}\n');
            fclose(fid);
            

            
            
        end
        
    end
    
    
    methods(Static)
        function test()
            test_instant()
        end

        
        function make(initFilePath,initFileName)
            currentpath = pwd;
            cd(initFilePath)
            eval(initFileName);
            cd(currentpath)
            posx = rotable;
            posy = posx;
            forcemax = posx;
            angle = posx;
            for i = 1:length(thrusters)
                posx(i) = thrusters(i).positionX;
                posy(i) = thrusters(i).positionX;
                forcemax(i) = thrusters(i).rated_thrust;
                rotable(i) = thrusters(i).rotable;
                angle(i) = thrusters(i).alpha0;
            end
            o = SingularityAvoidance(posx,posy,angle,rotable,forcemax,thruster2swb);
        end
        

  

    end
    
end


% References:
% Johansen(2008): OPTIMAL CONSTRAINED CONTROL ALLOCATION IN MARINE SURFACE VESSELS WITH RUDDERS Tor A. Johansen ? Thomas P. Fuglseth ? Petter T?ndel ? Thor I. Fossen ?
% Ruth (2008): Eivind Ruth Propulsion control and thrust allocation on marine vessels
