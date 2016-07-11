gallery = imageSet('Gallery');
probe = imageSet('Probe');
evaluation = imageSet('Evaluation');

featureCount = 1;
%training.features = zeros(size(gallery, 2), 4356); %hog descriptor size = 4356

for inner = 1 : 90
    sample = imresize(read(gallery, inner), [256 256]);
    %gray = rgb2gray(sample);
    imshow(sample); pause;
    learning.features(featureCount, :) = extractHOGFeatures(sample);
    featureCount = featureCount + 1;
end