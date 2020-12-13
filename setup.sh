#!/bin/bash

# To see the mounts
# lsblk 

# To check FS type
# sudo file -s /dev/xvdb

# If you have an empty volume, use the mkfs -t command to create a file system on the volume.
# sudo mkfs -t xfs /dev/xvdb

# To mount EBS to a directory
# sudo mount /dev/xvdb ./workspace

# Change directory permissions
# sudo chown ec2-user:ec2-user workspace

sudo yum update
pip install tensorflow==1.15.0
pip install scipy==1.2.0
pip install pillow==6.1.0
pip install imgaug==0.2.6
pip install umap-learn==0.3.10
pip install tensorflow-probability==0.7.0
pip install gdown
pip install pipdeptree


gdown https://drive.google.com/uc?id=15WG2XJhJvWVD1yndqYwgxTlL0oOQ-g41
tar -zvxf SPADE.tar.gz

gdown https://drive.google.com/uc?id=1mEMQJrW9tshl-UeopWMYOWbEMo6WHRxM
unzip Final_orginal_images.zip
find  Final_orginal_images/ -name "*.jpg" -exec cp -uf "{}" SPADE/datasets/Places365/train_B/ \;


cd SPADE/models/networks/
git clone https://github.com/vacancy/Synchronized-BatchNorm-PyTorch
cp -rf Synchronized-BatchNorm-PyTorch/sync_batchnorm .
cd ../../

mv datasets/Places365/train_A/lake_00000030\ .png datasets/Places365/train_A/lake_00000030.png
pip install -r requirements.txt

pwd

python train.py --name Places365 \
    --dataset_mode custom \
    --phase train \
    --batchSize 24 \
    --label_nc 150 \
    --load_size 256 \
    --crop_size 256 \
    --ndf 48 \
    --ngf 48 \
    --save_epoch_freq 1 \
    --no_pairing_check \
    --preprocess_mode none \
    --label_dir datasets/Places365/train_A \
    --image_dir datasets/Places365/train_B \
    --no_instance \
    --cache_filelist_write \
    --cache_filelist_read \
    --tf_log \
    --dataroot datasets/Places365 \
    --gpu_ids 0,1,2,3 \
    --niter_decay 25 \
    --beta2 0.99 \
    --lr 0.0004 \
    --lambda_feat 15 \
    --lambda_vgg 15 \
    --use_vae

# Uncomment the below code to run the test. 

# !python test.py --name Places365 \
#     --dataset_mode custom \
#     --phase test \
#     --batchSize 16 \
#     --label_nc 150 \
#     --how_many 949\
#     --load_size 256 \
#     --crop_size 256 \
#     --ngf 88 \
#     --nef 32 \
#     --no_pairing_check \
#     --preprocess_mode none \
#     --no_instance \
#     --label_dir /content/drive/MyDrive/EE599_Project/Datasets/val_A \
#     --image_dir /content/drive/MyDrive/EE599_Project/Datasets/val_B \
#     --dataroot /content/SPADE/datasets/Places365 \
#     --use_vae