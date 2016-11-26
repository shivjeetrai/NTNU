import scipy.io as sio
from pylab import *

fig_width = 3.5 # width in inches
fig_height = 5.1688#fig_width*3*golden_mean      # height in inches
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
          'font.serif': 'Arial',
          'figure.figsize': fig_size}
rcParams.update(params)


def makeFigure():
    tmin = 49
    tmax = 70
    subplots_adjust(left=.15, right = .95, top=0.9661, bottom=0.0813,wspace = 0.25,hspace=0.35)

    data = sio.loadmat('simulationFullSimp.mat')
    simpPower = data['simpP'][0,0]
    fullPower = data['fullP'][0,0]
    simpOmega = data['simpOmega'][0,0]
    fullOmega = data['fullOmega'][0,0]
    simpV = data['simpV'][0,0]
    fullV = data['fullV'][0,0]

    full = 'Flux-linkage'
    simplified = 'Steady-state'
    
    f = figure(1)
    labelx = -.125
    clf()
    f.set_size_inches(fig_width, fig_height)
    p = subplot(311)
    p1, = plot(simpPower['time'], simpPower['data'],'b-')
    p2, = plot(fullPower['time'], fullPower['data'],'g--')
    p.yaxis.set_label_coords(labelx, 0.5)
    xlim(49.95,50.3)
    ylabel(r'Generator power [pu]')
    xlabel(r'time [s]')
    legend((p2,p1), (full,simplified),loc=4)

    p = subplot(312)
    p1, = plot(simpV['time'], simpV['data'],'b-')
    p2, = plot(fullV['time'], fullV['data'],'g--')
    xlim(49.95,50.3)
    ylim(.9,1.02)
    p.yaxis.set_label_coords(labelx, 0.5)
    ylabel(r'Voltage [pu]')
    xlabel(r'time [s]')
    legend((p2,p1), (full,simplified),loc=4)

    p = subplot(313)
    p1, = plot(simpOmega['time'], simpOmega['data'],'b-')
    p2, = plot(fullOmega['time'], fullOmega['data'],'g--')
    p.yaxis.set_label_coords(labelx, 0.5)
    xlim(tmin,tmax)
    ylabel(r'Electric frequency [pu]')
    xlabel(r'time [s]')
    legend((p2,p1), (full,simplified),loc=4)
    

    
    savefig('../../figures/fullVsSimplified.pdf',dpi=300, facecolor='none')

makeFigure()
