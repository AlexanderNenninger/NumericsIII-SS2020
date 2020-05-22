addpath(pwd)
% Tests
N = 10
f = @(x) -1
g = @(x) 0

solution = ShortleyWeller(f,g,N)

rmpath(pwd)