% Apply the joint detection function to the binary images
detectedJoints = identifyJoints(binaryImages);

% Convert the images to logical (binary) format
groundTruth = logical(groundTruth);
detectedJoints = logical(detectedJoints);

% Create a confusion matrix
confMatrix = confusionmat(groundTruth(:), detectedJoints(:));

% Calculate evaluation metrics
accuracy = sum(diag(confMatrix)) / sum(confMatrix(:));
precision = confMatrix(2, 2) / (confMatrix(2, 2) + confMatrix(1, 2));
recall = confMatrix(2, 2) / (confMatrix(2, 2) + confMatrix(2, 1));
specificity = confMatrix(1, 1) / (confMatrix(1, 1) + confMatrix(1, 2));
f1Score = 2 * (precision * recall) / (precision + recall);

% Display the results
disp(['Accuracy: ' num2str(accuracy)]);
disp(['Precision: ' num2str(precision)]);
disp(['Recall: ' num2str(recall)]);
disp(['Specificity: ' num2str(specificity)]);
disp(['F1 Score: ' num2str(f1Score)]);
