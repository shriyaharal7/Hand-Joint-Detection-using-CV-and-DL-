%preprocessing Imges
function [equalizedImages, binaryImages] = preprocessImages(jpegImages)
    targetSize = [512, 512];
    
    % Resize images
    resizedImages = cellfun(@(x) imresize(x, targetSize), jpegImages, 'UniformOutput', false);
    
    % Convert to greyscale
    grayscaleImages = resizedImages;
    
    % Normalize pixel values to the range [0, 1]
    normalizedImages = cellfun(@(x) double(x) / 255, grayscaleImages, 'UniformOutput', false);
    
    % Adjust contrast using imadjust
    adjustedImages = cellfun(@(x) imadjust(x), normalizedImages, 'UniformOutput', false);
    
    % Histogram equalization
    equalizedImages = cellfun(@(x) histeq(x), adjustedImages, 'UniformOutput', false);
    
    % Binarize images
    binaryImages = cellfun(@(x) imbinarize(x), equalizedImages, 'UniformOutput', false);
    
  
    
    % Store variables in MATLAB workspace
    assignin('base', 'equalizedImages', equalizedImages);
    assignin('base', 'binaryImages', binaryImages);
end




