warning('off', 'Octave:possible-matlab-short-circuit-operator');local_assem_stiff = @(S,B,Q) assemble_stiff(S,B,Q);f = @(x) F_wtf(x);g = @(x) zeros(1,length(x(1,:)));B = basis(1);Q3 = quadrature(3);Q1 = quadrature(1);M = 40grid = uniform_grid(M,M);A = assemble_P1(grid,local_assem_stiff,Q1);b = assemble_b(grid,f,Q3);[A,b] = assemble_dirichlet(grid,A,b,g);U = A\b;x = grid.nodes(1,:);y = grid.nodes(2,:);T = grid.elements(1:3,:);trisurf(T',x,y,U)grid = load("circle.mat");A = assemble_P1(grid,local_assem_stiff,Q1);b = assemble_b(grid,f,Q3);[A,b] = assemble_dirichlet(grid,A,b,g);U = A\b;x = grid.nodes(1,:);y = grid.nodes(2,:);T = grid.elements(1:3,:);trisurf(T',x,y,U)