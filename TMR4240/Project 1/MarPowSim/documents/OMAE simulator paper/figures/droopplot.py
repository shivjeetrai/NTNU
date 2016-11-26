from pylab import *



#fig_width_pt = 251.8  # Get this from LaTeX using \showthe\columnwidth
#inches_per_pt = 1.0/72.27               # Convert pt to inch
golden_mean = (sqrt(5)-1.0)/2.0         # Aesthetic ratio
fig_width = 6.5/2  # width in inches
fig_height = fig_width*golden_mean      # height in inches
fig_size =  [fig_width,fig_height]
params = {'backend': 'ps',
          'axes.labelsize': 10,
          'text.fontsize': 10,
          'legend.fontsize': 10,
          'xtick.labelsize': 10,
          'ytick.labelsize': 10,
          'text.usetex': True,
          'font.family': 'serif',
          'font.serif': 'Computer Modern Roman',
          'figure.figsize': fig_size}
#matplotlib.rcParams['text.latex.preamble']=[r"\usepackage{amsfont}"]
rcParams.update(params)
# Generate data
figure(1)
clf()
#
axes([0.2, 0.2, 0.7, 0.7])
c = plot((0, 1),(1.025,.975))
xlabel('Active power [pu]')
ylabel(r'Frequency [pu]')
xlim(0,1)
ylim(.97,1.03)
#p.axes.set_xticklabels([])
#p.yaxis.set_label_coords(labelx1, 0.5)
savefig('droop.pdf')
