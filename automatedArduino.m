%% Sorting data by block 
% Input: raw data matrix M
% Output: howmanyblocks 
%       : avgXY_sig_index -> gives average midpoint position for each block

% Avoiding "eval" at all costs as suggested by Matlab
clear blockstruct
n = 0;

% figuring out the number of blocks by finding the unique elements in the
% index row
index = unique(M(:,8));  
    
%how many blocks are there?
howmanyblocks = length(index);
howmanyblocks = max(M(:,1)); % can comment out one of these, or run both as a check

% array dimensioned relative to how many blocks there are
b = zeros(howmanyblocks,1);

% will create an automated array within an array to the right order
%AUTM = zeros(howmanyblocks,1);

% Using a structure instead 
 for g = 1:howmanyblocks
blockstruct(g).name=index(g,:);
blockstruct(g).data={};                 % 0-by-0 array
end

%as many matrices as there are block index numbers (ie no. blocks)
while n <= nmax
    
        n = n+1;
        a = 0;          % resetting for new line to check per signature (signature number lies between 1 and 7)
    % assigning index to a variable which is overwritten
       A = M(n,8);
       
        while a<howmanyblocks
         a = a+1;                       % search for the next block index number
         nn = 0;
         if isequal(A,index(a,:))
             b(a,:) = b(a,:)+1;         % counting vector to create new line in new matrix
             bb = b(a,1);
             
       %% Assign entire line
           blockstruct(a).data(bb,:) = {M(n,:)};
         else 
         end
        end
end

h=0;
avgXY_sig_index=zeros(howmanyblocks,6);

 while h<howmanyblocks
        h=h+1;              % for block number h
        m=0;
        %I've decided these are the most relevant bits of data to retrieve
        structlength=length(blockstruct(h).data);
        XY_hw_sig_index=zeros(structlength,6);
            
        while m<structlength
            m=m+1;
            % produces line of code from relevant block-specific matrix
            V=deal(blockstruct(h).data{m,1});
            % x value
            XY_hw_sig_index(m,1)=V(1,4);
            % y value
            XY_hw_sig_index(m,2)=V(1,5);
            % height
            XY_hw_sig_index(m,3)=V(1,6);
            % width
            XY_hw_sig_index(m,4)=V(1,7);
            % signature
            XY_hw_sig_index(m,5)=V(1,3);
            % index
            XY_hw_sig_index(m,6)=V(1,8);
        end
       avgXY_sig_index(h,1:4) = mean(XY_hw_sig_index(:,1:4),1);
       avgXY_sig_index(h,5) = XY_hw_sig_index(1,5);
       avgXY_sig_index(h,6) = XY_hw_sig_index(1,6);
       avgXY_sig_index(h,7:8) = std(XY_hw_sig_index(:,1:2),0,1);
 end            