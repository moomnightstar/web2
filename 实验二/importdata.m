function importdata( )
%MAIN import data
%   �˴���ʾ��ϸ˵��

[i,j,v] = importfile('graph.txt', 2, 25572);
% sparseָ��������������Ϊ����,����ż�һ��ʹ�ò����ֱ��0
i=i+1;
j=j+1;
S = sparse(i,j,v);
save('graph.mat','S');
end

