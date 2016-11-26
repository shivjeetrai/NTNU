import scipy.io as sio
from numpy import mean
from pylab import *
import numpy as np
data = np.genfromtxt('GensetRespPlot.csv', delimiter=',', skip_header=1,
                     skip_footer=0, names=['loadstep', 'ref', 'sim'])

fig_width = 3.5  # width in inches
fig_height = 1.8312#fig_width*3*golden_mean      # height in inches
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
    subplots_adjust(left=.15, right = .95, top=0.9044, bottom=0.2294,wspace = 0.25,hspace=0.35)
    
    f = figure(1)
    clf()
    f.set_size_inches(fig_width, fig_height)
    p1, = plot(data['loadstep'], data['ref'],'g-')
    p2, = plot(data['loadstep'], data['sim'],'b.')
    
    
    legend((p1,p2), ('Reference','Simulated'),loc=4)
    xlabel(r'normalized load step')
    ylabel(r'Recovery time [s]')


    savefig('../MVMResponseTimeCurve.pdf',dpi=300, facecolor='none')

makeFigure()
