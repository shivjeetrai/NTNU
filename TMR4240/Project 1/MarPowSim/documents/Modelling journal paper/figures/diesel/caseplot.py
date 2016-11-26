import scipy.io as sio
from numpy import mean
from pylab import *



fig_width = 3.5  # width in inches
fig_height = 2.2#fig_width*3*golden_mean      # height in inches
fig_size =  [fig_width,fig_height]
fontsize = 8
params = {'backend': 'ps',
          'text.latex.preamble': [r"\usepackage{amsfonts}",],
          'axes.labelsize': fontsize,
          'text.fontsize': fontsize,
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
    tMin = 98
    tMax = 107
    subplots_adjust(left=.15, right = .95, top=0.9044, bottom=0.2294,wspace = 0.25,hspace=0.35)

    data = sio.loadmat('notDeadBandLimited.mat')
    simpOmega = data['simpOmega'][0,0]
    simpU = data['simpU'][0,0]
    MVMOmega = data['MVMOmega'][0,0]
    MVMU = data['MVMU'][0,0]
    MVMUmax = data['MVMUmax'][0,0]
      
##    f = figure(1)
##    clf()
##    f.set_size_inches(fig_width, fig_height)
##    p = subplot(121)
##    p1, = plot(simpU['Time'], simpU['Data'],'b-',label='Forenklet')
##    p2, = plot(MVMU['Time'], MVMU['Data'],'g-',label='MVM')
##    p3, = plot(MVMUmax['Time'], MVMUmax['Data'],'g:',label='MVM maks')
##    xlim(tMin,tMax)
##
##    ylabel(r'Throtle posisjon [pu]')
##    xlabel(r'tid [s]')
##    legend((p1,p2,p3),('Forenklet','MVM','Smoke limiter'),loc=4)
##
##    p= f.add_subplot(122)
##    p1, = p.plot(simpOmega['Time'], simpOmega['Data'],'b-',label='Forenklet')
##    p2, = p.plot(MVMOmega['Time'], MVMOmega['Data'],'g-',label='MVM')
##    legend((p1,p2),('Forenklet','MVM'),loc=4)
##    ylabel(r'Frekvens [pu]')
##    xlabel(r'tid [s]')
##    xlim(tMin,tMax)
##
##    savefig('../utenDeadBand.png',dpi=300, facecolor='none')

    data = sio.loadmat('deadBandLimiter.mat')
    deadband = data['deadband'][0,0]
    smokelimiter = data['smokelimiter'][0,0]
    u = data['u'][0,0]
    uU = data['uU'][0,0]

    tMax = 115
    f = figure(1)
    clf()
    f.set_size_inches(fig_width, fig_height)
    p = subplot(111)
    p1, = plot(u['Time']-tMin, u['Data'],'b-')
    p2, = plot(deadband['Time']-tMin, deadband['Data'],'k:')
    p3, = plot(smokelimiter['Time']-tMin, smokelimiter['Data'],'r:')
    p4, = plot(uU['Time']-tMin, uU['Data'],'g-')
    xlim(0,tMax-tMin)
    ylim(0,1.1)

    ylabel(r'Throttle position [pu]')
    xlabel(r'Time [s]')
    legend((p1,p4,p3,p2),('Throttle constrained','Throttle unconstrained','Smoke limiter','Manufacture constraints'),loc=4)


    savefig('../withDeadBand.pdf',dpi=300, facecolor='none')

makeFigure()
