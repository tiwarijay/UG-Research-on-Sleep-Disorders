load('HPFB_TF_PSE_Main-Ex5.mat');
W_F4C4_sE=[];
[Lo_D,Hi_D,Lo_R,Hi_R] = biorfilt(h0',f0');
for i = 1:length(w_ch)/(30*fs) 
  [C,L] = wavedec(reshaped_w_ch(:,i),5,Lo_D,Hi_D);
  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
  [sb2,sb3,sb4,sb5, sb6] = detcoef(C,L,[1 2 3 4 5]);
  y1 = signal_sampleEntropy(sb1);
  y2 = signal_sampleEntropy(sb2);
  y3 = signal_sampleEntropy(sb3);
  y4 = signal_sampleEntropy(sb4);
  y5 = signal_sampleEntropy(sb5);
  y6 = signal_sampleEntropy(sb6);
  Y = [y1 y2 y3 y4 y5 y6];
  W_F4C4_sE = cat(1,W_F4C4_sE,Y);
end
W_F4C4_sE(:,7)=0;


S1_F4C4_sE=[];
for i = 1:length(s1_ch)/(30*fs) 
  [C,L] = wavedec(reshaped_s1_ch(:,i),5,Lo_D,Hi_D);
  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
  [sb2,sb3,sb4,sb5, sb6] = detcoef(C,L,[1 2 3 4 5]);
  y1 = signal_sampleEntropy(sb1);
  y2 = signal_sampleEntropy(sb2);
  y3 = signal_sampleEntropy(sb3);
  y4 = signal_sampleEntropy(sb4);
  y5 = signal_sampleEntropy(sb5);
  y6 = signal_sampleEntropy(sb6);
  Y = [y1 y2 y3 y4 y5 y6];
  S1_F4C4_sE = cat(1,S1_F4C4_sE,Y);
end
S1_F4C4_sE(:,7)=1;


S2_F4C4_sE=[];
for i = 1:length(s2_ch)/(30*fs) 
  [C,L] = wavedec(reshaped_s2_ch(:,i),5,Lo_D,Hi_D);
  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
  [sb2,sb3,sb4,sb5, sb6] = detcoef(C,L,[1 2 3 4 5]);
  y1 = signal_sampleEntropy(sb1);
  y2 = signal_sampleEntropy(sb2);
  y3 = signal_sampleEntropy(sb3);
  y4 = signal_sampleEntropy(sb4);
  y5 = signal_sampleEntropy(sb5);
  y6 = signal_sampleEntropy(sb6);
  Y = [y1 y2 y3 y4 y5 y6];
  S2_F4C4_sE = cat(1,S2_F4C4_sE,Y);
end
S2_F4C4_sE(:,7)=2;


S3_F4C4_sE=[];
for i = 1:length(s3_ch)/(30*fs) 
  [C,L] = wavedec(reshaped_s3_ch(:,i),5,Lo_D,Hi_D);
  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
  [sb2,sb3,sb4,sb5, sb6] = detcoef(C,L,[1 2 3 4 5]);
  y1 = signal_sampleEntropy(sb1);
  y2 = signal_sampleEntropy(sb2);
  y3 = signal_sampleEntropy(sb3);
  y4 = signal_sampleEntropy(sb4);
  y5 = signal_sampleEntropy(sb5);
  y6 = signal_sampleEntropy(sb6);
  Y = [y1 y2 y3 y4 y5 y6];
  S3_F4C4_sE = cat(1,S3_F4C4_sE,Y);
end
S3_F4C4_sE(:,7)=3;


%S4_F4C4_sE=[];
%for i = 1:length(s4_ch)/(30*fs) 
%  [C,L] = wavedec(reshaped_s4_ch(:,i),5,Lo_D,Hi_D);
%  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
%  [sb2,sb3,sb4,sb5, sb6] = detcoef(C,L,[1 2 3 4 5]);
%  y1 = signal_sampleEntropy(sb1);
%  y2 = signal_sampleEntropy(sb2);
%  y3 = signal_sampleEntropy(sb3);
%  y4 = signal_sampleEntropy(sb4);
%  y5 = signal_sampleEntropy(sb5);
%  y6 = signal_sampleEntropy(sb6);
%  Y = [y1 y2 y3 y4 y5 y6];
%  S4_F4C4_sE = cat(1,S4_F4C4_sE,Y);
%end
S4_F4C4_sE(:,7)=4;


R_F4C4_sE=[];
for i = 1:length(r_ch)/(30*fs) 
  [C,L] = wavedec(reshaped_r_ch(:,i),5,Lo_D,Hi_D);
  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
  [sb2,sb3,sb4,sb5, sb6] = detcoef(C,L,[1 2 3 4 5]);
  y1 = signal_sampleEntropy(sb1);
  y2 = signal_sampleEntropy(sb2);
  y3 = signal_sampleEntropy(sb3);
  y4 = signal_sampleEntropy(sb4);
  y5 = signal_sampleEntropy(sb5);
  y6 = signal_sampleEntropy(sb6);
  Y = [y1 y2 y3 y4 y5 y6];
  R_F4C4_sE = cat(1,R_F4C4_sE,Y);
end
R_F4C4_sE(:,7)=5;


combined_sE = [W_F4C4_sE; S1_F4C4_sE; S2_F4C4_sE; S3_F4C4_sE; R_F4C4_sE];  %S4_F4C4_sE; 





