imageDir = 'O:\Pace University MS CS Cources\Computer Vision\Final Project\Original X-ray 48 month\Output Images';
labelDir = 'O:\Pace University MS CS Cources\Computer Vision\Final Project\Original X-ray 48 month\txt';

% Get a list of all image files in the directory
imageFiles = dir(fullfile(imageDir, '*.jpg'));

% Get a list of all label files in the directory
labelFiles = dir(fullfile(labelDir, '*.txt'));

% Extract the names of image files (excluding the file extension)
imageNames = cellfun(@(x) erase(x, '.jpg'), {imageFiles.name}, 'UniformOutput', false);

% Extract the names of label files (excluding the file extension)
labelNames = cellfun(@(x) erase(x, '_v06.txt'), {labelFiles.name}, 'UniformOutput', false);

% Find the names of image files that do not have a corresponding label file
missingImageNames = setdiff(imageNames, labelNames);

disp(missingImageNames);
