function refinedRegions = refineRegions(filteredRegions, originalImage)
    % Refine the detected joint positions or regions (optional)
    jointCenters = zeros(numel(filteredRegions), 2); % Preallocate an array for storing the joint centers
    for i = 1:numel(filteredRegions)
        % Find the circular shapes in the regions using imfindcircles
        [centers, radii] = imfindcircles(filteredRegions(i).Image, [10 20], 'ObjectPolarity', 'bright');
        if ~isempty(centers)
            % Choose the circle with the largest radius as the joint center
            [maxRadius, maxIndex] = max(radii);
            jointCenters(i, :) = centers(maxIndex, :);
        else
            % If no circle is found, use the centroid of the region as the joint center
            jointCenters(i, :) = filteredRegions(i).Centroid;
        end
    end

    % Display the joint centers on the original image
    figure;
    imshow(originalImage);
    hold on;
    plot(jointCenters(:, 1), jointCenters(:, 2), 'r+');
    hold off;
    title('Joint Centers');

    % Measure the distance between the joint centers using imdistline
    figure;
    imshow(originalImage);
    hold on;
    for i = 1:3:numel(jointCenters) - 2
        % Create a distance tool for each finger
        h = imdistline(gca, jointCenters(i:i+2, 1), jointCenters(i:i+2, 2));
        % Set the color and label of the distance tool
        setColor(h, 'g');
        setLabelVisible(h, false);
    end
    hold off;
    title('Distance Between Joint Centers');

    % Rotate the regions to align with the finger direction using imrotate
    figure;
    tiledlayout(4, 3); % Create a tiled layout for displaying the rotated regions
    for i = 1:numel(filteredRegions)
        % Crop the region from the original image
        croppedImage = imcrop(originalImage, filteredRegions(i).BoundingBox);
        % Calculate the orientation of the region using the second central moment
        mu = filteredRegions(i).CentralMoment;
        theta = 0.5 * atan2(2 * mu(1, 2), mu(1, 1) - mu(2, 2));
        % Rotate the region by the negative angle of the orientation
        rotatedImage = imrotate(croppedImage, -rad2deg(theta));
        % Display the rotated region in the tiled layout
        nexttile;
        imshow(rotatedImage);
        title(['Region ' num2str(i)]);
    end
    title(tiledlayout, 'Rotated Regions');

    % Return the refined regions as a structure array
    refinedRegions = struct('JointCenter', jointCenters, 'RotatedImage', rotatedImage);
end
