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
    tmin = 0
    tmax = 500
    subplots_adjust(left=.15, right = .95, top=0.95, bottom=0.12,wspace = 0.25,hspace=0.35)

    data = sio.loadmat('busPosition.mat')
    timePos = data['tNoWave']
    positionNoWave = data['positionNoWave']
    positionWave = data['positionWave']
    
    data = sio.loadmat('busPower.mat')
    timeBus = data['time']
    isolatedPowerGrid = data['isolatedPowerGrid']
    mainPowerGrid = data['mainPowerGrid']
    labelx = -.12
    
    f = figure(1)
    clf()
    f.set_size_inches(fig_width, fig_height)
    p = subplot(211)
    p2, = plot(timePos[0], positionWave[0],'g-')
    p1, = plot(timePos[0], positionNoWave[0],'r--')
    
    xlim(tmin,tmax)
    p.yaxis.set_label_coords(labelx, 0.5)
    ylim(-2,2)
    
    #legend((p1,p2), ('Position without wave motion','Position with wave motion'),loc=4)
    ylabel(r'Position [m]')
    xlabel(r'time [s]')

    p = subplot(212)
    p1, = plot(timeBus[0], isolatedPowerGrid[0],'b-')
    p2, = plot(timeBus[0], mainPowerGrid[0],'k--')
    p.yaxis.set_label_coords(labelx, 0.5)
    ylabel(r'Genset power [pu]')
    xlabel(r'time [s]')
    #legend((p1,p2), ('Isolated power grid','Main power grid'),loc=4)
    xlim(tmin,tmax)
    #ylim(.94,1)

    savefig('../busIsolation.pdf',dpi=300, facecolor='none')

makeFigure()
