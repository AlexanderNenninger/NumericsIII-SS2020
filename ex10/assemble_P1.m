function A = assemble_P1(grid, local_assem, Q)    N = length(grid.nodes);  % crates output matrix  A = sparse(N,N);    B = basis(1);    % Loops over the the trianulars  for n = 1:length(grid.elements(1,:))    % Collects each simplexs S and there nodes F    F = grid.elements(1:3,n);    S = [];    for k = F'      S = [S, grid.nodes(1:2,k)];    end    % Complutes integral    A_loc = local_assem(S,B,Q);    % uses F to map to figuare out the indexes i,j    i = reshape(repmat(F,1,3),[1,9]);    j = reshape(repmat(F',3,1),[1,9]);        % acutal maping    A = A + sparse(i,j, reshape(A_loc, [1,9]),N,N);   endend