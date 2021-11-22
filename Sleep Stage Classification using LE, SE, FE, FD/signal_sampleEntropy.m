function [features, featuresName] = signal_sampleEntropy(signal, varargin)

% z = normalizeData(signal);
% sampen(signal, M, r, sflag, cflag, vflag)   
e = sampen(signal, 4, 0.2); % 4, 0.2
    
sampleEnt = mean(e);

if length(varargin)==1
    headerTxt = [varargin{1}, '_'];
else
    headerTxt = '';
end

featuresName = [headerTxt, 'Sample Entropy'];

features = sampleEnt;
end

function [e, se, A, B] = sampen(y, M, r, sflag, cflag, vflag)
% function e=sampen(y,M,r);
%
%Input Parameters
%
%y  input signal vector
%M  maximum template length (default M=5)
%r  matching threshold (default r=.2)
%
%Output Parameters
%
%e sample entropy estimates for m=0,1,...,M-1
%
%Full usage:
%
%[e,se,A,B]=sampen(y,m,r,sflag,cflag,vflag)
%
%Input Parameters
%
%sflag    flag to standardize signal(default yes/sflag=1) 
%cflag    flag to use fast C code (default yes/cflag=1) 
%vflag    flag to calculate standard errors (default no/vflag=0) 
%
%Output Parameters
%
%se standard error estimates for m=0,1,...,M-1
%A number of matches for m=1,...,M
%B number of matches for m=0,...,M-1
%  (excluding last point in Matlab version)

if ~exist('M') || isempty(M),M = 5;end
if ~exist('r') || isempty(r),r = .2;end
if ~exist('sflag') || isempty(sflag),sflag = 1;end
if ~exist('cflag') || isempty(cflag),cflag = 1;end
if ~exist('vflag') || isempty(cflag),vflag = 0;end

y = y(:);
n = length(y);

if sflag>0
   y = y-mean(y);
   s = sqrt(mean(y.^2));   
   y = y/s;
end

if nargout>1
    if vflag>0
        se = sampense(y, M, r);
    else
        se = [];
    end
end

if cflag>0
    [e, A, B] = sampenc(y, M, r);
   return 
else   
    [match, R] = cmatches(y, n, r);
    match = double(match);
end

k = length(match);

if k<M
   match((k+1):M)=0;
end

N = n*(n-1)/2;
A = match(1:M);
B = [N; A(1:(M-1))];
N = n*(n-1)/2;
p = A./B;
e = -log(p);
end

function [e, A, B] = sampenc(y, M, r)
%function [e,A,B]=sampenc(y,M,r);
%
%Input
%
%y input data
%M maximum template length
%r matching tolerance
%
%Output
%
%e sample entropy estimates for m=0,1,...,M-1
%A number of matches for m=1,...,M
%B number of matches for m=0,...,M-1 excluding last point

n = length(y);
lastrun = zeros(1, n);
run = zeros(1, n);
A = zeros(M, 1);
B = zeros(M, 1);
p = zeros(M, 1);
e = zeros(M, 1);

for i=1:(n-1)
   nj = n-i;
   y1 = y(i);
   
   for jj=1:nj
      j = jj+i;
      
      if abs(y(j)-y1)<r
         run(jj) = lastrun(jj)+1;
         M1 = min(M, run(jj));
         
         for m=1:M1           
            A(m) = A(m)+1;
            
            if j<n
               B(m) = B(m)+1;
            end            
         end
      else
         run(jj) = 0;
      end      
   end
   
   for j=1:nj
      lastrun(j) = run(j);
   end
end

N = n*(n-1)/2;
B = [N; B(1:(M-1))];
p = A./B;
e = -log(p);
end
