load('HPFB_TF_PSE_Main-Ex5.mat');
W_F4C4_le=[];
[Lo_D,Hi_D,Lo_R,Hi_R] = biorfilt(h0',f0');
for i = 1:length(w_ch)/(30*fs) 
  [C,L] = wavedec(reshaped_w_ch(:,i),5,Lo_D,Hi_D);
  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
  [sb2,sb3,sb4,sb5,sb6] = detcoef(C,L,[1 2 3 4 5]);
  x1 = log10(norm(sb1).^2);
  x2 = log10(norm(sb2).^2);
  x3 = log10(norm(sb3).^2);
  x4 = log10(norm(sb4).^2);
  x5 = log10(norm(sb5).^2);
  x6 = log10(norm(sb6).^2);
  X = [x1 x2 x3 x4 x5 x6];
  W_F4C4_le = cat(1,W_F4C4_le,X);
end

W_F4C4_le(:,7)=0;


S1_F4C4_le=[];
for i = 1:length(s1_ch)/(30*fs) 
  [C,L] = wavedec(reshaped_s1_ch(:,i),5,Lo_D,Hi_D);
  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
  [sb2,sb3,sb4,sb5,sb6] = detcoef(C,L,[1 2 3 4 5]);
  x1 = log10(norm(sb1).^2);
  x2 = log10(norm(sb2).^2);
  x3 = log10(norm(sb3).^2);
  x4 = log10(norm(sb4).^2);
  x5 = log10(norm(sb5).^2);
  x6 = log10(norm(sb6).^2);
  X = [x1 x2 x3 x4 x5 x6];
  S1_F4C4_le = cat(1,S1_F4C4_le,X);
end
S1_F4C4_le(:,7)=1;


S2_F4C4_le=[];
for i = 1:length(s2_ch)/(30*fs) 
  [C,L] = wavedec(reshaped_s2_ch(:,i),5,Lo_D,Hi_D);
  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
  [sb2,sb3,sb4,sb5,sb6] = detcoef(C,L,[1 2 3 4 5]);
  x1 = log10(norm(sb1).^2);
  x2 = log10(norm(sb2).^2);
  x3 = log10(norm(sb3).^2);
  x4 = log10(norm(sb4).^2);
  x5 = log10(norm(sb5).^2);
  x6 = log10(norm(sb6).^2);
  X = [x1 x2 x3 x4 x5 x6];
  S2_F4C4_le = cat(1,S2_F4C4_le,X);
end
S2_F4C4_le(:,7)=2;


S3_F4C4_le=[];
for i = 1:length(s3_ch)/(30*fs) 
  [C,L] = wavedec(reshaped_s3_ch(:,i),5,Lo_D,Hi_D);
  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
  [sb2,sb3,sb4,sb5,sb6] = detcoef(C,L,[1 2 3 4 5]);
  x1 = log10(norm(sb1).^2);
  x2 = log10(norm(sb2).^2);
  x3 = log10(norm(sb3).^2);
  x4 = log10(norm(sb4).^2);
  x5 = log10(norm(sb5).^2);
  x6 = log10(norm(sb6).^2);
  X = [x1 x2 x3 x4 x5 x6];
  S3_F4C4_le = cat(1,S3_F4C4_le,X);
end
S3_F4C4_le(:,7)=3;


%S4_F4C4_le=[];
%for i = 1:length(s4_ch)/(30*fs) 
%  [C,L] = wavedec(reshaped_s4_ch(:,i),5,Lo_D,Hi_D);
%  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
%  [sb2,sb3,sb4,sb5,sb6] = detcoef(C,L,[1 2 3 4 5]);
%  x1 = log10(norm(sb1).^2);
%  x2 = log10(norm(sb2).^2);
%  x3 = log10(norm(sb3).^2);
%  x4 = log10(norm(sb4).^2);
%  x5 = log10(norm(sb5).^2);
%  x6 = log10(norm(sb6).^2);
%  X = [x1 x2 x3 x4 x5 x6];
%  S4_F4C4_le = cat(1,S4_F4C4_le,X);
%end
%S4_F4C4_le(:,7)=4;


R_F4C4_le=[];
for i = 1:length(r_ch)/(30*fs) 
  [C,L] = wavedec(reshaped_r_ch(:,i),5,Lo_D,Hi_D);
  sb1 = appcoef(C,L,Lo_R,Hi_R,5);
  [sb2,sb3,sb4,sb5,sb6] = detcoef(C,L,[1 2 3 4 5]);
  x1 = log10(norm(sb1).^2);
  x2 = log10(norm(sb2).^2);
  x3 = log10(norm(sb3).^2);
  x4 = log10(norm(sb4).^2);
  x5 = log10(norm(sb5).^2);
  x6 = log10(norm(sb6).^2);
  X = [x1 x2 x3 x4 x5 x6];
  R_F4C4_le = cat(1,R_F4C4_le,X);
end
R_F4C4_le(:,7)=5;

combined_le = [W_F4C4_le; S1_F4C4_le; S2_F4C4_le; S3_F4C4_le; S4_F4C4_le; R_F4C4_le ];  





