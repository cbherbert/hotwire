"""
This file serves as a cheat sheet for the `hotwire` notebook.
In class, students can just import functions defined here instead of having to write the code
themselves to save time (at the discretion of the teacher).
"""
import numpy as np

def autocorrelation_naive(x):
    """
    Compute autocorrelation function directly in real space

    http://stackoverflow.com/q/14297012/190597
    http://en.wikipedia.org/wiki/Autocorrelation#Estimation
    """
    n = len(x)
    variance = x.var()
    x = x-x.mean()
    r = np.correlate(x, x, mode='full')[-n:]
    result = r/(variance*(np.arange(n, 0, -1)))
    return result

def autocorrelation_spectral(x):
    """
    Compute autocorrelation function using FFTs

    Caveat: to get the right overall normalization,
    we play with the normalizations of the direct
    and inverse Fourier transforms.
    """
    return np.fft.irfft(np.abs(np.fft.rfft(x, norm='ortho'))**2, norm=None)

def annotate_axis_scales(ax, etaK, lambdaT, L0, **kwargs):
    """
    Add vertical lines indicating the characteristic scales on an axes object
    """
    scales = (2*np.pi/etaK, 2*np.pi/lambdaT, 2*np.pi/L0) if kwargs.pop('spectral', False) else (etaK, lambdaT, L0)
    line_style = dict(color='black', ls='dashed')
    line_style.update(kwargs)
    ax2 = ax.twiny()
    ax2.set_xlim(ax.get_xlim())
    ax2.set_xscale(ax.get_xscale())
    ax2.xaxis.set_ticks_position('none')
    ax2.set_xticks(scales)
    ax2.set_xticklabels((r'$\eta$', r'$\lambda$', r'$L_0$'))
    for scale in scales:
        ax2.axvline(x=scale, **line_style)
    return ax2

def structure_function(data, order, scales):
    """
    Return the structure function S_n(l) of order n
    for the scales corresponding to the input indices.
    """
    return np.array([np.mean((data[:, k:]-data[:, :-k])**order) for k in scales])

def increment_scale(Lmin, Lmax, nincr, deltax=3.2384658/2.3e4):
    """
    Return the indices corresponding to nincr logarthmically spaced increments
    between scales Lmin and Lmax.
    """
    logscales = np.logspace(np.log10(Lmin), np.log10(Lmax), num=nincr)
    return np.trim_zeros(np.ceil((logscales-logscales[0])/deltax).astype(int))
