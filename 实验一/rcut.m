function clustering = rcut( A,k )
%RCUTSpectral clustering: ratio cut 
%   �˴���ʾ��ϸ˵��
D=diag(sum(A));
L=D-A;
[Vr,Dr]=eigs(L,k+1,'sm');
%display(Dr);
Vr=Vr(:,2:end);
clustering=kmeans(Vr,k);
end

