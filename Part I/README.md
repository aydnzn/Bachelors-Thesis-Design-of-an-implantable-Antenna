# Bachelor's Thesis: Design of an Implantable Antenna for Microwave Hyperthermia (Part I)

Welcome to the GitHub repository for the first part of my Bachelor's Thesis on the design of an implantable antenna for microwave hyperthermia. 

## Introduction

This project aims at advancing healthcare by designing an implantable antenna that can combat infections, particularly those that follow hip replacement surgeries. Given the increased trend in hip replacement surgeries and the concomitant need for revisions, a significant focus has been placed on developing solutions to alleviate complications such as infection. These implants are envisioned to use microwave hyperthermia to prevent biofilm formation, facilitated by real-time feedback from the antenna.

## Methodology and Analysis

### Cavity-Backed Slot Antenna (CBSA)
A CBSA, backed with a rectangular cavity for unidirectional radiation, was chosen for its benefits including low profile, light weight, and ease of integration. The CBSA was designed to operate at 2.4 GHz, an allowed band for body area networks or medical applications. The CBSA's performance was assessed in terms of return loss and radiation pattern. After optimization, the most critical parameters identified for matching were the width and the length of the stripline.

### Coaxial-Slot Antenna
After establishing that CBSA cannot provide adequate heating, a coaxial-slot antenna was modeled, which confirmed the success of my thermal analysis setup. The coaxial-slot antenna's SAR distribution and thermal analysis were found satisfactory, hence, it was deemed a viable solution.

### C-Type Slotted Antenna
A C-type slotted antenna was designed to achieve larger SAR values, simulating its performance within a hip implant. Although the heating was improved compared to the CBSA, it did not meet the evaluation criterion for microwave hyperthermia (heating up to 40 °C).

## Conclusion

The project described the development and simulation of implantable antennas aimed at counteracting microwave hyperthermia. Despite challenges such as defining an exact medium for simulation and acquiring limited documentation on using Ansys Workbench for biomedical purposes, substantial learning outcomes were achieved in using the HFSS and Workbench software applications.

## Future Work

The next stages of the project will focus on designing an antenna that demonstrates better heating performance. More antenna types will be reviewed and tested with a goal to finalize a specific antenna for prototyping. Simulations will be completed and the prototyping phase will commence in the next academic semester.

## Repository Structure

This repository contains several important documents and resources related to my project:

- `Project_proposal.pdf`: This document contains the initial proposal for my project.
- `Midterm_report.pdf`: This is my midterm report, which was submitted on 20th March 2019.
- `Presentation.pdf`: Here, you'll find my final presentation for this part of my thesis.
- `Final_report.pdf`: This document is the final report for this part of my thesis, which was submitted on 1st June 2019.
- `./figs/`: This directory contains several screenshots taken during the simulations conducted as part of my research.