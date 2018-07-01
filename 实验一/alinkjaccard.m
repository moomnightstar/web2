function  clustering = alinkjaccard( A,k )
%ALINKJACCARD Average link agglomerative clustering with Jaccard similarity 
%   此处显示详细说明
B=A;
D=pdist(B,'jaccard');
%D=squareform(D);
Z=linkage(D,'average');
%c = cophenet(Z,D);
%display(c);
%dendrogram(Z,0);

clustering= cluster(Z,'maxclust',k);
end

