addpath(pwd)
% Tests
N = 7
f = @(x) -1
g = @(x) 0

tx = linspace(0, 1 , N);
[xx, yy] = ndgrid(tx, tx);
zz = ShortleyWeller(f,g,N);

size(xx)
surface(xx, yy, zz);
xlabel ("tx");
ylabel ("ty");
zlabel ("tz");


rmpath(pwd)