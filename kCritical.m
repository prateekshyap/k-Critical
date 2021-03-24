function [] = kCritical( candidates, mat, n )
%UNTITLED4 Summary of this function goes here
%{
candidates = set of controllers
mat = adjacency matrix of network graph
n = number of nodes in the network
%}
%   Detailed explanation goes here
    global pc;
    s = size (candidates);
    noc = s (1,2); %noc = no of candidates
    parents = zeros (noc,n); %matrix to store all the parent nodes
    costs = zeros (noc,n); %matrix to store costs from node to parent node
    nodeHeights = zeros (noc,n); %matrix to store the heights of each node
    for i = 1 : noc %for each candidate
         sp = bellmanFord (n, mat, candidates (i)); %find the shortest path taking the ith candidate node as source
         pc = zeros (3,n); %declaring an array which is global and stores the parent nodes, costs and heights for each node in two rows for ith candidate
         buildTree (mat, candidates (i), candidates (i), sp, n); %building the tree for ith candidate
         parents (i,1:n) = pc (1,1:n); %storing the parent nodes for ith candidate
         costs (i,1:n) = pc (2,1:n); %storing the costs for ith candidate
         nodeHeights (i,1:n) = pc (3,1:n); %storing the node heights from the candidate for each candidate
    end
end