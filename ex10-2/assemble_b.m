function b = assemble_b(grid, f, Q)  local_assem_mass = @(S,B,Q) assemble_mass(S,B,Q);  M = assemble_P1(grid, local_assem_mass, Q);  f_vals = f(grid.nodes(1:2,:))';  b = M*f_vals;end