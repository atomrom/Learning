function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

C = 1;
sigma = 0.1;

return;

x1 = [1 2 1]; x2 = [0 4 -1];

C_vec = [0.01 0.03 0.1 0.3 1 3 10 30];
sigma_vec = [0.01 0.03 0.1 0.3 1 3 10 30];

min_error = 2^30;

max_i = 1;
max_j = 1;

for i=1:columns(C_vec)
  for j=1:columns(sigma_vec)    
    model = svmTrain(X, y, C_vec(i), @(x1, x2) gaussianKernel(x1, x2, sigma_vec(j))); 

    predictions = svmPredict(model, Xval);
    error = mean(double(predictions ~= yval));
    
    if error < min_error
      min_error = error;
      
      max_i = i;
      max_j = j;
    end
  end
end

C = C_vec(max_i);
sigma = sigma_vec(max_j);

disp(C);
disp(sigma);

% =========================================================================

end
