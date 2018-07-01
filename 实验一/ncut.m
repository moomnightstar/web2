function clustering = ncut( A,k )
%NCUT Spectral clustering: normalized cut 
%   �˴���ʾ��ϸ˵��
D=diag(sum(A));
L=sqrtm(D)*(D-A)*sqrtm(D);
[Vn,Dn]=eigs(L,k+1,'sm');
%display(Dn);
Vn=Vn(:,2:end);
clustering=kmeans(Vn,k);

end

