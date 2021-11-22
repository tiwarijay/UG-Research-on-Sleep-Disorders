ScoringReader

fprintf('\n\n\n')

edf_file = file;
edf_file([end-2 end-1 end]) = char('edf');

disp('Processing...')

[hdr, record] = edfread(edf_file);
for i=1:length(hdr.label)
    if contains(hdr.label{1,i},'F4C4')
        ch=i;
    else 
        error('Oops! Your file doesn''t contain required channel ''F4-C4''!')
    end
end

fprintf('\n\n\n')

segregation

disp('Please wait...')

sleep

save Sleep_stages W S1 S2 S3 S4 R hyp hdr record ch file edf_file fs

clear
clc
load Sleep_stages

Channel_F4C4_General


disp('Segmentation successfully done.')
disp('All necessary variables are stored in a mat file named ''Sleep_stages'' .')
disp('All necessary data of individual channel is stored in a mat file whose name is the name of the channel itself. e.g ''F4-C4''')



