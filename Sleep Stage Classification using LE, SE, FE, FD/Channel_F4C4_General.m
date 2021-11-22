
w_ch = W(ch,:);
s1_ch = S1(ch,:);
s2_ch = S2(ch,:);
s3_ch = S3(ch,:);
s4_ch = S4(ch,:);
r_ch = R(ch,:);


reshaped_w_ch = reshape(w_ch,30*fs,length(w_ch)/(30*fs));
reshaped_s1_ch = reshape(s1_ch,30*fs,length(s1_ch)/(30*fs));
reshaped_s2_ch = reshape(s2_ch,30*fs,length(s2_ch)/(30*fs));
reshaped_s3_ch = reshape(s3_ch,30*fs,length(s3_ch)/(30*fs));
reshaped_s4_ch = reshape(s4_ch,30*fs,length(s4_ch)/(30*fs));
reshaped_r_ch = reshape(r_ch,30*fs,length(r_ch)/(30*fs));

%-----------------------------------------------------------------------%