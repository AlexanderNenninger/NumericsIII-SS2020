function grid = generate_grid(raw_nodes, raw_elements)
% Generate a grid containing edge and boundary information from raw node and element lists
% Indices are ordered such that edge i is opposite to node i in each element
%
% Usage:
%    grid = generate_grid(nodes, raw_elements)
%
% Input:
%    raw_nodes     - a 2xn list of nodes
%    raw_elements  - a 3xm list of elements
%
% Output:
%    grid          - a structure containing:
%    grid.nodes      list of node given by coordinates (1:2,:) and is boundary information (3,:)
%    grid.boundary   is boundary information per node (1,:)
%    grid.edges      list of edges given by node numbers (1:2,:)
%    grid.elements   list of triangles given by node numbers (1:3,:) and edge numbers (4:6,:)



n_nodes = size(raw_nodes, 2);
n_elements = size(raw_elements, 2);

edge_mat = spalloc(n_nodes, n_nodes, 10*n_nodes);

elements = [raw_elements(1:3,:) ; zeros(3, n_elements)];

n_edges = 0;
for k = 1:n_elements
	t = sort(elements(1:3, k));

	ij = 1;
	for i=1:3
		for j=(i+1):3
			if (edge_mat(t(i),t(j))==0)
				n_edges = n_edges + 1;
				edge_mat(t(i),t(j)) = n_edges;
			end
			elements(3+ij, k) = edge_mat(t(i), t(j));
			ij = ij+1;
		end
	end
end

[i,j,k] = find(edge_mat);
edges = zeros(3, n_edges);
edges(1:2, k) = [i' ; j'];
edges(3,:) = 2;

for i=1:n_elements
	indices = elements(4:6,i);
	edges(3, indices) = edges(3,indices)-1;
	elements(1:6,i) = sort_indices(elements(1:6,i), edges);
end

boundary = zeros(1,size(raw_nodes,2));
boundary_edges = find(edges(3,:)==1);
boundary(edges(1,boundary_edges)) = 1;
boundary(edges(2,boundary_edges)) = 1;

raw_nodes(3,:) = boundary;

grid = struct('nodes', raw_nodes, 'elements', elements, 'boundary', boundary, 'edges', edges);

end

function t = sort_indices(t,edges)
	t = [sort(t(1:3)); t(4:6)];
	
	for i=1:2
		for j=(i+1):3
			if ((edges(1,t(3+i))==t(i)) | (edges(2,t(3+i))==t(i)))
				dummy = t(3+i);
				t(3+i) = t(3+j);
				t(3+j) = dummy;
			end
		end
	end
end

