## Photorealistic image sythesis using Spatially Adaptive DEnormalization (SPADE)
The project was implemented as part of EE599 Deep Learning Course as the final term project

## Setup (on AWS)
setup.sh file placed in the root of this repository has all the steps necessary to install base libraries, download datasets from drive, setup and install SPADE and its dependencies. Checkout the paths and run the setup.sh. 

### Operations performed in setup.sh
- Installing required libraries
- Download SPADE folder from drive which already consists of original annottated maps, original test images and annotated maps
- Download original train images from drive and add it to datasets directory
- Downlaod and enable Synchronized Batch Norm. 
- Install Spade dependencies. 
- Start training.

## Dataset Creation
- Downlaod the raw images from [Places365](http://places2.csail.mit.edu/index.html) dataset.

### Generate Semantic maps from raw images
- Image Segmenter.ipynb file has the code to generate semantic maps using CSAILVision pre-trained encoder and decoder on ADE20K.

### Generate Annotated\Label maps from semantic maps. 
- Image Segmenter.ipynb has a separate section to generate Label maps. 

### GAN Training
- GAN Training.ipynb file has the required to start a GAN training.
