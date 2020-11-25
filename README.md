# hotwire

This repository contains a Jupyter notebook used for a hands-on computer session in a Masters class on Turbulence in Fluids at ENS de Lyon.
The goal is to analyze longitudinal velocity measurements made with a hot wire in a wind tunnel at ENS de Lyon.
The experiment was conducted by Christophe Baudet and Antoine Naert.

The notebook contains the questions and some tips.

This notebook is adapted after a document written by Laurent Chevillard.

## How to use

### On the cloud

You can try this notebook without installing or downloading anything on your machine, by using Binder:
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/git/https%3A%2F%2Fframagit.org%2Fcherbert%2Fhotwire/solution)

However, depending on the resources available on the machine assigned to you, some questions may require handling the memory carefully.
For instance, the solution notebook cannot be run entirely on most binder hosts in its current form.
If you use this repository for teaching, we recommand for now either using a computer room in your university, or giving remote access (through SSH) to dedicated machines in your department to the students. In both cases, follow the instructions in the next section after logging in.
An alternative is to setup your own `binderhub` instance.

### On a local machine

Open a terminal and type the following commands:

```
git clone https://framagit.org/cherbert/hotwire
cd hotwire && make install
```

This will automatically download the data, setup a virtual environment and open the notebook in your browser.

## Prospects

In the future I may add data from Direct Numerical Simulations, in addition to the experimental data.
