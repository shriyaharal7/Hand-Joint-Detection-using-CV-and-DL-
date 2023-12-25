function jointRegions = identifyJointsWithBoundingBox(binaryImages)
    % Convert the cell array to a numeric array
    binaryImages = cell2mat(binaryImages);

    % Perform morphological operations (you can adjust these operations)
    se = strel('disk', 5);
    dilatedImage = imdilate(binaryImages, se);

    % Extract connected components using bwconncomp
    cc = bwconncomp(dilatedImage);
    % Get region properties using regionprops
    stats = regionprops(cc, 'BoundingBox', 'Area', 'Eccentricity', 'PixelIdxList');

    % Filter out regions based on size (area) and shape (eccentricity)
    minArea = 500;
    maxArea = 5000;
    minEccentricity = 0.5; % Adjust as needed
    maxEccentricity = 0.9; % Adjust as needed

    validIndices = [stats.Area] >= minArea & [stats.Area] <= maxArea & ...
                   [stats.Eccentricity] >= minEccentricity & [stats.Eccentricity] <= maxEccentricity;

    validRegions = stats(validIndices);

    % Create a binary image highlighting valid regions
    jointBinaryImage = false(size(dilatedImage));
    for i = 1:numel(validRegions)
        jointBinaryImage(validRegions(i).PixelIdxList) = true;

        % Draw bounding box around the valid region
        bbox = validRegions(i).BoundingBox;
        jointBinaryImage = insertShape(jointBinaryImage, 'Rectangle', bbox, 'Color', 'red', 'LineWidth', 2);
    end

    jointRegions = jointBinaryImage;
end
