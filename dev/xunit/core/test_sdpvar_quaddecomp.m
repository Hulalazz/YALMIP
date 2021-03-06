function test_sdpvar_quaddecomp

yalmip('clear');
sdpvar a b
p = 2*b^2+a^2;

[Q,c,f,dummy,nonquadratic] = vecquaddecomp(p,[a b]);
assertTrue(norm(full(Q{1})-[1 0;0 2])<1e-10);

yalmip('clear');
sdpvar a b
p = 2*b^2+a^2+3*a*b;
[Q,c,f,dummy,nonquadratic] = vecquaddecomp(p,[a b]);
assertTrue(norm(full(Q{1})-[1 1.5;1.5 2])<1e-10);

yalmip('clear');
sdpvar a b
p = 2*b^2+3*a*b+a^2;
[Q,c,f,dummy,nonquadratic] = vecquaddecomp(p,[a b]);
assertTrue(norm(full(Q{1})-[1 1.5;1.5 2])<1e-10);

yalmip('clear');
sdpvar a b
p = 3*a*b+a^2+2*b^2+b(1);
[Q,c,f,dummy,nonquadratic] = vecquaddecomp(p,[a b]);
assertTrue(norm(full(Q{1})-[1 1.5;1.5 2])<1e-10);
assertTrue(norm(full(c{1}-[0;1]))<1e-10);


