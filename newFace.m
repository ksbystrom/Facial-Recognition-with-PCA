%% Using our faces now 
% Make sure you have run the file "eigenfaces_svd.m"
% before running this file

%Set the number of eigenfaces to use for the reconstruction (100)
n_eigen = 150;

% mean image vector from the database
M = mean(x,1)';
F=fea';
%initializing to store variables in forloop
G = zeros(1024, 2414);
% solving Image vector - mean image vector 
for j=1:n
IV= (F(:,j)- M); %get the jth vector and subtract the mean 
G(:,j)=IV; %store the centered vector as the jth vector of G
end
%forming the weight vector for the database 
Wd = RIGHT(:,1:n_eigen)'*G;

%getting my face 
myFace = imread('Kristenblack.jpg');                     
myFace = rgb2gray(myFace);  % convert to grayscale
myFace = double(myFace);
%resizing the image 
myFace = imresize(myFace, [32 32]);
%centering the image 
myFace=bsxfun(@minus, myFace, mean(myFace,2));

Rtest = reshape(myFace, [h*w,1]);

Wt = RIGHT(:,1:n_eigen)' *(Rtest-M);

% now we wish to find the euclidean distance between Wd and Wt 
distance = zeros(2414,1);
for j = 1:n
distance(j) = norm(Wt-Wd(:,j)); 
end

% Find the closest face based on the minimum distance
closestFace = find(distance == min(distance));
disp("The distance between yours and the closest face is:")
disp(closestFace)
disp("The index number of the closest face is:")
disp(gnd(closestFace))

% Display the face that was selected as the closest
figure()
colormap default
imagesc(reshape(fea(closestFace,:), [h,w]))

%%

