function FzEn = signal_fuzzyEntropy(dim,r,data,tau )
%ApEn
%   dim : embedded dimension
%   r : tolerance (typically 0.2 * std)
%   data : time-series data
%   tau : delay time for downsampling

r1=r*std(data);
if nargin < 4, tau = 1; end
if tau > 1, data = downsample(data, tau); end
    
N = length(data);
result = zeros(1,2);

for j = 1:2
    m = dim+j-1;
    phi = zeros(1,N-m+1);
    dataMat = zeros(m,N-m+1);
    
    % setting up data matrix
%     for i = 1:m
%         dataMat(i,:) = data(i:N-m+i);
%     end
idx = bsxfun(@plus, [0:m-1]', 1:numel(data)-(m-1));
dataMat = data(idx);
%     data_mean = mean(dataMat);
%     data_rep = repmat(data_mean,m,1);
%     dataMat_mn = dataMat - data_rep;
    dataMat_mn = bsxfun(@minus, dataMat, mean(dataMat));
    clear data_mean data_rep
    for i = 1:N-m+1
        tempMat = abs(dataMat_mn - repmat(dataMat_mn(:,i),1,N-m+1));
%  tempMat = bsxfun(@minus, dataMat_mn, dataMat_mn(:,i));
        temp_mat = tempMat;
        temp_mat(:,i) = [];
        max_tempmat = max(temp_mat);
        dd = exp(-(max_tempmat.^2)/r1);
        counter = sum(dd)/(N-m-1);
        phi(i) = counter;
        clear tempMat temp_mat dd counter max_tempmat
    end
    result(j) = sum((phi))/(N-m);
    clear phi dataMat_mn dataMat
end
FzEn = log(result(1)/result(2));
end

