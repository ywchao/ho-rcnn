
base_dir = [fileparts(mfilename('fullpath')) '/'];

caffe_root = [base_dir 'caffe/'];
frcnn_root = [base_dir 'fast-rcnn/'];

im_root   = './data/hico_20160224_det/images/';
anno_file = './data/hico_20160224_det/anno.mat';
bbox_file = './data/hico_20160224_det/anno_bbox.mat';