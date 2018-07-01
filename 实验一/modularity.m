function clustering=modularity(A, k)
%MODULARITY Modularity maximization
%   此处显示详细说明
d=sum(A);
m=sum(d)/2;
B=A-(d*d')/(2*m);
[Vm,Dm]=eigs(B,k);
%display(Dm);
clustering=kmeans(Vm,k);
end

