function [] = solveF(c1, c2, k2, k3, k4, k5, k6, k2a, f)

syms x y z

k1 = k2a.*exp(0.05*f);
k1 = round(k1, 4);

e1 = k1.*(c1 - x - y - z) - k2.*x - k3.*x.*(c2 - y - z) + k4.*y == 0;
e2 = k3.*x.*(c2 - y - z) - k4.*y - k5.*y + k6.*z == 0;
e3 = k5.*y - k6.*z == 0;

sol = solve(e1,e2,e3);

xt = sol.x;
yt = sol.y;
zt = sol.z;

xt = xt(1:1);
yt = yt(1:1);
zt = zt(1:1);

xt = double(xt);
xt = round(xt, 3);
yt = double(yt);
yt = round(yt, 3);
zt = double(zt);
zt = round(zt, 3);

%disp(class(xt))

%A = ['c1', 'c2', 'k1','k2','k3','k4','k6', 'f', 'x','y','z'];

[~,~,raw]= xlsread('force FAK.xlsx');

A = [c1, c2, k1, k2, k3, k4, k5, k6, f, xt, yt, zt];

[r,~]= size(raw);
disp(r)
f = 'A%d'; 
f2 = 'L%d';
r = r + 1;
s = sprintf(f, r); 
s2 = sprintf(f2, r);
s3 = [s ':' s2];

filename = 'force FAK.xlsx';
sheet = 1;
xlRange = s3;
xlswrite(filename,A,sheet,xlRange)
%xlswrite(A,'force FAK.xlsx','Sheet',1,'Range', s3)


end

