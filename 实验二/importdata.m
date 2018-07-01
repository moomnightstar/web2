function importdata( )
%MAIN import data
%   此处显示详细说明

[i,j,v] = importfile('graph.txt', 2, 25572);
% sparse指向矩阵的索引必须为正数,给编号加一，使得不出现编号0
i=i+1;
j=j+1;
S = sparse(i,j,v);
save('graph.mat','S');
end

