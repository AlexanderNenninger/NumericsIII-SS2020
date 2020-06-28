function [A] = OperatorAssembler(N)
  % Programmed after the numerics Lecture
  
  %% Make N -Id_n blocks on the upper and lower diagonal
  OffDiagBlock = - speye(N+1);
  OffDiagTemplate =  diag(sparse(ones(N,1)), -1) + diag(sparse(ones(N,1)), 1);
  
  % Make block diagonal matrix
  DiagBlock = 4 * speye(N+1, N+1) + diag(-ones(N, 1),1) + diag(-ones(N, 1),-1);  
  DiagTemplate = speye(N+1);
  
  % Assemble A
  A = kron(DiagTemplate, DiagBlock) + kron(OffDiagTemplate, OffDiagBlock);
end