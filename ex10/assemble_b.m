function b = assemble_b(grid, f, Q)  % Computes mass matrix  % Defines function local_assem_mass for that  local_assem_mass = @(S,B,Q) assemble_mass(S,B,Q);    % useses previes definend assemble_P1  M = assemble_P1(grid, local_assem_mass, Q);    % Function evalutaion of lefthand sied f  f_vals = f(grid.nodes(1:2,:))';  % linear interplation by M*f_vals  b = M*f_vals;end