%% Using our faces now 
% mean image vector from the database
M = mean(x,1)';
F=fea';
%initializing to store variables in forloop
G = zeros(1024, 2414);
% soliving Image vector - mean image vector 
for j=1:n
IV= (F(:,j)- M); 
G(:,j)=IV;
end
%forming the weight vector for the database 
Wd = RIGHT'*G;

%getting my face 
testAlice = imread('BenAdcock.jpg');                     
test = rgb2gray(testAlice);  % convert to grayscale
test = double(test);
%resizing the image 
test = imresize(test, [32 32]);
%centering the image 
test=bsxfun(@minus, test, mean(test,2));

Rtest = reshape(test, [h*w,1]);

Wt = RIGHT' *(Rtest-M);

% now we wish to find the euclidean distance between Wd and Wt 
distance = zeros(2414,1);
for j = 1:n
distance(j) = norm(Wt-Wd(:,j)); 
end

closestFace = find(distance == min(distance))
gnd(closestFace)


figure()
colormap default
imagesc(reshape(fea(closestFace,:), [h,w]))

%%

