1;
%find best match Stereo
function best_x = find_best_match(patch, strip)
  %Find patch in strip and return column index
  min_diff = Inf;
  best_x = 0; %init at no difference
  for x = 1:(size(strip)(2) - size(patch)(2) + 1)
    other_patch = strip(:, x:(x + size(patch)(2) - 1));
    diff = sumsq((patch - other_patch)(:));
    if diff < min_diff
      min_diff = diff;
      best_x = x;
    endif
  endfor
endfunction

pkg load image;
%% load images 
left = imread('left_img.png');
right = imread('right_img.png');
figure, imshow(left);
figure, imshow(right);

%% convert to grayscale, double [0,1] range for easist computation
left_gray = double(rgb2gray(left))/255.0;
right_gray = double(rgb2gray(right))/255.0;

%% define location and size of patch
patch_loc = [120 170];
patch_size = [15 15];

%%extract patch from left image
patch_left = left_gray(patch_loc(1):(patch_loc(1) + patch_size(1) - 1),
patch_loc(2):(patch_loc(2) + patch_size(2) - 1));
figure, imshow(patch_left);
  
%%extract strip from right image
strip_right = right_gray(patch_loc(1):(patch_loc(1) + patch_size(1) - 1), :);
figure, imshow(strip_right);  
  
%look for match 
best_x = find_best_match(patch_left, strip_right);
disp(best_x);
  
 