# Simpson
## Numerical simulations in NMR using SIMPSON

The link to the github repo is:
[SIMPSON](https://github.com/dnp-grenoble/simpson)

The simulation files are mainly guides. Modify them as you feel like and if there are some errors, please let me know. I am not responsible if there do not work as intended. Please follow courses in the SIMPSON website.


[INANO website](https://inano.au.dk/about/research-centers-and-projects/nmr/software/simpson)

More simulation files will be added in due course.

### Homonuclear Recoupling
The main file allseq_HH_modular.in calculates the build up of the DQ magnetisation as a function of the mixing time of the recoupling sequence applied. It asks the user for an input of the recoupling sequence needed.
The recoupling sequence is then taken from the file recoupling.tcl.

The recoupling sequence that have been implemented are:
1. S3
2. [S3] - Bracketed S3
3. SR26
4. POST C7
5. R-sequence: Flexible N, n, and $\nu$
6. BABA
7. $SW_f$-BABA

### RESPDOR

There are two variants of RESPDOR in the repository.
1. [R-RESPDOR](https://doi.org/10.1039/B611447D.
): Gan, Z.  Chem. Commun. 2006, No. 45, 4712–4714. 
2. [S-RESPDOR](https://doi.org/10.1016/j.jmr.2011.12.009.): Lu, X.; Lafon, O.; Trébosc, J.; Amoureux, J.-P. J. Mag. Reson. 2012, 215, 34–49. 

### TEDOR

There are two variants of TEDOR here, the first one is conventional tedor as simulated in the file tedor.in. The zftedor is a variant of out-and-back TEDOR as proposed in the following paper by Christopher Jaroniec:


Jaroniec, C. P.; Filip, C.; Griffin, R. G. 3D TEDOR NMR Experiments for the Simultaneous Measurement of Multiple Carbon−Nitrogen Distances in Uniformly 13 C, 15 N-Labeled Solids. Journal of the American Chemical Society 2002, 124 (36), 10728–10742. https://doi.org/10.1021/ja026385y.


### Heteronuclear Decoupling   
The hetdec.in file contains the option to simulate various heteronuclear decoupling sequences in solid-state NMR. For the spin system, I have chosen a $CH_2$ spin-system and the decoupling sequences that I have implemented are CW, rCW, TPPM, $SW_f$ - TPPM, SPINAL64, and XiX. The sequences can be improved by changing various parameters. I leave it up to the people interested in the topic. I have already done a PhD on it! So I am not going into optimisation of sequences.

If you want to just run one sequence, you can modify the code in the following manner:
```
foreach dectype [list cw tppm swftppm spinal64 xix rcw]

foreach dectype [list tppm]
```
In this example, it will just do tppm instead of all the sequences.

### Quadrupolar NMR
The mq_excitation.in helps you to cimulate how much MQ efficiency you can get as a function of pulse length. One can change parameters like RF power, spinning frequency, $C_q$ and see how much the efficiency changes.


### Third Spin Assisted Recoupling
The files par_grid.in and pain_grid.in simulates third spin assisted recoupling maps as reported in the papers:
 - Lewandowski, J. R. et al. Journal of the American Chemical Society 2009, 131 (16), 5769–5776. https://doi.org/10.1021/ja806578y.
- De Paëpe, G. et. al. Journal of Chemical Physics 2008, 129 (24), 245101. https://doi.org/10.1063/1.3036928.
- Paul, S. et. al. Annual Reports on NMR Spectroscopy; 2015; Vol. 85, pp 93–142. https://doi.org/10.1016/bs.arnmr.2014.12.003.

The files uses acq_block and block diagonalisation to speed up the simulation. The spin system is derived from the xyz coordinates of L-Alanine.


