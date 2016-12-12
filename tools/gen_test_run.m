
clear all

cluster = 'jiadeng_fluxoe_titanx';
ppn = '1';
mem = '4gb';
working_dir = '/scratch/jiadeng_fluxoe/ywchao/ho-rcnn';
batch_mode = 1;
batch_size = 10;

image_set = 'test2015';
iter = 150000;


% h, o, p streams
clear walltime
walltime = '00:16:00:00';  %#ok

exp_name = 'rcnn_caffenet_union';  model_name = exp_name;  cfg_name = 'rcnn_union';  gen_test_one;  %#ok

exp_name = 'rcnn_caffenet_ho';  model_name = exp_name;  cfg_name = 'rcnn_ho';  gen_test_one;  %#ok

exp_name = 'rcnn_caffenet_ho_p1fc_vec';  model_name = 'rcnn_caffenet_ho_pfc';  cfg_name = 'rcnn_ho_p1_vec';  gen_test_one;  %#ok
exp_name = 'rcnn_caffenet_ho_p1fc_box';  model_name = 'rcnn_caffenet_ho_pfc';  cfg_name = 'rcnn_ho_p1_box';  gen_test_one;  %#ok
exp_name = 'rcnn_caffenet_ho_p2fc_vec';  model_name = 'rcnn_caffenet_ho_pfc';  cfg_name = 'rcnn_ho_p2_vec';  gen_test_one;  %#ok
exp_name = 'rcnn_caffenet_ho_p2fc_box';  model_name = 'rcnn_caffenet_ho_pfc';  cfg_name = 'rcnn_ho_p2_box';  gen_test_one;  %#ok

exp_name = 'rcnn_caffenet_ho_p1fc';    model_name = 'rcnn_caffenet_ho_pfc';    cfg_name = 'rcnn_ho_p1';  gen_test_one;  %#ok
exp_name = 'rcnn_caffenet_ho_p2fc';    model_name = 'rcnn_caffenet_ho_pfc';    cfg_name = 'rcnn_ho_p2';  gen_test_one;  %#ok
exp_name = 'rcnn_caffenet_ho_p1conv';  model_name = 'rcnn_caffenet_ho_pconv';  cfg_name = 'rcnn_ho_p1';  gen_test_one;  %#ok
exp_name = 'rcnn_caffenet_ho_p2conv';  model_name = 'rcnn_caffenet_ho_pconv';  cfg_name = 'rcnn_ho_p2';  gen_test_one;  %#ok


% inidividual streams
clear walltime
walltime = '00:16:00:00';  %#ok

clear score_blob
score_blob = 'h';  exp_name = 'rcnn_caffenet_ho_p1conv_h';  model_name = 'rcnn_caffenet_ho_pconv';  cfg_name = 'rcnn_ho_p1';  gen_test_one;  %#ok
score_blob = 'o';  exp_name = 'rcnn_caffenet_ho_p1conv_o';  model_name = 'rcnn_caffenet_ho_pconv';  cfg_name = 'rcnn_ho_p1';  gen_test_one;  %#ok
score_blob = 'p';  exp_name = 'rcnn_caffenet_ho_p1conv_p';  model_name = 'rcnn_caffenet_ho_pconv';  cfg_name = 'rcnn_ho_p1';  gen_test_one;  %#ok
clear score_blob


% using object detection scores
clear walltime
walltime = '00:24:00:00';

exp_name = 'rcnn_caffenet_ho_s';  model_name = exp_name;  cfg_name = 'rcnn_ho_s';  gen_test_one;  %#ok

exp_name = 'rcnn_caffenet_ho_p1fc_s';    model_name = 'rcnn_caffenet_ho_pfc_s';    cfg_name = 'rcnn_ho_p1_s';  gen_test_one;  %#ok
exp_name = 'rcnn_caffenet_ho_p2fc_s';    model_name = 'rcnn_caffenet_ho_pfc_s';    cfg_name = 'rcnn_ho_p2_s';  gen_test_one;  %#ok
exp_name = 'rcnn_caffenet_ho_p1conv_s';  model_name = 'rcnn_caffenet_ho_pconv_s';  cfg_name = 'rcnn_ho_p1_s';  gen_test_one;  %#ok
exp_name = 'rcnn_caffenet_ho_p2conv_s';  model_name = 'rcnn_caffenet_ho_pconv_s';  cfg_name = 'rcnn_ho_p2_s';  gen_test_one;


fprintf('done.\n');
