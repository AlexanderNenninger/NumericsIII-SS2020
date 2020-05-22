function [A] = OperatorAssembler(N)
  printf("Not Implemented\n")

  OffDiagBlock = - speye(N)
  OffDiagTemplate =  diag(sparse(ones(N-1,1)), -1) + diag(sparse(ones(N-1,1)), 1)
  
  DiagBlock = 4 * speye(N, N) + diag(-ones(N-1, 1),1) + diag(-ones(N-1, 1),-1);  
  DiagTemplate = speye(N)
  
  A = kron(DiagTemplate, DiagBlock) + kron(OffDiagTemplate, OffDiagBlock)