clear all;
close all;
load yalefaces.mat 
tic
%h=height, w = width, n = number of pictures 
h = 32;
w = 32;
n = 2414;

% reshape images so that there is one face per column
x =fea;
x = double(x);

%subtract mean (centering)
x=bsxfun(@minus, x, mean(x,1));

% Calculate svd as a substitute for the covariance matrix
[LEFT,  SIGMA , RIGHT] = svd(x); % get the LEFT singular values, the diagonal matrix SIGMA, and the RIGHT singular values

% show 0th through 15th principal eigenvectors
eig0 = reshape(mean(x,1), [h,w]);
figure,subplot(4,4,1)
imagesc(eig0)
colormap spring
for i = 1:15
    subplot(4,4,i+1)
    imagesc(reshape(RIGHT(:,i),h,w))
end
toc