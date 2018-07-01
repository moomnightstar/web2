function seeds = degree_centrality( G,k)
%DEGREE 此处显示有关此函数的摘要
%   此处显示详细说明

deg_ranks = centrality(G,'outdegree','Importance',G.Edges.Weight);
[B,I] = sort(deg_ranks,'descend');
seeds=I(1:k);

end

