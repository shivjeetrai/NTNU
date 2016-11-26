import scipy.io as sio
from numpy import mean
from pylab import *

fig_width = 3.5  # width in inches
fig_height = fig_width*1#fig_width*3*golden_mean      # height in inches
fig_size =  [fig_width,fig_height]
fontsize = 8
params = {'backend': 'ps',
          'text.latex.preamble': [r"\usepackage{amsfonts}",],
          'axes.labelsize': fontsize,
          'font.size': fontsize,
          'legend.fontsize': fontsize,
          'xtick.labelsize': fontsize,
          'ytick.labelsize': fontsize,
          'text.usetex': True,
          'font.family': 'serif',
          'font.serif': 'Times New Roman',
          'figure.figsize': fig_size}
rcParams.update(params)


def makeFigure():
    dt = 1150
    tmin = -1150+dt
    tmax = -1100+dt
    subplots_adjust(left=.15, right = .95, top=0.95, bottom=0.12,wspace = 0.25,hspace=0.35)

    data = sio.loadmat('teknaDP.mat')
    eta = data['eta'][0,0]
    eta_hat = data['eta_hat'][0,0]
    omega = data['omega'][0,0]
    power = data['power'][0,0]
    
    labelx = -.12
    
    f = figure(1)
    p= f.add_subplot(211)
    
    dt = 1300
    tmin = 0
    tmax = 200
    p1, = plot(eta['Time']+dt, eta['Data'],'b-',label='Nord')
    #p2, = plot(eta_hat['Time']+dt, eta_hat['Data'],'g-',label='Nord filtrert')
    ylabel(r'Position [m]')
    xlabel(r'time [s]')
    #legend((p1,p2), ('Nord','Nord filtrert'),loc=4)
    xlim(tmin,tmax)
    p.yaxis.set_label_coords(labelx, 0.5)


    dt = 1300
    tmin = 0
    tmax = 50
    p= f.add_subplot(212)
    p1, = p.plot(power['Time']+dt, power['Data'],'b-')
    ylabel(r'Generator power [pu]')
    xlabel(r'time [s]')
    
    p.yaxis.set_label_coords(labelx, 0.5)
    xlim(tmin,tmax)
    ylim(.58,.72)
    savefig('../dpIrregular.pdf',dpi=300, facecolor='none')


makeFigure()
