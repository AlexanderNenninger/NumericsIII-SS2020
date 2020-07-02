function [F] = FunctionalAssembler(f, g, N)
  printf("Not implemented\n")
  %
  h = 1/N;
  % Boundary values (x,y) is boundary value if either x in {0,1} or y in {0,1}.
  idxs = {linspace(0,1,N+1), [0,1]};
  [xx, yy] = ndgrid(idxs{:});
  Boundary = [xx(:) yy(:); yy(:) xx(:)];
  
  F = zeros((N+1)^2,1);
  for i=1:N+1
    for j=1:N+1
      x = [i*h, j*h];
      F((N+1)*(j-1) + i) = f(x);
      for k=1:size(Boundary)(1)
        y = Boundary(k);
        F((N+1)*(j-1) + i) += alpha(x, y, N) * g(y);
      end
    end
  end
end