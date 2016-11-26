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
    tmax = 10
    subplots_adjust(left=.15, right = .95, top=0.95, bottom=0.12,wspace = 0.25,hspace=0.35)

    data = sio.loadmat('batteryPlot.mat')
    wobatPower = data['power'][0,0]
    batteryGensetPower = data['powerWbat'][0,0]
    
    batteryOmega = data['omegaWbat'][0,0]
    wobatOmega = data['omega'][0,0]
    labelx = -.12
    
    f = figure(1)
    clf()
    f.set_size_inches(fig_width, fig_height)
    p = subplot(211)
    p1, = plot(batteryGensetPower['Time'], batteryGensetPower['Data'],'b-',label='with battery')
    p2, = plot(wobatPower['Time'], wobatPower['Data'],'g-',label='with battery')
    xlim(tmin,tmax)
    p.yaxis.set_label_coords(labelx, 0.5)
    
    legend((p1,p2), ('with battery','without battery'),loc='upper right')
    ylabel(r'Generator power [pu]')
    xlabel(r'time [s]')

    p = subplot(212)
    plot((tmin,tmax), (.985,.985),'g:')
    p1, = plot(batteryOmega['Time'], batteryOmega['Data'],'b-',label='med batteri')
    p2, = plot(wobatOmega['Time'], wobatOmega['Data'],'g-',label='uten batteri')
    
    p.yaxis.set_label_coords(labelx, 0.5)
    ylabel(r'Frequency [pu]')
    xlabel(r'time [s]')
    legend((p1,p2), ('with battery','without battery'),loc=4)
    xlim(tmin,tmax)
    ylim(.94,1)

    savefig('../esdCase.pdf',dpi=300, facecolor='none')

makeFigure()
