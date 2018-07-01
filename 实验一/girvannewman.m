function clustering = girvannewman( A,k )
% Divisive hierarchical clustering — Girvan-Newman
%   此处显示详细说明
    auxAdjMatrix=A;
    nClasses=k;
    % Calculate betweenness of the original Matrix
    [btwnessArray] = btw(auxAdjMatrix);
    G = graph(auxAdjMatrix);
        components = conncomp(G);
        aux = max(components);
    % While the number of communities is less than the number of classes
    while (aux<nClasses)      
        % Find and remove the edge with highest 
        
        [posi,posj]=calculatePostitions(btwnessArray);
        auxAdjMatrix(posi,posj) = 0;
        auxAdjMatrix(posj,posi) = 0;
        % Calculate the new betweenness
        [btwnessArray] = btw(auxAdjMatrix);
         %fullMatrix = auxAdjMatrix + auxAdjMatrix';
         G = graph(auxAdjMatrix);
        components = conncomp(G);
        aux = max(components);
        display(aux);
    end
    clustering=components;
end

function SPARSE = btw(adjMatrix)
   
    SPARSE = sparse(length(adjMatrix),length(adjMatrix));
    for i=1:length(adjMatrix)     
        [~, path, ~] = graphshortestpath(adjMatrix, i);
        for j=(i+1):length(adjMatrix)  
                shortpaths = path{j};
                for k=1:(length(shortpaths)-1)
                    minVal = min(shortpaths(k), shortpaths(k+1));
                    maxVal = max(shortpaths(k), shortpaths(k+1));
                    SPARSE(minVal, maxVal) = SPARSE(minVal, maxVal) + 1;
                end          
        end 
    end
    % SPARSE=SPARSE+SPARSE';
end

function [posi,posj]=calculatePostitions(btwnessArray)
    
    
    maxval = max(max(btwnessArray));
  
    [posi,posj] = find(btwnessArray == maxval);
    
end