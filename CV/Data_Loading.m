% Specify the paths to the folders containing JPEG images and labels
imageFolderPath = 'O:\Pace University MS CS Cources\Computer Vision\Final Project\Original X-ray 48 month\Output Images\';
labelFolderPath = 'O:\Pace University MS CS Cources\Computer Vision\Final Project\Original X-ray 48 month\txt\';

% Get a list of all JPEG files in the image folder
jpegFiles = dir(fullfile(imageFolderPath, '*.jpg'));

% Initialize arrays to store images and labels
jpegImages = cell(numel(jpegFiles), 1);
labels = cell(numel(jpegFiles), 1);

% Loop through the images and labels
for i = 1:numel(jpegFiles)
    % Get the image filename
    imageFileName = jpegFiles(i).name;
    
    % Generate the label filename based on the image filename
    [~, imageName, ~] = fileparts(imageFileName);
    labelFileName = [imageName '_v06.txt'];
    
    % Construct the full file paths for images and labels
    imagePath = fullfile(imageFolderPath, imageFileName);
    labelPath = fullfile(labelFolderPath, labelFileName);
    
    % Read the JPEG image
    jpegImages{i} = imread(imagePath);
    
    % Read the label information
    labelFileContent = fileread(labelPath);
    labelLines = strsplit(labelFileContent, '\n');
    
    % Assuming the label file has one line of information
    labelInfo = strsplit(labelLines{2}, ' ');
    
    % Extract label information (modify as needed based on your label format)
    labelType = labelInfo{1};
    xCoord = str2double(labelInfo{2});
    yCoord = str2double(labelInfo{3});
    angle = str2double(labelInfo{4});
    
    % Store the label information
    labels{i} = struct('type', labelType, 'x', xCoord, 'y', yCoord, 'angle', angle);
end

% Now 'jpegImages' contains the image data, and 'labels' contains the label information


% Preprocessing Steps

% 1. Resize images to a common size
targetSize = [256, 256];
resizedImages = cellfun(@(x) imresize(x, targetSize), jpegImages, 'UniformOutput', false);

% 2. Normalize pixel values to the range [0, 1]
normalizedImages = cellfun(@(x) double(x) / 255, resizedImages, 'UniformOutput', false);

% 3. Adjust contrast using imadjust
adjustedImages = cellfun(@(x) imadjust(x), normalizedImages, 'UniformOutput', false);

% 4. (Optional) Histogram equalization
equalizedImages = cellfun(@(x) histeq(x), adjustedImages, 'UniformOutput', false);

% Now 'equalizedImages' contains the preprocessed images, and 'labels' contains the label information
% You can use these arrays for further processing and analysis
