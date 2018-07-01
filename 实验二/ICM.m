function num = ICM( G,seeds,T )
%ICM 独立级联模型
%   此处显示详细说明
S=seeds;
A=S;
i=1;
while i<=T
    nextA=[];
   for j=1:length(A)
        N =  successors(G,A(j));
        N = setdiff(N,S);
        p=rand;
        disp(i);
        if i>100
            break;
        else
            i=i+1;
        end
        for k=1:length(N)      
            if   G.Edges.Weight(findedge(G,A(j),N(k)))>=p
                S=[S;N(k)];
                nextA=[nextA;N(k)];
            end
        end
   end
   if length(nextA)==0
       break;
   else
       A=nextA;
   end
end
num=length(S);
end

