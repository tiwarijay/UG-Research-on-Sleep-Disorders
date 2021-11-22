

W = [];
for i = 1:length(w)
    if w(i)~=0
        w1 = record(:,((w(i)+1)-(fs*30)):w(i));
        W = cat(2,W,w1);
    end
end
        

S1 = [];
for i = 1:length(s1)
    if s1(i)~=0
        s11 = record(:,((s1(i)+1)-(fs*30)):s1(i));
        S1 = cat(2,S1,s11);
    end
end


S2 = [];
for i = 1:length(s2)
    if s2(i)~=0 
        s21 = record(:,((s2(i)+1)-(fs*30)):s2(i));
        S2 = cat(2,S2,s21);
    end
end


S3 = [];
for i = 1:length(s3)
    if s3(i)~=0
        s31 = record(:,((s3(i)+1)-(fs*30)):s3(i));
        S3 = cat(2,S3,s31);
    end
end


S4 = [];
for i = 1:length(s4)
    if s4(i)~=0
        s41 = record(:,((s4(i)+1)-(fs*30)):s4(i));
        S4 = cat(2,S4,s41);
    end
end
                                                                                                                                                                                                     

R = [];
for i = 1:length(r)
    if r(i)~=0
        r1 = record(:,((r(i)+1)-(fs*30)):r(i));
        R = cat(2,R,r1);
    end
end