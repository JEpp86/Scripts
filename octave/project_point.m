1;
% Project a point from 3D to 2D using a matrix operation

%% Given: Point p in 3-space [x y z], and focal length f
%% Return: Location of projected point on 2D image plane [u v]
function p_img = project_point (p, f)
  %% TODO: Define and apply projection matrix
  f_mat = [f 0 0 0;
           0 f 0 0;
           0 0 1 0];
  p_hg = [p 1]';
  pt = f_mat * p_hg;
  p_img = [(pt(1)/pt(3)) (pt(2)/pt(3))];
      
endfunction

%% Test: Given point and focal length (units: mm)
p = [200 100 120];
f = 50;

disp(project_point(p, f));
