tic
disp('Start')
%final_modwpt_normal=[];
normal={'n1.txt';'n2.txt';'n3.txt';'n5.txt';'n10.txt';'n11.txt'};
for ij=2:6
 sprintf(normal{ij})   
ScoreReader_normal

fprintf('\n\n\n')

edf_file = file;
edf_file([end-2 end-1 end]) = char('edf');

disp('Processing...')

[hdr, record] = edfread(edf_file);

if contains(edf_file,'n10.edf')
    
    record = record(:,1843201:end);
elseif contains(edf_file,'n1.edf')
   record = record(:,107521:end);
elseif contains(edf_file,'n4.edf')
   record = record(:,342001:end);
elseif contains(edf_file,'n2.edf')
   record = record(:,5744641:end);
elseif contains(edf_file,'n3.edf')
   record = record(:,1551361:end);
elseif contains(edf_file,'n5.edf')
   record = record(:,614401:end);
elseif contains(edf_file,'n11.edf')
   record = record(:,15361:end);
elseif contains(edf_file,'n16.edf')
   record = record(:,3001:end);  
end

for i=1:length(hdr.label)
    if contains(hdr.label{1,i},'F4C4')
        ch=i;
    end
end

signal = record(ch,:);

fprintf('\n\n\n')

segregation

disp('Please wait...')

sleep

%save Sleep_stages W S1 S2 S3 S4 R hyp hdr record ch file edf_file fs

%clear

%load Sleep_stages

Channel_F4C4_General

% disp('Processing Log Energy...')
% tic
% data_logEnergy
% final_name_le = strcat(file(1:end-4),'_F4C4_logEnergy');
% save(final_name_le,'combined_le')
% toc
% 
% disp('Processing Sample Entropy...')
% tic
% data_sampleEntropy
% final_name_sE = strcat(file(1:end-4),'_F4C4_sampleEntropy');
% save(final_name_sE,'combined_sE')
% toc
% 
% disp('Processing Fractal Dimension...')
% tic
% data_fractalDimension
% final_name_fD = strcat(file(1:end-4),'_F4C4_fractalDimension');
% save(final_name_fD,'combined_fD')
% toc
% 
% disp('Processing Fuzzy Entropy...')
% tic
% data_fuzzyEntropy
% final_name_fE = strcat(file(1:end-4),'_F4C4_fuzzyEntropy');
% save(final_name_fE,'combined_fE')
% toc

disp('Processing norm_2 ...')

a_Wavelet_packet
patient_name_modwpt = strcat(file(1:end-4),'_modwpt_norm2');
save(patient_name_modwpt,'combined_norm2')

final_modwpt_normal = cat(1,final_modwpt_normal,combined_norm2);
end

disp('Saving...')
%jay = [combined_le combined_sE combined_fE combined_fD];
%final_name_all = strcat(file(1:end-4),'_F4C4_all');
save('Final_modwpt_Normal_1_2_3_5_10_11','final_modwpt_normal');

disp('Segmentation successfully done.')
%disp('All necessary variables are stored in a mat file named ''Sleep_stages'' .')
%disp('All necessary data of individual channel is stored in a mat file whose name is the name of the channel itself. e.g ''F4-C4''')
toc
%disp('Total time for n1 is mentioned above')



