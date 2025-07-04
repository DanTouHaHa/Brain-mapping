[num, txt, raw] = xlsread('/public/home/zixing/Desktop/houwj/Data_input_for_creating_curv_mapping_file.xlsx', 'Fig_2a_right');
smri_name=raw(:,3);
est_rh=raw(:,2);

%the right hemisphere 
vol=zeros(163842,1);  %vertices
vol(1:163842,1) =-5; 
[vertices,label,ctab]=read_annotation('/public/software/apps/Freesurfer/7.1.1/subjects/fsaverage/label/rh.aparc.annot'); 

for i = 1:length(est_rh)
    stgctab = strmatch(char(smri_name(i)),char(ctab.struct_names));
    stgcode = ctab.table(stgctab,5);
    indstg = find(label==stgcode);
    vol(indstg,1)=cell2mat(est_rh(i));
end
vol = reshape(vol,[163842,1,1,1]);%translate into 4d matrix

write_curv('Fig_2a_right.curv',vol,327680);


%the left hemisphere 
[num, txt, raw] = xlsread('/public/home/zixing/Desktop/houwj/Data_input_for_creating_curv_mapping_file.xlsx', 'Fig_2a_left');


smri_name=raw(:,3);
est_lh=raw(:,2);

vol=zeros(163842,1);  %vertices
vol(1:163842,1) =-5; 

[vertices,label,ctab]=read_annotation('/public/software/apps/Freesurfer/7.1.1/subjects/fsaverage/label/lh.aparc.annot'); 
%
for i = 1:length(est_lh)
    stgctab = strmatch(char(smri_name(i)),char(ctab.struct_names));
    stgcode = ctab.table(stgctab,5);
    indstg = find(label==stgcode);
    vol(indstg,1)=cell2mat(est_lh(i));
 end
 vol = reshape(vol,[163842,1,1,1]);%translate into 4d matrix
%
 write_curv('Fig_2a_left.curv',vol,327680);
