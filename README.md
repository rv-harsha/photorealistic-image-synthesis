## Photorealistic image sythesis using Spatially Adaptive DEnormalization (SPADE)
The project was implemented as part of EE599 Deep Learning Course as the final term project

## Setup (on AWS)
setup.sh file placed in the root of this repository has all the steps necessary to install base libraries, download datasets from drive, setup and install SPADE and its dependencies. Checkout the paths and run the setup.sh. 

### Operations performed in setup.sh
- Installing required libraries
- Download SPADE folder from drive which already consists of original annotated maps, original test images and annotated maps
- Download original train images from drive and add it to datasets directory
- Download and enable Synchronized Batch Norm. 
- Install Spade dependencies. 
- Start training.

## Dataset Creation
- Download the raw images from [Places365](http://places2.csail.mit.edu/index.html) dataset.

### Generate Semantic maps from raw images
- Image Segmentation.ipynb file has the code to generate semantic maps using CSAILVision pre-trained encoder and decoder on ADE20K.

### Generate Annotated\Label maps from semantic maps. 
- Image Segmentation.ipynb has a separate section to generate Label maps. 

### GAN Training
- Colab Training.ipynb file has the required steps to start the GAN training on Google Colab.

## Code Structure

- `train.py`, `test.py`: the entry point for training and testing.
- `trainers/pix2pix_trainer.py`: harnesses and reports the progress of training.
- `models/pix2pix_model.py`: creates the networks, and compute the losses
- `models/networks/`: defines the architecture of all models
- `options/`: creates option lists using `argparse` package. More individuals are dynamically added in other files as well. Please see the section below.
- `data/`: defines the class for loading images and label maps.

## Options

 To address this, the `BaseOption` class dynamically loads and sets options depending on what model, network, and datasets are used. This is done by calling the static method `modify_commandline_options` of various classes. It takes in the`parser` of `argparse` package and modifies the list of options. 

## VAE-Style Training with an Encoder For Style Control and Multi-Modal Outputs

To train our model along with an image encoder to enable multi-modal outputs as in Figure 15 of the [paper](https://arxiv.org/pdf/1903.07291.pdf), please use `--use_vae`. The model will create `netE` in addition to `netG` and `netD` and train with KL-Divergence loss.

## Acknowledgments
We have borrowed the code from NVLabs [SPADE](https://github.com/NVlabs/SPADE) repository. 
The code is modified to our requirement and used for academic purpose only.


 For commercial use, please contact [researchinquiries@nvidia.com](researchinquiries@nvidia.com). Please check the SPADE link for License and usage terms and  conditions.