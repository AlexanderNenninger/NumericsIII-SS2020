function Q = quadrature(number)
% Returns a structure containing quadrature nodes and weights as well as their number.

	weights = {
		[0.5],
		[1/6, 1/6, 1/6],
		[],
		[]
	};

	points = {
		[1/3  1/3]',
		[0 0; 1 0; 0 1]',
		[],
		[]
	};

	order = {
		1,
		2,
		[],
		[]
	};


	% order 3 with 3 points by Hammer/Stroud
	r = 1/6;
	s = 4/6;
	points{3} = [r r; r s; s r]';
	weights{3} = [1/6 1/6 1/6];
	order{3} = 3;
	

	% order 6 with 7 points by Radon, Hammer/Marlowe/Stroud
	t = 1/3;
	r = (6-sqrt(15))/21;
	s = (9+2*sqrt(15))/21;
	u = (6+sqrt(15))/21;
	v = (9-2*sqrt(15))/21;
	points{4} = [t t; r r; r s; s r; u u; u v; v u]';
	
	A = 9/40 * 0.5;
	B = (155-sqrt(15))/1200 * 0.5;
	C = (155+sqrt(15))/1200 * 0.5;
	weights{4} = [A B B B C C C];
	
	order{4} = 6;
	

	Q = struct('size', length(weights{number}), 'points', points{number}, 'weights', weights{number}, 'order', order{number});

end

