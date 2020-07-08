function A = assemble_P1(grid, localassem, Q)
%assembleP1 - assembles  the  global  matrix A_{i,j} = a(λ_j,λ_i)  for  the  linear  finite  elements  nodalbasis {λ_i} on  the  grid grid
% fieldnames(grid) = {
%    [1,1] = nodes
%    [2,1] = elements
%    [3,1] = boundary
%    [4,1] = edges
%  }
N_elements = length(grid.elements);
N_nodes = length(grid.nodes);
A = sparse([], [], [], N_nodes, N_nodes);
for element=grid.elements
    elem_nodes = element(1:3);
    elem_edges = element(4:6);
    P_t = sparse(elem_nodes, [1,3,2], [1,1,1], N_nodes, 3);
    
    % Just for testing
    A_t = [0, 1, 0; 1, -4, 1; 0, 1, 0];
    %
    A += P_t * A_t * P_t';
end

end