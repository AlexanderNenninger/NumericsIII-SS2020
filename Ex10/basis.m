function B = basis(order)
% Returns a structure representing a set of basis functions on a unit simplex.
% The structure contains the size of this set and functions gradient and value
% to evaluate these quantities of each basis function.

	switch order
		case 1,
			B = struct('size', 3, 'gradient', @P1gradient, 'value', @P1value);
		case 2,
			B = struct('size', 6, 'gradient', @P2gradient, 'value', @P2value);
	end

end


function y = P1value(x, i)
	switch i
		case 1,
			y = 1 - x(1) - x(2);
		case 2 ,
			y = x(1);
		case 3,
			y = x(2);
	end
end

function D = P1gradient(x, i)
	switch i
		case 1,
			D = [-1 -1];
		case 2 ,
			D = [1 0];
		case 3,
			D = [0 1];
	end
end

function y = P2value(x, i)
	switch i
		case 1,
			y = (1-x(1)-x(2))*(1-2*x(1)-2*x(2));
		case 2 ,
			y = x(1)*(2*x(1) - 1);
		case 3,
			y = x(2)*(2*x(2) - 1);
		case 4,
			y = 4*x(1)*x(2);
		case 5,
			y = 4*x(2)*(1-x(1)-x(2));
		case 6,
			y = 4*x(1)*(1-x(1)-x(2));
	end
end

function D = P2gradient(x, i)
	switch i
		case 1,
			D = [4*x(1)+4*x(2)-3  4*x(1)+4*x(2)-3];
		case 2 ,
			D = [4*x(1)-1 0];
		case 3,
			D = [0 4*x(2)-1];
		case 4,
			D = [4*x(2) 4*x(1)];
		case 5 ,
			D = [-4*x(2) 4*(1-x(1)-2*x(2))];
		case 6,
			D = [4*(1-x(2)-2*x(1)) -4*x(1)];
	end
end




