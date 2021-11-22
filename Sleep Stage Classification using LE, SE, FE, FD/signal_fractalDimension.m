function [features, featuresName] = signal_fractalDimension(signal, varargin)

fd = fd_signal(signal);

if length(varargin)==1
    headerTxt = [varargin{1}, '_'];
else
    headerTxt = '';
end

featuresName = [headerTxt, 'Fractal Dimension'];

features = fd;
end

function fd = fd_signal(dat)

% dat = normalizeData(dat);

lavall = [];
kmax = 128;
[aaa, bbb] = size(dat);
aaa = max(aaa, bbb);
nmax = aaa;
lav  = zeros(1, kmax);

for kk=1:kmax/2;
% 	kk;
	sum2 = 0.;
	trial = 0;
	for mm=1:kk;
        sum1 = 0;
        imax = fix((nmax-mm)/kk);
        for ii=1:imax;
            sum1 = sum1 + abs(dat(mm+ii*kk)-dat(mm+(ii-1)*kk));
        end
	sum1 = sum1/imax;
	trial(mm) = sum1;
	sum2 = sum2+sum1;
	end
lav(kk) = sum2.*(nmax-1)/(kk^(3));
end

% kx = 1:kmax;
%     loglog(kx, lav)
%     ylabel('L(k)')
lavall = [lavall lav]; 

% kmin = 1;
indexl1 = 1; 

% kmedl = 11;
indexl2 = 9;

% kmedh = 11;
% indexh1 = 9; 
% 
% kmax = 64;
% indexh2 = 19;  

yy = lavall(1:64);

index = zeros(1, 19);
index(1) = 1;
index(2 )= 2;
index(3) = 3;
index(4) = 4;
index(5) = 5;
index(6) = 6;

for jj=13:25;
	index(jj-6) = fix(2^((jj-1)/4));
end;

% xxt = (1:64);
xl = log10((1:64));
yl = log10(yy(1:64));

p1 = polyfit(xl(index(indexl1:indexl2)), yl(index(indexl1:indexl2)), 1); 
% sprintf('The Fractal Dimension for the given time series using Higuchis method %f', p1(1))

fd = abs(p1(1));
end
