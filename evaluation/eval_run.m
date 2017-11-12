
pool_size = 10;

image_set = 'test2015';
iter = 150000;


% --------------------------------------------------------------------
% RCNN
% --------------------------------------------------------------------

% exp_name = 'rcnn_caffenet_union';  exp_dir = 'union';  prefix = 'rcnn_caffenet';  format = 'obj';

% exp_name = 'rcnn_caffenet_ho';  exp_dir = 'ho';  prefix = 'rcnn_caffenet';  format = 'obj';

% exp_name = 'rcnn_caffenet_ho_pfc_vec0';  exp_dir = 'ho_0';  prefix = 'rcnn_caffenet_pfc_vec';  format = 'obj';
% exp_name = 'rcnn_caffenet_ho_pfc_vec1';  exp_dir = 'ho_1';  prefix = 'rcnn_caffenet_pfc_vec';  format = 'obj';
% exp_name = 'rcnn_caffenet_ho_pfc_box0';  exp_dir = 'ho_0';  prefix = 'rcnn_caffenet_pfc_box';  format = 'obj';
% exp_name = 'rcnn_caffenet_ho_pfc_box1';  exp_dir = 'ho_1';  prefix = 'rcnn_caffenet_pfc_box';  format = 'obj';

% exp_name = 'rcnn_caffenet_ho_pfc_ip0';    exp_dir = 'ho_0';  prefix = 'rcnn_caffenet_pfc_ip';    format = 'obj';
% exp_name = 'rcnn_caffenet_ho_pfc_ip1';    exp_dir = 'ho_1';  prefix = 'rcnn_caffenet_pfc_ip';    format = 'obj';
% exp_name = 'rcnn_caffenet_ho_pconv_ip0';  exp_dir = 'ho_0';  prefix = 'rcnn_caffenet_pconv_ip';  format = 'obj';
% exp_name = 'rcnn_caffenet_ho_pconv_ip1';  exp_dir = 'ho_1';  prefix = 'rcnn_caffenet_pconv_ip';  format = 'obj';


% exp_name = 'rcnn_caffenet_ho_pconv_ip0';  exp_dir = 'ho_0';  prefix = 'rcnn_caffenet_pconv_ip';  format = 'obj';  score_blob = 'h';
% exp_name = 'rcnn_caffenet_ho_pconv_ip0';  exp_dir = 'ho_0';  prefix = 'rcnn_caffenet_pconv_ip';  format = 'obj';  score_blob = 'o';
% exp_name = 'rcnn_caffenet_ho_pconv_ip0';  exp_dir = 'ho_0';  prefix = 'rcnn_caffenet_pconv_ip';  format = 'obj';  score_blob = 'p';

% exp_name = 'rcnn_caffenet_ho_pconv_ip1';  exp_dir = 'ho_1';  prefix = 'rcnn_caffenet_pconv_ip';  format = 'obj';  score_blob = 'h';
% exp_name = 'rcnn_caffenet_ho_pconv_ip1';  exp_dir = 'ho_1';  prefix = 'rcnn_caffenet_pconv_ip';  format = 'obj';  score_blob = 'o';
% exp_name = 'rcnn_caffenet_ho_pconv_ip1';  exp_dir = 'ho_1';  prefix = 'rcnn_caffenet_pconv_ip';  format = 'obj';  score_blob = 'p';


% exp_name = 'rcnn_caffenet_ho_s';  exp_dir = 'ho_s';  prefix = 'rcnn_caffenet';  format = 'obj';

% exp_name = 'rcnn_caffenet_ho_pfc_ip0_s';    exp_dir = 'ho_0_s';  prefix = 'rcnn_caffenet_pfc_ip';    format = 'obj';
% exp_name = 'rcnn_caffenet_ho_pfc_ip1_s';    exp_dir = 'ho_1_s';  prefix = 'rcnn_caffenet_pfc_ip';    format = 'obj';
% exp_name = 'rcnn_caffenet_ho_pconv_ip0_s';  exp_dir = 'ho_0_s';  prefix = 'rcnn_caffenet_pconv_ip';  format = 'obj';
% exp_name = 'rcnn_caffenet_ho_pconv_ip1_s';  exp_dir = 'ho_1_s';  prefix = 'rcnn_caffenet_pconv_ip';  format = 'obj';

% --------------------------------------------------------------------
% Fast-RCNN
% --------------------------------------------------------------------

% exp_name = 'fast_rcnn_caffenet_union';  exp_dir = 'union';  prefix = 'fast_rcnn_caffenet';  format = 'all';

% exp_name = 'fast_rcnn_caffenet_ho';  exp_dir = 'ho';  prefix = 'fast_rcnn_caffenet';  format = 'all';

% exp_name = 'fast_rcnn_caffenet_ho_pfc_vec0';  exp_dir = 'ho_0';  prefix = 'fast_rcnn_caffenet_pfc_vec';  format = 'all';
% exp_name = 'fast_rcnn_caffenet_ho_pfc_vec1';  exp_dir = 'ho_1';  prefix = 'fast_rcnn_caffenet_pfc_vec';  format = 'all';
% exp_name = 'fast_rcnn_caffenet_ho_pfc_box0';  exp_dir = 'ho_0';  prefix = 'fast_rcnn_caffenet_pfc_box';  format = 'all';
% exp_name = 'fast_rcnn_caffenet_ho_pfc_box1';  exp_dir = 'ho_1';  prefix = 'fast_rcnn_caffenet_pfc_box';  format = 'all';

% exp_name = 'fast_rcnn_caffenet_ho_pfc_ip0';    exp_dir = 'ho_0';  prefix = 'fast_rcnn_caffenet_pfc_ip';    format = 'all';
% exp_name = 'fast_rcnn_caffenet_ho_pfc_ip1';    exp_dir = 'ho_1';  prefix = 'fast_rcnn_caffenet_pfc_ip';    format = 'all';
% exp_name = 'fast_rcnn_caffenet_ho_pconv_ip0';  exp_dir = 'ho_0';  prefix = 'fast_rcnn_caffenet_pconv_ip';  format = 'all';
% exp_name = 'fast_rcnn_caffenet_ho_pconv_ip1';  exp_dir = 'ho_1';  prefix = 'fast_rcnn_caffenet_pconv_ip';  format = 'all';


% exp_name = 'fast_rcnn_caffenet_ho_s';  exp_dir = 'ho_s';  prefix = 'fast_rcnn_caffenet';  format = 'all';

% exp_name = 'fast_rcnn_caffenet_ho_pfc_ip0_s';    exp_dir = 'ho_0_s';  prefix = 'fast_rcnn_caffenet_pfc_ip';    format = 'all';
% exp_name = 'fast_rcnn_caffenet_ho_pfc_ip1_s';    exp_dir = 'ho_1_s';  prefix = 'fast_rcnn_caffenet_pfc_ip';    format = 'all';
% exp_name = 'fast_rcnn_caffenet_ho_pconv_ip0_s';  exp_dir = 'ho_0_s';  prefix = 'fast_rcnn_caffenet_pconv_ip';  format = 'all';
% exp_name = 'fast_rcnn_caffenet_ho_pconv_ip1_s';  exp_dir = 'ho_1_s';  prefix = 'fast_rcnn_caffenet_pconv_ip';  format = 'all';


eval_mode = 'def';  eval_one;  %#ok
eval_mode = 'ko';   eval_one;
