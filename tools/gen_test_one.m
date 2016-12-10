
% get object list
det_file = './cache/det_base_caffenet/train2015/HICO_train2015_00000001.mat';
assert(exist(det_file,'file') ~= 0);
ld = load(det_file);
list_coco_obj = cellfun(@(x)strrep(x,' ','_'),ld.cls,'UniformOutput',false);
list_coco_obj = list_coco_obj(2:end)';

% template
script_temp = './experiments/templates/run_test_net.sh';

% script
script_name = '%02d_%s.sh';
script_base = './experiments/scripts/test_%s/';
script_base = sprintf(script_base, exp_name);
makedir(script_base);

% pbs
pbs_name = 'run_%02d.pbs';
pbs_base = './pbs/%s/test_%s/';
pbs_base = sprintf(pbs_base, cluster, exp_name);
if batch_mode ~= 0
    pbs_base = [pbs_base(1:end-1) sprintf('_bs%02d/',batch_size)];
end
makedir(pbs_base);

% get batch num
if batch_mode ~= 0
    num_batch = ceil(numel(list_coco_obj) / batch_size);
else
    num_batch = numel(list_coco_obj);
end

% test_name
test_name = 'test';
if numel(exp_name) > 4 && strcmp(exp_name(end-3:end),'_vec') == 1
    test_name = 'test_vec';
end
if numel(exp_name) > 4 && strcmp(exp_name(end-3:end),'_box') == 1
    test_name = 'test_box';
end

% exp_dir
cfg_file = ['./experiments/cfgs/' cfg_name '.yml'];
C = read_file_lines(cfg_file);
ind_1 = find(cellfun(@(x)(numel(x) > 9) && strcmp(x(1:9),'EXP_DIR: ') == 1, C));
assert(numel(ind_1) == 1);
ind_2 = strfind(C{ind_1},'"');
assert(numel(ind_2) == 2);
exp_dir = C{ind_1}(ind_2(1)+1:ind_2(2)-1);

% snapshot_prefix
solver_file = ['./models/' model_name '/solver.prototxt'];
if numel(exp_name) > 4 && strcmp(exp_name(end-3:end),'_vec') == 1
    solver_file = ['./models/' model_name '/solver_vec.prototxt'];
end
if numel(exp_name) > 4 && strcmp(exp_name(end-3:end),'_box') == 1
    solver_file = ['./models/' model_name '/solver_box.prototxt'];
end
C = read_file_lines(solver_file);
ind_1 = find(cellfun(@(x)(numel(x) > 17) && strcmp(x(1:17),'snapshot_prefix: ') == 1, C));
assert(numel(ind_1) == 1);
ind_2 = strfind(C{ind_1},'"');
assert(numel(ind_2) == 2);
snapshot_prefix = C{ind_1}(ind_2(1)+1:ind_2(2)-1);

% script file
for o = 1:numel(list_coco_obj)
    obj_id = o;
    obj_name = list_coco_obj{o};
    
    clear pre_str new_str
    pre_str{1} = '${exp_name}';
    pre_str{2} = '${iter}';
    pre_str{3} = '${image_set}';
    pre_str{4} = '${obj_id}';
    pre_str{5} = '${obj_id_pad}';
    pre_str{6} = '${obj_name}';
    pre_str{7} = '${model_name}';
    pre_str{8} = '${test_name}';
    pre_str{9} = '${cfg_name}';
    pre_str{10} = '${exp_dir}';
    pre_str{11} = '${snapshot_prefix}';
    new_str{1} = exp_name;
    new_str{2} = num2str(iter);
    new_str{3} = image_set;
    new_str{4} = num2str(obj_id);
    new_str{5} = num2str(obj_id,'%02d');
    new_str{6} = obj_name;
    new_str{7} = model_name;
    new_str{8} = test_name;
    new_str{9} = cfg_name;
    new_str{10} = exp_dir;
    new_str{11} = snapshot_prefix;
    
    flag_indent = true;
    script_file = [script_base sprintf(script_name, obj_id, obj_name)];
    src_file = script_temp;
    trg_file = script_file;
    if ~exist(trg_file,'file')
        C = read_file_lines(src_file,flag_indent);
        for i = 1:numel(pre_str)
            C = cellfun(@(x)strrep(x,pre_str{i},new_str{i}),C,'UniformOutput',false);
        end
        C = [C; {''}];  %#ok
        write_file_lines(trg_file,C);
        edit_file_permission(trg_file,'755');
    end
