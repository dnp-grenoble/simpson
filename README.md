# SIMPSON

## Numerical simulations in solid-state NMR using SIMPSON

[![DOI](https://zenodo.org/badge/475826355.svg)](https://doi.org/10.5281/zenodo.17457239)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A collection of annotated [SIMPSON](https://inano.au.dk/about/research-centers-and-projects/nmr/software/simpson) input files (`.in`) for common solid-state NMR pulse sequences — homo- and heteronuclear recoupling, decoupling, cross-polarisation, quadrupolar excitation, TEDOR, RESPDOR, DIPSHIFT, and third-spin-assisted recoupling (TSAR). Each script reproduces or closely follows simulations from the literature, with the reference given alongside it.

> **Disclaimer:** these files are teaching/starting-point scripts, not a validated package. Modify them freely, but please follow the official SIMPSON courses/tutorials for the underlying theory, and open an issue if you spot an error — no guarantee is made that any given script works as intended out of the box.

If you use these scripts, please cite the repository — see [Citing this repository](#citing-this-repository).

---

## Table of contents

- [Requirements & running a simulation](#requirements--running-a-simulation)
- [Repository structure](#repository-structure)
- [Index of simulations](#index-of-simulations)
- [Homonuclear recoupling](#homonuclear-recoupling)
- [Heteronuclear recoupling](#heteronuclear-recoupling)
  - [RESPDOR](#respdor)
  - [TEDOR](#tedor)
  - [DIPSHIFT](#dipshift)
- [Heteronuclear decoupling](#heteronuclear-decoupling)
- [Quadrupolar NMR](#quadrupolar-nmr)
- [Third-spin-assisted recoupling (TSAR)](#third-spin-assisted-recoupling-tsar)
- [Cross polarisation](#cross-polarisation)
- [Homonuclear decoupling](#homonuclear-decoupling)
- [Key SIMPSON references](#key-simpson-references)
- [Citing this repository](#citing-this-repository)
- [Contributing](#contributing)
- [License](#license)

---

## Requirements & running a simulation

You need a working install of **[SIMPSON](https://inano.au.dk/about/research-centers-and-projects/nmr/software/simpson)** (the Tcl-scriptable spin-dynamics simulation package from Aarhus/Vosegaard & Nielsen). Installation instructions and binaries are on the INANO website linked above.

Once SIMPSON is installed and on your `PATH`, run any script from its own directory, e.g.:

```bash
cd homonuclear_recoupling
simpson S3_CC.in
```

Some scripts (e.g. `S3_CC.in`, `SR26_CC.in`) prompt interactively for a recoupling time in ms. Others (e.g. `hetdec.in`, `mq_excitation.in`) loop over several sequences or parameter values automatically and write one output file per case. Outputs are plain-text `.txt`/`.fid` files (real/imaginary columns) that you can plot with your tool of choice (e.g. `xreim`, Python, Origin).

`allseq_HH_modular.in` additionally requires `recoupling.tcl` to be present in the same directory — it holds the actual pulse-sequence definitions and is sourced at runtime.

---

## Repository structure

```
simpson/
├── homonuclear_recoupling/      S3, bracketed-S3, SR26, POST-C7, R-sequences, BABA, SWf-BABA
├── heteronuclear_recoupling/    DIPSHIFT
├── respdor/                     R-RESPDOR, S-RESPDOR
├── tedor/                       TEDOR, zf-TEDOR (with/without phase cycling)
├── heteronuclear_decoupling/    CW, rCW, TPPM, SWf-TPPM, SPINAL-64, XiX
├── quadrupoles/                 MQ excitation, quad-MAS detection, low-power CT-selective CP, quad x dipole SIMPSON v6
├── tsar/                        PAR, PAIN-CP, broadband PAR grid simulations
├── cross_polarisation/          Square-pulse CP, ramped CP
└── homonuclear_decoupling/      wPMLG, wLG-N (FSLG/LG4/LG6), subsampled LG4
```

## Index of simulations

| Category | File | What it simulates | Key reference |
|---|---|---|---|
| Homonuclear recoupling | `allseq_HH_modular.in` + `recoupling.tcl` | DQ buildup vs. mixing time; select S3, [S3], SR26, POST-C7, R-sequences, BABA, SWf-BABA interactively | — |
| Homonuclear recoupling | `S3_CC.in` | S3 DQ buildup with reusable propagators (fumaric acid) | Teymoori et al., *J. Magn. Reson.* 261 (2015) 205–220 |
| Homonuclear recoupling | `SR26_CC.in` | SR26 DQ buildup with reusable propagators | Teymoori et al., *J. Magn. Reson.* 261 (2015) 205–220 |
| Homonuclear recoupling | `brS3_CC.in` | Bracketed-S3 DQ buildup (faster build-up vs. plain S3) | Teymoori et al., *J. Magn. Reson.* 261 (2015) 205–220 |
| Homonuclear recoupling | `c14_3spin_relayed_transfer.in` | Leakage/relayed transfer in a 3-spin system | Brinkmann, Edén & Levitt, *J. Chem. Phys.* 112 (2000) 8539–54 |
| Homonuclear recoupling | `refocused_inadequate.in` | Transfer efficiency of refocused INADEQUATE | Nakai & Mcdowell, *J. Magn. Reson.* 104 (1993) 146; Cadars et al., *J. Phys. Chem. B* 110 (2006) 16982 |
| Homonuclear recoupling | `S3SR26_SiSi_varydist.in` | 2D grid: transfer efficiency vs. distance and recoupling time | — |
| Heteronuclear recoupling | `dipshift.in` | Constant-time DIPSHIFT dephasing/rephasing curve | Jain, Rajalakshmi, Agarwal, Madhu & Mote, *J. Magn. Reson.* 308 (2019) 106563 |
| Heteronuclear recoupling | `dipshift_finitepulse.in` | DIPSHIFT with finite pulses (keeps the curve symmetric) | same as above |
| RESPDOR | `r-respdor.in` | R-RESPDOR dephasing | Gan, *Chem. Commun.* 2006, 4712–4714 |
| RESPDOR | `s-respdor.in` | S-RESPDOR dephasing | Lu, Lafon, Trébosc & Amoureux, *J. Magn. Reson.* 215 (2012) 34–49 |
| TEDOR | `tedor.in` | Conventional TEDOR | Jaroniec, Filip & Griffin, *JACS* 124 (2002) 10728–10742 |
| TEDOR | `zftedor.in` | Z-filtered out-and-back TEDOR | same as above |
| TEDOR | `zftedor_filter.in` | zf-TEDOR without phase cycling | same as above |
| Heteronuclear decoupling | `hetdec.in` | CW, rCW, TPPM, SWf-TPPM, SPINAL-64, XiX decoupling on a CH₂ spin system | — |
| Quadrupolar NMR | `mq_excitation.in` | MQ excitation efficiency vs. pulse length, RF, spin rate, Cq | — |
| Quadrupolar NMR | `quadmas.in` | Quadrupolar central-transition excitation/detection in frequency space | — |
| Quadrupolar NMR | `quadcpmas_detect.in` | Low-power central-transition-selective CP | — |
| Quadrupolar NMR | `quad_x_dipole.in` | Quadrupolar x Dipolar coupling and their effect | -- |
| TSAR | `par_grid.in` | PAR third-spin-assisted recoupling map (L-alanine, from xyz coords) | Lewandowski et al., *JACS* 131 (2009) 5769–5776; De Paëpe et al., *J. Chem. Phys.* 129 (2008) 245101; Paul et al., *Annu. Rep. NMR Spectrosc.* 85 (2015) 93–142 |
| TSAR | `pain_grid.in` | PAIN-CP third-spin-assisted recoupling map | same as above |
| TSAR | `pspar_grid.in` | Broadbanded PAR variant (900 MHz, 60 kHz MAS) | Giffard et al., *PCCP* 14 (2012) 7246–55 |
| Cross polarisation | `cpmas.in` | Square-pulse CP buildup, CH₂–CO-type system | — |
| Cross polarisation | `rampcp.in` | Ramped CP | — |
| Homonuclear decoupling | `wpmlg.in` | Windowed PMLG (wPMLGmmbar, wPMLGppbar) | Leskes et al., *J. Chem. Phys.* 125 (2006) 124506 and 128 (2008) 052309 |
| Homonuclear decoupling | `wlg4.in` | Subsampled LG4, 55° phase offset | Halse et al., *Isr. J. Chem.* 54 (2014) 136–46 |
| Homonuclear decoupling | `wLG-N.in` | General FSLG/LG-N family (N=1 → FSLG, N=2 → LG4, N=3 → LG6, …) | Halse et al. (2014); Paul et al., *J. Magn. Reson.* 197 (2009) 14–19 |

---

### Homonuclear recoupling

The main file `allseq_HH_modular.in` :scroll: calculates the DQ magnetisation buildup as a function of the recoupling sequence's mixing time. It asks the user for the recoupling sequence to use, which is then pulled from `recoupling.tcl`.

Implemented sequences:
1. S3
2. [S3] — bracketed S3
3. SR26
4. POST-C7
5. R-sequence: flexible N, n, and ν
6. BABA
7. SWf-BABA

`S3_CC.in` :scroll: and `SR26_CC.in` :scroll: simulate polarisation buildup using reusable propagators to speed up the calculation. The spin system and parameters are those of formic acid, reproducing simulations reported in the literature.

`brS3_CC.in` :scroll: simulates DQ buildup in the same spin system but with bracketed S3, as reported in Teymoori et al., *J. Magn. Reson.* 261 (2015) 205–220. The scaling and faster buildup of the bracketed version relative to plain S3 is shown in `S3vsbrS3_scaling.png`.

`c14_3spin_relayed_transfer.in` :scroll: simulates how much leakage/transfer occurs when a third spin is involved, reproducing the polarisation-transfer profile from Brinkmann, Edén & Levitt, *J. Chem. Phys.* 112, no. 19 (2000): 8539–54.

`refocused_inadequate.in` :scroll: helps simulate the transfer efficiency for the sequence given in:
1. Nakai, T., and C. A. Mcdowell. *J. Magn. Reson.* 104 (1993) 146.
2. Cadars et al. *J. Phys. Chem. B* 110 (2006) 16982.

It does not include relaxation, but this can be added afterwards as Lorentzian broadening during plotting.

`S3SR26_SiSi_varydist.in` :scroll: runs a grid simulation with distance on one axis and recoupling time on the other; the resulting contour gives the polarisation-transfer efficiency.

### Heteronuclear recoupling

#### RESPDOR

Two variants of RESPDOR are included:
1. [R-RESPDOR](https://doi.org/10.1039/B611447D): Gan, Z. *Chem. Commun.* 2006, No. 45, 4712–4714.
2. [S-RESPDOR](https://doi.org/10.1016/j.jmr.2011.12.009): Lu, X.; Lafon, O.; Trébosc, J.; Amoureux, J.-P. *J. Magn. Reson.* 2012, 215, 34–49.

#### TEDOR

Two variants of TEDOR are included. `tedor.in` :scroll: is conventional TEDOR. `zftedor.in` :scroll: is a variant of out-and-back TEDOR proposed by Christopher Jaroniec:

Jaroniec, C. P.; Filip, C.; Griffin, R. G. 3D TEDOR NMR Experiments for the Simultaneous Measurement of Multiple Carbon–Nitrogen Distances in Uniformly ¹³C, ¹⁵N-Labeled Solids. *Journal of the American Chemical Society* 2002, 124 (36), 10728–10742. https://doi.org/10.1021/ja026385y.

`zftedor_filter.in` :scroll: is the same sequence with the phase cycling of `zftedor.in` removed.

#### DIPSHIFT

DIPSHIFT is a REDOR variant with a constant-time experiment that monitors dephasing and rephasing within one rotor period. `dipshift.in` 📜 is based on:

Jain, Mukul G., G. Rajalakshmi, Vipin Agarwal, P. K. Madhu, and Kaustubh R. Mote. "On the Direct Relation between REDOR and DIPSHIFT Experiments in Solid-State NMR." *Journal of Magnetic Resonance* 308 (November 2019): 106563. https://doi.org/10.1016/j.jmr.2019.07.050.

`dipshift_finitepulse.in` 📜 uses finite pulses and can help keep the DIPSHIFT curve symmetric.

### Heteronuclear decoupling

`hetdec.in` :scroll: simulates various heteronuclear decoupling sequences on a CH₂ spin system: CW, rCW, TPPM, SWf-TPPM, SPINAL-64, and XiX. These are starting points — feel free to improve on them; optimisation of decoupling sequences is a topic of its own.

To run just one sequence instead of the full list, edit the loop in `main {}`:
```tcl
foreach dectype [list cw tppm swftppm spinal64 xix rcw]
```
to, e.g.:
```tcl
foreach dectype [list tppm]
```

### Quadrupolar NMR

`mq_excitation.in` :scroll: simulates MQ excitation efficiency as a function of pulse length; you can vary RF power, spinning frequency, and Cq to see how efficiency changes.

`quadmas.in` :scroll: performs quadrupolar central-transition excitation and detection in the frequency domain.

`quadcpmas_detect.in` :scroll: performs low-power central-transition-selective cross-polarisation. Compare its spectrum against direct excitation if needed.

`quad_x_dipole.in`: :scroll: an example of how spectrum of a nuclei is affected when there is both quadrupolar and dipolar coupling.

### Third-spin-assisted recoupling (TSAR)

`par_grid.in` :scroll: and `pain_grid.in` :scroll: simulate third-spin-assisted recoupling maps, as reported in:
- Lewandowski, J. R. et al. *Journal of the American Chemical Society* 2009, 131 (16), 5769–5776. https://doi.org/10.1021/ja806578y.
- De Paëpe, G. et al. *Journal of Chemical Physics* 2008, 129 (24), 245101. https://doi.org/10.1063/1.3036928.
- Paul, S. et al. *Annual Reports on NMR Spectroscopy*; 2015; Vol. 85, pp 93–142. https://doi.org/10.1016/bs.arnmr.2014.12.003.

These files use `acq_block` and block diagonalisation to speed up the simulation. The spin system is derived from the xyz coordinates of L-alanine.

`pspar_grid.in` :scroll: simulates a broadbanded PAR variant, for a 900 MHz (¹H Larmor frequency) field and 60 kHz MAS. Reference:
- Giffard, Mathilde et al. *Physical Chemistry Chemical Physics* 14, no. 20 (May 2012): 7246–55. https://doi.org/10.1039/c2cp40406k.

### Cross polarisation

`cpmas.in` :scroll: simulates polarisation buildup for a CH₂–CO-type system using square RF pulses.

`rampcp.in` 📜 simulates cross polarisation using a ramp.

### Homonuclear decoupling

`wpmlg.in` 📜 simulates windowed PMLG decoupling (wPMLGmmbar and wPMLGppbar). See:
- Leskes, Michal, et al. "Proton Line Narrowing in Solid-State Nuclear Magnetic Resonance: New Insights from Windowed Phase-Modulated Lee-Goldburg Sequence." *JCP* 125 (2006) 124506. https://doi.org/10.1063/1.2352737.
- Leskes, Michal et al. "Supercycled Homonuclear Dipolar Decoupling in Solid-State NMR: Toward Cleaner ¹H Spectrum and Higher Spinning Rates." *JCP* 128 (2008) 052309. https://doi.org/10.1063/1.2834730.

`wlg4.in` simulates subsampled LG4-type decoupling; with a 55° added phase, its scaling factor is similar to wPMLG. See:
- Halse, Meghan E., et al. "High-Resolution ¹H Solid-State NMR Spectroscopy Using Windowed LG4 Homonuclear Dipolar Decoupling." *Israel Journal of Chemistry* 54, no. 1–2 (2014): 136–46. https://doi.org/10.1002/ijch.201300101.

`wLG-N.in` 📜 simulates FSLG- or LG4-type decoupling generally: N = 1 gives FSLG, N = 2 gives LG4, N = 3 gives LG6, and so on. See:
- Halse, Meghan E., et al. (2014), as above.
- Paul, S., et al. "Supercycled Homonuclear Dipolar Decoupling Sequences in Solid-State NMR." *Journal of Magnetic Resonance* 197, no. 1 (2009): 14–19. https://doi.org/10.1016/j.jmr.2008.11.011.

---

## Key SIMPSON references

1. Bak, Mads, Jimmy T. Rasmussen, and Niels Chr Nielsen. "SIMPSON: A General Simulation Program for Solid-State NMR Spectroscopy." *Journal of Magnetic Resonance* 147, no. 2 (December 2000): 296–330. https://doi.org/10.1006/jmre.2000.2179.
2. Juhl, Dennis W., Zdeněk Tošner, and Thomas Vosegaard. "Versatile NMR Simulations Using SIMPSON." In *Annual Reports on NMR Spectroscopy*, 100:1–59. Elsevier, 2020. https://doi.org/10.1016/bs.arnmr.2019.12.001.
3. Tošner, Zdeněk, Rasmus Andersen, Baltzar Stevensson, Mattias Edén, Niels Chr Nielsen, and Thomas Vosegaard. "Computer-Intensive Simulation of Solid-State NMR Experiments Using SIMPSON." *Journal of Magnetic Resonance* 246 (September 2014): 79–93. https://doi.org/10.1016/j.jmr.2014.07.002.
4. Vosegaard, Thomas, Anders Malmendal, and Niels C Nielsen. "The Flexibility of SIMPSON and SIMMOL for Numerical Simulations in Solid- and Liquid-State NMR Spectroscopy." *Monatshefte für Chemie / Chemical Monthly* 133, no. 12 (1 December 2002): 1555–74. https://doi.org/10.1007/s00706-002-0519-2.

## Citing this repository

If you use these scripts in research or teaching, please cite this repository (see [`CITATION.cff`](CITATION.cff)):

[![DOI](https://zenodo.org/badge/475826355.svg)](https://doi.org/10.5281/zenodo.17457239)

## Contributing

Suggestions, corrections, and additional sequences are welcome — please open an issue or pull request. This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).

## License

Released under the [MIT License](LICENSE).