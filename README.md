# Simpson
## Numerical simulations in NMR using SIMPSON

The link to the github repo is:
[SIMPSON](https://github.com/dnp-grenoble/simpson)

The simulation files are mainly guides. Modify them as you feel like and if there are some errors, please let me know. Please note that I am not responsible if they do not work as intended. Please follow courses or tutorials posted on the SIMPSON website.


[INANO website](https://inano.au.dk/about/research-centers-and-projects/nmr/software/simpson)

Four publications that may be helpful are:
1. Bak, Mads, Jimmy T. Rasmussen, and Niels Chr Nielsen. ‘SIMPSON: A General Simulation Program for Solid-State NMR Spectroscopy’. Journal of Magnetic Resonance 147, no. 2 (December 2000): 296–330. https://doi.org/10.1006/jmre.2000.2179.
2. Juhl, Dennis W., Zdeněk Tošner, and Thomas Vosegaard. ‘Versatile NMR Simulations Using SIMPSON’. In Annual Reports on NMR Spectroscopy, 100:1–59. Elsevier, 2020. https://doi.org/10.1016/bs.arnmr.2019.12.001.
3. Tošner, Zdeněk, Rasmus Andersen, Baltzar Stevensson, Mattias Edén, Niels Chr Nielsen, and Thomas Vosegaard. ‘Computer-Intensive Simulation of Solid-State NMR Experiments Using SIMPSON’. Journal of Magnetic Resonance 246 (September 2014): 79–93. https://doi.org/10.1016/j.jmr.2014.07.002.
4. Vosegaard, Thomas, Anders Malmendal, and Niels C Nielsen. ‘The Flexibility of SIMPSON and SIMMOL for Numerical Simulations in Solid-and Liquid-State NMR Spectroscopy’. Monatshefte f?R Chemie / Chemical Monthly 133, no. 12 (1 December 2002): 1555–74. https://doi.org/10.1007/s00706-002-0519-2.


More simulation files will be added in due course.

### Homonuclear Recoupling
The main file allseq_HH_modular.in :scroll: calculates the build up of the DQ magnetisation as a function of the mixing time of the recoupling sequence applied. It asks the user for an input of the recoupling sequence needed.
The recoupling sequence is then taken from the file recoupling.tcl.

The recoupling sequence that have been implemented are:
1. S3
2. [S3] - Bracketed S3
3. SR26
4. POST C7
5. R-sequence: Flexible N, n, and $\nu$
6. BABA
7. $SW_f$-BABA

The files S3_CC.in:scroll: and SR26_CC.in :scroll: simulates the buildup of polarisation using reusable propagators to speed up the calculations. The spin system and parameters are that of formic acid to reproduce some of the simulations reported in the literature.

The file brS3_CC.in :scroll: simulates the DQ buildup in the same spin system but with bracketed S3 as reported in the paper G. Teymoori et al. Journal of Magnetic Resonance 261 (2015) 205–220. The scaling and faster build up of bracketed version is evident from the figure S3vsbrS3_scaling.png.

The file c14_3spin_relayed_transfer.in :scroll: simulates how much leakage or transfer you can get when you have a third spin involved.
For this the file simulates the polarisation transfer profile as reported in the publication Brinkmann, Andreas, M Edén, and M H Levitt. ‘Synchronous Helical Pulse Sequences in Magic-Angle Spinning Nuclear Magnetic Resonance: Double Quantum Recoupling of Multiple-Spin Systems’. The Journal of Chemical Physics 112, no. 19 (2000): 8539–54. 

The file *refocused_inadequate.in* :scroll: helps to simulate the transfer efficiency for the sequence given in the papers:
1. Nakai, T., and C. A. Mcdowell. *J. Magn. Reson.* 104 (1993) 146
2. Cadars et al. *J. Phys. Chem. B.* 110 (2006) 16982." \

It does not include relaxation, but it can be added as Lorentzian broadening or during plotting.

The file S3SR26_SiSi_varydist.in :scroll: helps you to do a grid simulation where in one dimension you have distance and in the other axis you have the recoupling time. The resulting contour gives you the polarisation transfer efficiency.

### RESPDOR

There are two variants of RESPDOR in the repository.
1. [R-RESPDOR](https://doi.org/10.1039/B611447D.
): Gan, Z.  Chem. Commun. 2006, No. 45, 4712–4714. 
2. [S-RESPDOR](https://doi.org/10.1016/j.jmr.2011.12.009.): Lu, X.; Lafon, O.; Trébosc, J.; Amoureux, J.-P. J. Mag. Reson. 2012, 215, 34–49. 

### TEDOR

There are two variants of TEDOR here, the first one is conventional tedor as simulated in the file tedor.in :scroll:. The zftedor :scroll: is a variant of out-and-back TEDOR as proposed in the following paper by Christopher Jaroniec:

Jaroniec, C. P.; Filip, C.; Griffin, R. G. 3D TEDOR NMR Experiments for the Simultaneous Measurement of Multiple Carbon−Nitrogen Distances in Uniformly 13 C, 15 N-Labeled Solids. Journal of the American Chemical Society 2002, 124 (36), 10728–10742. https://doi.org/10.1021/ja026385y.

Added a file zftedor_filter.in :scroll:, where the phase cycling of the zftedor.in :scroll: has been removed. 

### Heteronuclear Decoupling   
The hetdec.in :scroll: file contains the option to simulate various heteronuclear decoupling sequences in solid-state NMR. For the spin system, I have chosen a $CH_2$ spin-system and the decoupling sequences that I have implemented are CW, rCW, TPPM, $SW_f$ - TPPM, SPINAL64, and XiX. The sequences can be improved by changing various parameters. I leave it up to the people interested in the topic. I have already done a PhD on it! So I am not going into optimisation of sequences.

If you want to just run one sequence, you can modify the code in the following manner:
```
foreach dectype [list cw tppm swftppm spinal64 xix rcw]

foreach dectype [list tppm]
```
In this example, it will just do tppm instead of all the sequences.

### Quadrupolar NMR
The mq_excitation.in :scroll: helps you to simulate how much MQ efficiency you can get as a function of pulse length. One can change parameters like RF power, spinning frequency, $C_q$ and see how much the efficiency changes.

Quadrupolar excitation and detection of central transition can be done in the frequency space using quadmas.in :scroll:

Low power central transition selective cross-polarisation 
can be performed using quadcpmas_detect.in :scroll:

One can compare between the direct excitation and the CP spectrum if needed.

### Third Spin Assisted Recoupling
The files par_grid.in :scroll: and pain_grid.in :scroll:simulates third spin assisted recoupling maps as reported in the papers:
 - Lewandowski, J. R. et al. Journal of the American Chemical Society 2009, 131 (16), 5769–5776. https://doi.org/10.1021/ja806578y.
- De Paëpe, G. et. al. Journal of Chemical Physics 2008, 129 (24), 245101. https://doi.org/10.1063/1.3036928.
- Paul, S. et. al. Annual Reports on NMR Spectroscopy; 2015; Vol. 85, pp 93–142. https://doi.org/10.1016/bs.arnmr.2014.12.003.

The files uses acq_block and block diagonalisation to speed up the simulation. The spin system is derived from the xyz coordinates of L-Alanine.

The file pspar_grid.in :scroll: simulates a modified version of PAR to make it broadbanded. The simulations are done for a field strength of 900 MHz (1H Larmor freq) and 60 kHz MAS frequency. The relevant literature is:
- Giffard, Mathilde, *et. al.* Physical Chemistry Chemical Physics : PCCP 14, no. 20 (May 2012): 7246–55. https://doi.org/10.1039/c2cp40406k.


### Cross Polarisation

The file cpmas.in :scroll: simulates the polarisation buildup for a CH2-CO kind of system.
The RF pulses employed here are square pulses.


### Homonuclear Decoupling

The file wpmlg.in 📜can be used to simulate windowed PMLG sequence decoupling. The two decoupling sequences demonstrated here are wPMLGmmbar and wPMLGppbar. More details about these sequences can be found in the paper:
- Leskes, Michal, et al. ‘Proton Line Narrowing in Solid-State Nuclear Magnetic Resonance: New Insights from Windowed Phase-Modulated Lee-Goldburg Sequence.’ JCP 125 (2006) 124506. https://doi.org/10.1063/1.2352737.
- Leskes, Michal et al. ‘Supercycled Homonuclear Dipolar Decoupling in Solid-State NMR: Toward Cleaner H1 Spectrum and Higher Spinning Rates’. JCP 128(2008) 052309. https://doi.org/10.1063/1.2834730.

The file wlg4.in can be used to simulate subsampled LG4 kind of decoupling. The scaling factor with an added phase of 55 degrees is similar to that of wPMLG.
More details about this sequence can be found in the paper: 
- Halse, Meghan E., et al. ‘High-Resolution 1H Solid-State NMR Spectroscopy Using Windowed LG4 Homonuclear Dipolar Decoupling’. Israel Journal of Chemistry 54, no. 1–2 (2014): 136–46. https://doi.org/10.1002/ijch.201300101.


The file wLG-N.in 📜 can be used to simulate FSLG or LG4 kind of decoupling. FSLG can be implemented using N = 1; LG4 can be implemented setting N = 2, LG6 as N = 3, and so on.
More about supercycled FS/PM - LG sequences can be found in the following literatures:
- Halse, Meghan E., et al. ‘High-Resolution 1H Solid-State NMR Spectroscopy Using Windowed LG4 Homonuclear Dipolar Decoupling’. Israel Journal of Chemistry 54, no. 1–2 (2014): 136–46. https://doi.org/10.1002/ijch.201300101.
- Paul, S., et al. ‘Supercycled Homonuclear Dipolar Decoupling Sequences in Solid-State NMR’. Journal of Magnetic Resonance 197, no. 1 (2009): 14–19. https://doi.org/10.1016/j.jmr.2008.11.011.

