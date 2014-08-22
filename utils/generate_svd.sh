#! /bin/bash

SVD_FILE=CMSIS-SVD_Schema_1_1.xsd

pyxbgen -u $SVD_FILE -m svd