end

% pbs file
for o = 1:num_batch
    if batch_mode ~= 0
        sid = batch_size*(o-1)+1;
        eid = batch_size*o;
        eid = min(eid, numel(list_coco_obj));
        pbs_file = [pbs_base sprintf('run_%02d_%02d.pbs', sid, eid)];
    else
        pbs_file = [pbs_base sprintf(pbs_name, o)];
    end        
    if ~exist(pbs_file,'file')
        header_file = ['./pbs/header_' cluster];
        C = read_file_lines(header_file);
        clear pre_str new_str
        pre_str{1} = '${job_name}';
        pre_str{2} = '${ppn}';
        pre_str{3} = '${gpus}';
        pre_str{4} = '${mem}';
        pre_str{5} = '${walltime}';
        pre_str{6} = '${working_dir}';
        new_str{1} = sprintf('ts_%s', exp_name);
        if batch_mode ~= 0
            new_str{1} = sprintf('%s_%02d_%02d', new_str{1}, sid, eid);
        else
            new_str{1} = sprintf('%s_%02d', new_str{1}, o);
        end
        if exist('ppn','var')
            new_str{2} = ppn;
        else
            new_str{2} = '1';
        end
        new_str{3} = '1';
        if exist('mem','var')
            new_str{4} = mem;
        else
            new_str{4} = '4gb';
        end
        new_str{5} = walltime;
        new_str{6} = working_dir;
        for s = 1:numel(pre_str)
            C = cellfun(@(x)strrep(x,pre_str{s},new_str{s}),C,'UniformOutput',false);
        end
        C = [C; {''}];  %#ok
        switch batch_mode
            case 0
                obj_id = o;
                obj_name = list_coco_obj{o};
                script_file = [script_base sprintf(script_name, obj_id, obj_name)];
                switch cluster
                    case {'jiadeng_fluxoe_titanx'}
                        line = [script_file ' 0'];
                end
                C = [C; line];  %#ok
            case 1
                for i = sid:eid
                    obj_id = i;
                    obj_name = list_coco_obj{i};
                    script_file = [script_base sprintf(script_name, obj_id, obj_name)];
                    switch cluster
                        case {'jiadeng_fluxoe_titanx'}
                            line = [script_file ' 0'];
                    end
                    C = [C; line];  %#ok
                end
            case 2
                for i = sid:eid
                    obj_id = i;
                    obj_name = list_coco_obj{i};
                    script_file = [script_base sprintf(script_name, obj_id, obj_name)];
                    switch cluster
                        case {'jiadeng_fluxoe_titanx'}
                            line = [script_file ' 0 &'];
                    end
                    C = [C; line];  %#ok
                end
                C = [C; 'wait'];  %#ok
        end
        C = [C; {''}];
        write_file_lines(pbs_file,C);
    end
end

% generate qsub script
qsub_file = [fileparts(pbs_base) '.sh'];
if ~exist(qsub_file,'file')
    C = {};
    C = [C; {'#!/bin/bash'}];
    C = [C; {''}];
    for o = 1:num_batch
        if exist('batch_size','var')
            sid = batch_size*(o-1)+1;
            eid = batch_size*o;
            eid = min(eid, numel(list_coco_obj));
            pbs_file = [pbs_base sprintf('run_%02d_%02d.pbs', sid, eid)];
        else
            pbs_file = [pbs_base sprintf(pbs_name, o)];
        end
        C = [C; {['qsub ' pbs_file ';']}];  %#ok
        if o ~= numel(list_coco_obj)
            C = [C; {'sleep 0.5'}];  %#ok
        end
    end
    C = [C; {''}];
    write_file_lines(qsub_file,C);
    edit_file_permission(qsub_file,'755');
end
    