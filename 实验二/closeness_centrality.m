function seeds = closeness_centrality( G,k )
%CLOSENESS_CENTRALITY 此处显示有关此函数的摘要
%   此处显示详细说明
ucc = centrality(G,'outcloseness');
[B,I] = sort(ucc,'descend');
seeds=I(1:k);

end

