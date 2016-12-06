
base_dir = [fileparts(mfilename('fullpath')) '/'];

caffe_root = [base_dir 'caffe/'];
frcnn_root = [base_dir 'fast-rcnn/'];

im_root   = './external/hico_20160224_det/images/';
anno_file = './external/hico_20160224_det/anno.mat';
bbox_file = './external/hico_20160224_det/anno_bbox.mat';