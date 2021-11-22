load('HPFB_TF_PSE_Main-Ex5.mat');  % loading Filter (change accordingly)
W_F4C4_fD=[];
[Lo_D,Hi_D,Lo_R,Hi_R] = biorfilt(h0',f0');  %bi-orthogonal filter 

for i = 1:length(w_ch)/(30*fs) 
  [C,L] = wavedec(reshaped_w_ch(:,i),5,Lo_D,Hi_D);  %5-level wavelet decomposition
  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
  [sb2,sb3,sb4,sb5, sb6] = detcoef(C,L,[1 2 3 4 5]);
  z1 = signal_fractalDimension(sb1);
  z2 = signal_fractalDimension(sb2);
  z3 = signal_fractalDimension(sb3);
  z4 = signal_fractalDimension(sb4);
  z5 = signal_fractalDimension(sb5);
  z6 = signal_fractalDimension(sb6);
  Z = [z1 z2 z3 z4 z5 z6];
  W_F4C4_fD = cat(1,W_F4C4_fD,Z);
end
W_F4C4_fD(:,7)=0;


S1_F4C4_fD=[];
for i = 1:length(s1_ch)/(30*fs) 
  [C,L] = wavedec(reshaped_s1_ch(:,i),5,Lo_D,Hi_D);
  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
  [sb2,sb3,sb4,sb5, sb6] = detcoef(C,L,[1 2 3 4 5]);
  z1 = signal_fractalDimension(sb1);
  z2 = signal_fractalDimension(sb2);
  z3 = signal_fractalDimension(sb3);
  z4 = signal_fractalDimension(sb4);
  z5 = signal_fractalDimension(sb5);
  z6 = signal_fractalDimension(sb6);
  Z = [z1 z2 z3 z4 z5 z6];
  S1_F4C4_fD = cat(1,S1_F4C4_fD,Z);
end
S1_F4C4_fD(:,7)=1;


S2_F4C4_fD=[];
for i = 1:length(s2_ch)/(30*fs) 
  [C,L] = wavedec(reshaped_s2_ch(:,i),5,Lo_D,Hi_D);
  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
  [sb2,sb3,sb4,sb5, sb6] = detcoef(C,L,[1 2 3 4 5]);
  z1 = signal_fractalDimension(sb1);
  z2 = signal_fractalDimension(sb2);
  z3 = signal_fractalDimension(sb3);
  z4 = signal_fractalDimension(sb4);
  z5 = signal_fractalDimension(sb5);
  z6 = signal_fractalDimension(sb6);
  Z = [z1 z2 z3 z4 z5 z6];
  S2_F4C4_fD = cat(1,S2_F4C4_fD,Z);
end
S2_F4C4_fD(:,7)=2;


S3_F4C4_fD=[];
for i = 1:length(s3_ch)/(30*fs) 
  [C,L] = wavedec(reshaped_s3_ch(:,i),5,Lo_D,Hi_D);
  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
  [sb2,sb3,sb4,sb5, sb6] = detcoef(C,L,[1 2 3 4 5]);
  z1 = signal_fractalDimension(sb1);
  z2 = signal_fractalDimension(sb2);
  z3 = signal_fractalDimension(sb3);
  z4 = signal_fractalDimension(sb4);
  z5 = signal_fractalDimension(sb5);
  z6 = signal_fractalDimension(sb6);
  Z = [z1 z2 z3 z4 z5 z6];
  S3_F4C4_fD = cat(1,S3_F4C4_fD,Z);
end
S3_F4C4_fD(:,7)=3;


%S4_F4C4_fD=[];
%for i = 1:length(s4_ch)/(30*fs) 
%  [C,L] = wavedec(reshaped_s4_ch(:,i),5,Lo_D,Hi_D);
%  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
%  [sb2,sb3,sb4,sb5, sb6] = detcoef(C,L,[1 2 3 4 5]);
%  z1 = signal_fractalDimension(sb1);
%  z2 = signal_fractalDimension(sb2);
%  z3 = signal_fractalDimension(sb3);
%  z4 = signal_fractalDimension(sb4);
%  z5 = signal_fractalDimension(sb5);
%  z6 = signal_fractalDimension(sb6);
%  Z = [z1 z2 z3 z4 z5 z6];
%  S4_F4C4_fD = cat(1,S4_F4C4_fD,Z);
%end
%S4_F4C4_fD(:,7)=4;


R_F4C4_fD=[];
for i = 1:length(r_ch)/(30*fs) 
  [C,L] = wavedec(reshaped_r_ch(:,i),5,Lo_D,Hi_D);
  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
  [sb2,sb3,sb4,sb5, sb6] = detcoef(C,L,[1 2 3 4 5]);
  z1 = signal_fractalDimension(sb1);
  z2 = signal_fractalDimension(sb2);
  z3 = signal_fractalDimension(sb3);
  z4 = signal_fractalDimension(sb4);
  z5 = signal_fractalDimension(sb5);
  z6 = signal_fractalDimension(sb6);
  Z = [z1 z2 z3 z4 z5 z6];
  R_F4C4_fD = cat(1,R_F4C4_fD,Z);
end
R_F4C4_fD(:,7)=5;


combined_fD = [W_F4C4_fD; S1_F4C4_fD; S2_F4C4_fD; S3_F4C4_fD; R_F4C4_fD];  %S4_F4C4_fD; 


