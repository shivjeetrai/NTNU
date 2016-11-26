import scipy.io as sio
from numpy import mean
from pylab import *


AFhigh = 23;

wLow = .95
wHigh = 1.05
fig_width = 3.575  # width in inches
fig_height = fig_width*1.3#fig_width*3*golden_mean      # height in inches
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
          'font.serif': 'Computer Modern Roman',
          'figure.figsize': fig_size}
#matplotlib.rcParams['text.latex.preamble']=[r"\usepackage{amsfont}"]
rcParams.update(params)

g1 = 'b'
g2 = 'c'
g3 = 'm'
gMean = 'g'
lim = 'k:'
des = "-."
discon = ":"
desired = Line2D((0, 1), (1, 1), color='k', linestyle=des)

# Plot data
# Plot data
left = 0.15;
right = .95;
endTime = 450;

def makeFigure(name):
    #subplots_adjust(left=left, right = right, top=0.98, bottom=0.13,wspace = 0.35,hspace=0.35)
    labelx1 = -.15
    labelx2 = -.20
    # Get data

    data = sio.loadmat('simulationData/%s.mat' % name)
    thrusterPowerTime = data['thrusterPowerTime']
    thrusterPowerSwb1 = data['thrusterPowerSwb1']
    thrusterPowerSwb23 = data['thrusterPowerSwb23']
    
    f = figure(1)
    clf()
    f.set_size_inches(fig_width, fig_height)
    f.subplots_adjust(left=.19, right=.95, top=.98, bottom=.07, wspace=0.3, hspace=0.3)
    p = subplot(311)
    p1, = plot(thrusterPowerTime, thrusterPowerSwb1/1e6,'b-')
    p23, = plot(thrusterPowerTime, thrusterPowerSwb23/1e6,'g-')
    p.yaxis.set_label_coords(labelx1, 0.5)
    p.yaxis.set_major_locator(MaxNLocator(6))
    #p.axes.set_xticklabels([])
    ylabel(r'Thruster power [MW]')
    xlabel(r'time [s]')
    xlim(0,200)
    legend((p1,p23), ('Swb 1','Swb 2+3'))

    p= subplot(312)
    omega1 = data['omega1']
    omega23 = data['omega23']
    omegaTime = data['omegaTime']
    w1, = plot(omegaTime,omega1 ,'b')
    w23, = plot(omegaTime,omega23 ,'g')
    p.yaxis.set_label_coords(labelx1, 0.5)
    p.yaxis.set_major_locator(MaxNLocator(6))
    ylabel(r'Electric frequency [pu]')
    xlabel(r'time [s]')
    xlim(0,200)
    legend((w1,w23), ('Swb 1','Swb 2+3'))

    p= subplot(313)
    eta1 = data['etaHat1']
    eta2 = data['etaHat2']
    eta3 = data['etaHat3']
    etaHatTime = data['etaHatTime']
    xLF, = plot(etaHatTime,eta1 ,'k-')
    yLF, = plot(etaHatTime,eta2 ,'r-')
    p.yaxis.set_label_coords(labelx1, 0.5)
    p.yaxis.set_major_locator(MaxNLocator(6))
    ylabel(r'Estm. low frequency position [m]')
    xlabel(r'time [s]')
    xlim(0,600)
    ylim(ymax=4)
    legend((xLF,yLF),('North position error','East position error'))
    savefig('figures/%s.pdf' % name)

makeFigure('omae')
