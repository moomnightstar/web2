function  clustering = alinkjaccard( A,k )
%ALINKJACCARD Average link agglomerative clustering with Jaccard similarity 
%   �˴���ʾ��ϸ˵��
B=A;
D=pdist(B,'jaccard');
%D=squareform(D);
Z=linkage(D,'average');
%c = cophenet(Z,D);
%display(c);
%dendrogram(Z,0);

clustering= cluster(Z,'maxclust',k);
end

