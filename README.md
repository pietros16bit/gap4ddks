[![DOI](https://zenodo.org/badge/907463792.svg)](https://doi.org/10.5281/zenodo.14561464)

# Diagonal Double Kodaira Fibrations: GAP4 Code

This repository contains the ancillary GAP4 code accompanying the paper "Groups of order 64 and non-homeomorphic double Kodaira fibrations with the same biregular invariants", by Francesco Polizzi and Pietro Sabatino, see the  preprint [arXiv:2412.08260](https://arxiv.org/abs/2412.08260).

For detailed explanations and mathematical background, please refer to the paper.

The code is organized into seven listings, each designed to perform specific computations related to diagonal double Kodaira fibrations. Below is an overview of the functionality provided by each listing:

- **Part 1** (`Function_Checkstructures.g`): Introduces the CheckStructures function, which computes the number of diagonal double Kodaira fibrations on a given finite group, if any. 

- **Part 2** (`Exclude_54.g`): Utilizes the CheckStructures function to exclude two groups of order 54 from consideration.

- **Part 3 & 4** (`Order_64.g` and `Structures_order_64.g`, respectively): Select candidate groups of order 64.

- **Part 5** (`Structures_order_32.g`): Generates the complete list of structures existing in the two extra-special groups of order 32.

- **Part 6** (`G_64_199_detailed_analysis.g`): Computes the lifting of structures from an extra-special group of order 32 to an overgroup of order 64.

- **Part 7** (`Fundamental_group.g`): Calculates the first homology group for the resulting Kodaira doubly fibred surface.

This repository aims to provide a reproducible implementation of the computations discussed in the associated paper.

You are welcome to modify, adapt, and extend this code for your research or projects. If you do so, please cite the original source by referencing the paper [arXiv:2412.08260](https://arxiv.org/abs/2412.08260), in order to ensure  proper acknowledgment of the original work.  For any questions or clarifications, please contact the authors via the details provided in the paper.
