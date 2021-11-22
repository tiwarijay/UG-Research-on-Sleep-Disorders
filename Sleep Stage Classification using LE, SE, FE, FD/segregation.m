
w = [];s1 = []; s2 = [];s3=[];s4=[];r=[];
j = 1;
for i=1:length(hyp)
if hyp(i,1)==0
    w(j) = hyp(i,2);
    j = j+1;
elseif hyp(i,1)==1
    s1(j) = hyp(i,2);
    j=j+1;
elseif hyp(i,1)==2
    s2(j) = hyp(i,2);
    j = j+1;
elseif hyp(i,1)==3
    s3(j) = hyp(i,2);
    j = j + 1;
elseif hyp(i,1)==4
    s4(j) = hyp(i,2);
    j = j+1;
elseif hyp(i,1)==5
    r(j) = hyp(i,2);
    j = j+1;
else
    continue
end
end

fs = hdr.frequency(ch);

w=w*fs; s1=s1*fs; s2=s2*fs ;s3=s3*fs; s4=s4*fs ;r=r*fs;

