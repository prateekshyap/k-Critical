function [] = buildTree(mat, root, src, sp, n)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
	global pc;
    for i = 1 : n %for each node
        if ((mat (src,i) ~= 0)&&(pc (1,i) == 0)) %if the ith node and source node are directly connected and the node is not in the tree
            pathCost = 0; %a variable to keep track of the total path cost from candidate node to ith node via source node
            currNode = i; %a variable to keep track of the current node
            parentNode = src; %a variable to keep track of the parent node of currNode
            pathCost = pathCost + mat (currNode,parentNode); %the cost of currNode and parentNode is added to the path cost
            %calculating the path cost
            while (parentNode ~= root) %this loop will run from current node to the root
                currNode = parentNode; %move current node to its parent
                parentNode = pc (1,currNode); %move parent node to the parent of currNode
                pathCost = pathCost + mat (currNode,parentNode); %the cost of currNode and parentNode is added to path cost
            end
            if (sp (1,i) == pathCost) %if the shortest cost is equal to the calculated path cost
                pc (1,i) = src; %connect the ith node as a child of source node
                pc (2,i) = mat (src,i); %update the cost between ith node and source node
                pc (3,i) = pc (3,src) + 1; %update the height of the node =  height of the source incremented + 1
                buildTree (mat, root, i, sp, n); %call buildTree function recursively by taking the newly added node as the new source
            end
        end
    end
end