function extractedFeatures = extractFeatures(equalizedImages)
    % Check if equalizedImages is a cell array
    if ~iscell(equalizedImages)
        error('Input equalizedImages must be a cell array');
    end

    extractedFeatures = cell(size(equalizedImages));

    for i = 1:numel(equalizedImages)
        % Apply edge detection using the Canny edge detector
        edges = edge(equalizedImages{i}, 'Canny', [0.05, 0.1]); % Adjust thresholds as needed
        
        % Apply morphological operations to enhance or diminish certain features
        se = strel('disk', 3);  % Adjust the structuring element size as needed

        % Erosion (to diminish features)
        erodedImage = imerode(equalizedImages{i}, se);

        % Dilation (to enhance features)
        dilatedImage = imdilate(erodedImage, se);

        % Combine eroded and dilated edges (or use one of them based on your needs)
        combinedEdges = erodedImage + dilatedImage;

        % Store the result
        extractedFeatures{i} = combinedEdges;

        % Visualize the original image, edges, and processed image for a few samples
        if i <= 3
            figure;
            subplot(2, 3, 1); imshow(equalizedImages{i}); title('Original Image');
            subplot(2, 3, 2); imshow(edges); title('Canny Edge Detection');
            subplot(2, 3, 3); imshow(erodedImage); title('erodedImage');
            subplot(2, 3, 4); imshow(dilatedImage); title('Dilated Image');
            subplot(2, 3, 5); imshow(combinedEdges); title('Combined Edges');
            subplot(2, 3, 6); imshow(extractedFeatures{i}); title('Extracted Images');
        end
    end
end
