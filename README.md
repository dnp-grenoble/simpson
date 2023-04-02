# Simpson
## Numerical simulations in NMR using SIMPSON

The official SIMPSON page can be found here: [INANO](https://inano.au.dk/about/research-centers-and-projects/nmr/software/simpson).

The files for simulation can be found in our github repository, Simpson.
https://github.com/dnp-grenoble/simpson



### TEDOR : SIMPSON file: tedor.in.
The file simulates a tedor buildup curve between <sup>15</sup>N and <sup>13</sup>C, with a dipolar coupling of 615 Hz.\
` dipole 1 2 615 0 0 0 ` \
The spinning frequency is set at 11.111 kHz.
Then it simulates the buildup curve for 64 rotor periods.
```
sw              spin_rate
np              64
```

### R-RESPDOR: SIMPSON file: r-respdor.in
Gan, Zhehong. Measuring Multiple Carbon-Nitrogen Distances in Natural Abundant Solids Using R-RESPDOR NMR.� Chem. Commun., no. 45 (2006): 4712-14. https://doi.org/10.1039/B611447D.

S-RESPDOR: SIMPSON file: s-respdor.in Lu, Xingyu, Olivier Lafon, Julien Trebosc, and Jean-Paul Amoureux. â€œDetailed Analysis of the S-RESPDOR Solid-State NMR Method for Inter-Nuclear Distance Measurement between Spin-1/2 and Quadrupolar Nuclei. Journal of Magnetic Resonance 215 (February 1, 2012): 34-49. https://doi.org/10.1016/j.jmr.2011.12.009.

H-H DQ - RECOUPLING: SIMPSON file: allseq_HH_modular.in This is file which takes input from the recoupling.tcl file as to which sequence you want and then does the DQ buildup.