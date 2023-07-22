# Bachelor's Thesis: Design of an Implantable Antenna for Microwave Hyperthermia

This Bachelor's thesis, divided into two distinct parts, explores the design of an implantable antenna for microwave hyperthermia. The work was conducted at the Antennas and Propagation Research Laboratory, [BOUNtenna](https://bountenna.boun.edu.tr), at Bogazici University under the guidance of [Assoc. Prof Sema Dumanli Oktar](https://academics.boun.edu.tr/sema.dumanli/).

To access individual parts of the thesis, use the following links: [Part I](./Part%20I/) and [Part II](./Part%20II/).

## Part I

### Project Aim

The primary goal of this project is to utilize technology to augment healthcare services. By designing implantable antennas, we aim to tackle the challenge of post-operative infections, especially those that occur post hip replacement surgeries. The rising trend of such surgeries and the subsequent need for revisions require innovative solutions to mitigate complications like infections. The proposed implants would use microwave hyperthermia to hinder biofilm formation, guided by real-time feedback from the antenna.

### Methodology and Analysis

#### Cavity-Backed Slot Antenna (CBSA)
CBSA was chosen due to its merits like low profile, light weight, and simple integration. Backed by a rectangular cavity for unidirectional radiation, CBSA was designed to operate at 2.4 GHz, a frequency allowed for body area networks or medical applications. The performance of CBSA was measured through return loss and radiation pattern, with the width and length of the stripline identified as crucial parameters post optimization.

#### Coaxial-Slot Antenna
Upon identifying the inadequacy of CBSA in providing adequate heating, a coaxial-slot antenna was modeled. This step validated the effectiveness of the thermal analysis setup, and due to its satisfactory SAR distribution and thermal analysis, the coaxial-slot antenna was chosen as a feasible solution.

#### C-Type Slotted Antenna
A C-type slotted antenna was designed to yield larger SAR values, simulating its performance within a hip implant. Though the heating was improved compared to CBSA, it didn't meet the set criterion for microwave hyperthermia (heating up to 40 °C).

### Conclusion and Future Work

Part I of this project encapsulates the development and simulation of implantable antennas with the aim to combat microwave hyperthermia. Despite facing challenges like defining an exact medium for simulation and limited documentation on Ansys Workbench for biomedical applications, significant knowledge was gained in utilizing HFSS and Workbench software applications.

Future work will focus on designing an antenna with superior heating performance. A wider range of antenna types will be explored and tested with the objective of finalizing a specific design for prototyping. Simulations will be concluded, and the prototyping phase will commence in the subsequent academic semester.

## Part II

This phase began with validating the thermal analysis from Part I, followed by designing a prototype antenna designed for heating at different frequencies. However, limitations led to a shift towards a miniaturized antenna design.

### Methodology

The methodology followed was sequential, starting with prototype antenna design, followed by miniaturized antenna design and measurement setup, phantom development, and concluding with thermal measurements.

A key part of this methodology was identifying the antenna's optimal operating frequency that leads to ideal SAR distribution, a process referred to as heating optimization.

### Prototype Antenna Design
The prototype design was a circular slot antenna, designed to operate at varying frequencies by adjusting the size of the slot. However, limitations arose while testing different frequencies with this setup.

### Miniaturized Antenna Design

Due to limitations faced during the prototype design phase, a transition was made to a more complex miniaturized antenna design, which offered the needed flexibility for testing across different frequencies.

### Measurement Setup

Considerations shifted towards post-production antenna measurements. The material was changed from human bone cortical to human fat for easier phantom production. The antenna was redesigned in the simulation program to fit in the measurement cup, and a feeding structure was added.

### Phantom Development

Phantom development was based on the methodology in this [article](https://ieeexplore.ieee.org/document/7152875), creating an artificial breast phantom replicating the dielectric and thermal properties of human fat. After adjusting the ratios of gelatin, water, and oil, the phantom's dielectric properties proved satisfactory.

### Antenna Production

Antenna production was done using an LPKF device, an in-house printed circuit board prototyping tool. The designed antenna's gerber files were loaded into the LPKF device, after which the feeding structure was soldered onto the antenna.

### Thermal Measurement

Heating at an input power of 6dbm was unobservable due to insufficient measuring equipment. As a result, input power was increased, using a signal generator from another lab. The results obtained were both intriguing and satisfactory.

### Conclusion

Despite several challenges, the project successfully led to the development and simulation of an implantable antenna operating at a frequency of 2.45 GHz. This project provided great learning opportunities and highlighted potential areas for further research and improvements.

### Cost Analysis

The project required a workstation for simulations, a vector network analyzer (VNA), a rotary stage, and absorbers for measurement setup.


