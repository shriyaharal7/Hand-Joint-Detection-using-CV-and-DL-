function [jpegImages, labels] = loadImagesAndLabels(imageFolderPath, labelFolderPath)
    jpegFiles = dir(fullfile(imageFolderPath, '*.jpg'));
    jpegImages = cell(numel(jpegFiles), 1);
    labels = cell(numel(jpegFiles), 1);

    for i = 1:numel(jpegFiles)
        imageFileName = jpegFiles(i).name;
        [~, imageName, ~] = fileparts(imageFileName);
        labelFileName = [imageName '_v06.txt'];
        imagePath = fullfile(imageFolderPath, imageFileName);
        labelPath = fullfile(labelFolderPath, labelFileName);

        jpegImages{i} = imread(imagePath);

        labelFileContent = fileread(labelPath);
        labelLines = strsplit(labelFileContent, '\n');
        labelInfo = strsplit(labelLines{2}, ' ');

        labelType = labelInfo{1};
        xCoord = str2double(labelInfo{2});
        yCoord = str2double(labelInfo{3});
        angle = str2double(labelInfo{4});

        labels{i} = struct('type', labelType, 'x', xCoord, 'y', yCoord, 'angle', angle);
    end
end
