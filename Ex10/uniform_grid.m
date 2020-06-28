function grid = uniform_grid(n,m)
% Creates a uniform triangular grid with n-by-m nodes on the unit square
%
% Usage:
%    grid = uniform_grid(n,m)
%
% Input:
%    n      - number of nodes in x direction
%    m      - number of nodes in y direction
%
% Output:
%    grid          - a structure containing:
%    grid.nodes      list of node given by coordinates
%    grid.boundary   is boundary information per node
%    grid.edges      list of edges given by node numbers
%    grid.elements   list of triangles given by node numbers (1:3,:) and edge numbers (4:6,:)

x = linspace(0, 1, n);
y = linspace(0, 1, m);
[X,Y] = meshgrid(x,y);

N = [X(:)'; Y(:)'];
T = zeros(3, (n-1)*(m-1)*2);

k = 1;
for i=1:(n-1)
	for j=1:(m-1)
		T(1,k) = (i-1)*m + j;
		T(2,k) = (i-1)*m + j + 1;
		T(3,k) = i*m + j;
		k = k+1;
		T(1,k) = (i-1)*m + j + 1;
		T(2,k) = i*m + j + 1;
		T(3,k) = i*m + j;
		k = k+1;
	end
end

grid = generate_grid(N, T);

