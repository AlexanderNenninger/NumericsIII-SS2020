[x,y] = meshgrid(1:15,1:15);z = peaks(15);T = delaunay(x,y);trisurf(T,x,y,z)