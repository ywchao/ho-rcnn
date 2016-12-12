
pool_size = 10;

image_set = 'test2015';
iter = 150000;


% exp_name = 'rcnn_caffenet_union';  exp_dir = 'union';  prefix = 'rcnn_caffenet';

% exp_name = 'rcnn_caffenet_ho';  exp_dir = 'ho';  prefix = 'rcnn_caffenet';

% exp_name = 'rcnn_caffenet_ho_p1fc_vec';    exp_dir = 'ho_p1';  prefix = 'rcnn_caffenet_pfc_vec';
% exp_name = 'rcnn_caffenet_ho_p2fc_vec';    exp_dir = 'ho_p2';  prefix = 'rcnn_caffenet_pfc_vec';
% exp_name = 'rcnn_caffenet_ho_p1fc_box';    exp_dir = 'ho_p1';  prefix = 'rcnn_caffenet_pfc_box';
% exp_name = 'rcnn_caffenet_ho_p2fc_box';    exp_dir = 'ho_p2';  prefix = 'rcnn_caffenet_pfc_box';

% exp_name = 'rcnn_caffenet_ho_p1fc';    exp_dir = 'ho_p1';  prefix = 'rcnn_caffenet_pfc';
% exp_name = 'rcnn_caffenet_ho_p2fc';    exp_dir = 'ho_p2';  prefix = 'rcnn_caffenet_pfc';
% exp_name = 'rcnn_caffenet_ho_p1conv';  exp_dir = 'ho_p1';  prefix = 'rcnn_caffenet_pconv';
% exp_name = 'rcnn_caffenet_ho_p2conv';  exp_dir = 'ho_p2';  prefix = 'rcnn_caffenet_pconv';


% exp_name = 'rcnn_caffenet_ho_p1conv';  exp_dir = 'ho_p1';  prefix = 'rcnn_caffenet_pconv';  score_blob = 'h';
% exp_name = 'rcnn_caffenet_ho_p1conv';  exp_dir = 'ho_p1';  prefix = 'rcnn_caffenet_pconv';  score_blob = 'o';
% exp_name = 'rcnn_caffenet_ho_p1conv';  exp_dir = 'ho_p1';  prefix = 'rcnn_caffenet_pconv';  score_blob = 'p';


% exp_name = 'rcnn_caffenet_ho_s';  exp_dir = 'ho_s';  prefix = 'rcnn_caffenet';

% exp_name = 'rcnn_caffenet_ho_p1fc_s';    exp_dir = 'ho_p1_s';  prefix = 'rcnn_caffenet_pfc';
% exp_name = 'rcnn_caffenet_ho_p2fc_s';    exp_dir = 'ho_p2_s';  prefix = 'rcnn_caffenet_pfc';
% exp_name = 'rcnn_caffenet_ho_p1conv_s';  exp_dir = 'ho_p1_s';  prefix = 'rcnn_caffenet_pconv';
% exp_name = 'rcnn_caffenet_ho_p2conv_s';  exp_dir = 'ho_p2_s';  prefix = 'rcnn_caffenet_pconv';


eval_mode = 'def';  eval_one;  %#ok
eval_mode = 'ko';   eval_one;
