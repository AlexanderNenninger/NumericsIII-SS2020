function A = assemble_mass(simplex, basis, quadrature)

T(:,1) = simplex(:,2) - simplex(:,1);
T(:,2) = simplex(:,3) - simplex(:,1);

integrationElement = abs(det(T));

A = zeros(basis.size);

for q = 1:quadrature.size

	p = quadrature.points(:,q);
	w = quadrature.weights(q)*integrationElement;
	
	for i = (1:basis.size)
		v_i = basis.value(p,i);

		for j = (1:basis.size)
			v_j = basis.value(p,j);
			
			A(i,j) = A(i,j) + v_i*v_j* w;
		end
	end
end

