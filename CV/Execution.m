% Specify the paths to the folders containing JPEG images and labels
imageFolderPath = 'O:\Pace University MS CS Cources\Computer Vision\Final Project\Original X-ray 48 month\Testing_Image\';
labelFolderPath = 'O:\Pace University MS CS Cources\Computer Vision\Final Project\Original X-ray 48 month\Testing_Texts\';

% Load images and labels
[jpegImages, labels] = loadImagesAndLabels(imageFolderPath, labelFolderPath);

% Preprocess images
equalizedImages = preprocessImages(jpegImages);

% Extract features
extractedFeatures = extractFeatures(equalizedImages);


jointRegions = identifyJoints(binaryImages);

filteredRegions = filterRegions(binaryImages);

%refinedRegions = refineRegions(filteredRegions);