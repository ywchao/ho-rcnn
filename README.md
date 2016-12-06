# HO-RCNN

## Setup

First, clone the HO-RCNN epository
```Shell
# Make sure to clone with --recursive
git clone --recursive (TODO)
```

### Download [HICO-DET]((TODO))

0. Download and extract the HICO-DET dataset. This should create a directory `hico_20160224_det`.
  (TODO)

0. Create symlinks for the HICO-DET dataset.
  ```Shell
  cd $HORCNN_ROOT/data
  ln -s $PATH_TO_hico_20160224_det hico_20160224_det
  ```

### Download pre-computed object detection output

0. Download and extract (TODO)

0. Create symlinks (TODO)
  ```Shell
  cd $HORCNN_ROOT/caches
  ln -s $PATH_TO_det_base_caffenet det_base_caffenet
  ```

### Install [Fast-RCNN](https://github.com/rbgirshick/fast-rcnn)

The HO-RCNN code is built on the framework of [Fast-RCNN](https://github.com/rbgirshick/fast-rcnn). Install Fast-RCNN with the following steps.

0. Dependencies: Python packages: `cython`, `python-opencv`, `easydict`

0. Build the Cython modules
  ```Shell
  cd $HORCNN_ROOT/fast-rcnn/lib
  make
  ```

0. Build Caffe and pycaffe
  ```Shell
  cd $HORCNN_ROOT/fast-rcnn/caffe-fast-rcnn
  # Now follow the Caffe installation instructions here:
  #   http://caffe.berkeleyvision.org/installation.html

  # If you're experienced with Caffe and have all of the requirements installed
  # and your Makefile.config in place, then simply do:
  make -j8 && make pycaffe
  ```

  **Note 1:** Caffe *must* be built with support for Python layers!
  ```make
  # In your Makefile.config, make sure to have this line uncommented
  WITH_PYTHON_LAYER := 1
  ```

  **Note 2:** This branch only supports [cuDNN v2](https://developer.nvidia.com/rdp/cudnn-archive).

0. Download pre-trained ImageNet models from Fast-RCNN
  ```Shell
  cd $HORCNN_ROOT/fast-rcnn
  ./data/scripts/fetch_imagenet_models.sh
  ```

### Process pre-trained ImageNet models

#### Option 1: (TODO)

0. (TODO)

#### Option 2: net surgery

0. Build Caffe and matcaffe
  ```Shell
  cd $HORCNN_ROOT/caffe
  # Now follow the Caffe installation instructions here:
  #   http://caffe.berkeleyvision.org/installation.html

  # If you're experienced with Caffe and have all of the requirements installed
  # and your Makefile.config in place, then simply do:
  make -j8 && make matcaffe
  ```

0. (TODO)