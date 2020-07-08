function A = assemble_stiff(simplex, basis, quadrature)

T(:,1) = simplex(:,2) - simplex(:,1);
T(:,2) = simplex(:,3) - simplex(:,1);

inverseT = inv(T);

integrationElement = abs(det(T));

A = zeros(basis.size);

for q = 1:quadrature.size

	p = quadrature.points(:,q);
	w = quadrature.weights(q)*integrationElement;
	
	for i = (1:basis.size)
		grad_i = basis.gradient(p,i)*inverseT;

		for j = (1:basis.size)
			grad_j = basis.gradient(p,j)*inverseT;
			
			A(i,j) = A(i,j) + grad_i*grad_j' * w;
		end
	end
end

