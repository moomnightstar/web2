function testmain( )
%TESTMAIN 此处显示有关此函数的摘要
%   此处显示详细说明
A=load('polbooks.mat','A');
k=load('polbooks.mat','k');
clustering = modularity( A.A,k.k );
fp=fopen('polbooks_modularity.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);
[NMI,ACC] = evaluation('polbooks_modularity.txt','polbooks_gd.txt',k.k);
display(NMI);
display(ACC);
%%
A=A.A;
for i=1:length(A)
    for j=i:length(A)
        if A(i,j)==1
            disp(i);
            disp(j);
            disp(full(A(i,j)));
            disp(full(A(j,i)));
        end
    end
end
%% 

end

