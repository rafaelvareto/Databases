clear

essentialName = 'Gallery';

txtFilePath  = ['D:\GIT\Databases\icbrw\icbrw_original\annotations_' essentialName 'Images.txt'];
imgFilePath = ['D:\GIT\Databases\icbrw\icbrw_original\icbrw_' essentialName 'Images\'];
imgCropPath = ['D:\GIT\Databases\icbrw\icbrw_cropped\icbrw_' essentialName 'Images\'];

fileID = fopen(txtFilePath);
imageNames = textscan(fileID, '%s %d %d %d %d');
imgSet = imageSet(imgFilePath);

for index = 1 : size(imageNames{1}, 1)
    imageName = char(imageNames{1}(index));
    imagePath = [imgFilePath imageName];
    disp(imagePath);
    
    x = imageNames{2}(index);
    y = imageNames{3}(index);
    w = imageNames{4}(index);
    h = imageNames{5}(index);
    
    image = imread(imagePath);
    crop = imcrop(image, [x y w h]);
    imwrite(crop, [imgCropPath imageName]);
end
