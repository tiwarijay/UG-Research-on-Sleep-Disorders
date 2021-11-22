clc;clear;close all;
% Random balancing of data
% Author: Shivani Dhok
% Cyclic Alternating patterns work


% Load Data of A1, A2, A3 and B for thr required subject
% Change the file path as per you system...
load('E:\SHIVANI_DHOK\Research_paper_info\CAP\CAP_NEW_30Sept\CAPA123B_6DEC\n11\A1.mat')
load('E:\SHIVANI_DHOK\Research_paper_info\CAP\CAP_NEW_30Sept\CAPA123B_6DEC\n11\A2.mat')
load('E:\SHIVANI_DHOK\Research_paper_info\CAP\CAP_NEW_30Sept\CAPA123B_6DEC\n11\A3.mat')
load('E:\SHIVANI_DHOK\Research_paper_info\CAP\CAP_NEW_30Sept\CAPA123B_6DEC\n11\B0.mat')

% Data_A1: variable name for A1 data
% Data_A2: variable name for A2 data
% Data_A3: variable name for A3 data
% Data_B0: variable name for B data

% Get size of A2 (Generally a minimum. In one or two cases its A3, so change accordingly)
[l r1] = size(Data_A2);

% Get size of A1
[a b] = size(Data_A1);

% Get series of random numbers in range of 1 to a
r = randperm(a);
% Consider only first l values 
idxA1 = r(1:l);
% Get the data corresponding to the random index
A1 = Data_A1(idxA1,:);

% Repeat same for A2
[a b] = size(Data_A2);
r = randperm(a);
idxA2 = r(1:l);
A2 = Data_A2(idxA2,:);

% Repeat same for A3
[a b] = size(Data_A3);
r = randperm(a);
idxA3 = r(1:l);
A3 = Data_A3(idxA3,:);

% Number of B samples should be 3 times so, l1 = 3*l
% Rest of the process same
l1 = 3*l;
[a b] = size(Data_NA);
r = randperm(a);
idxNA = r(1:l1);
B0 = Data_NA(idxNA,:);

% Appending the entire data one below other
% Initially, the labels for B: 0, A1: 1, A2: 2 and A3: 3
% Combine A as [A1;A2;A3] and make the lastcolumn corresponding to label entirely as 1
% Keep label of B as 0
val = [[[A1(:,1:end-1);A2(:,1:end-1);A3(:,1:end-1)] ones(l*3,1)];B0];

% You may save 'val' entirely or save 'A1', 'A2', 'A3' and 'B' separtely as per your
% convinience.
