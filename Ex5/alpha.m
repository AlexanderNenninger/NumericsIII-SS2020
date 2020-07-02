function a = alpha(x,y, N)
  if norm(x-y, 1) < 1/(2*N)
    a = -4;
  elseif norm(x-y, 1) <= 1/(N-1)
    a=1;
  else
    a=0;
  end
end