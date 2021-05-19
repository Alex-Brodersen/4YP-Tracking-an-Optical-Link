%% Reading Arduino Data and Compiling into Single Array M
% Outputs matrix of raw data M
n = 0;
nmax = 30;                 % set the maximum loop count
readerror = 0;

% Master matrix M. Length 9 as 9 outputs
% Columns will be ordered in same manner as the string 
M = zeros((nmax+1),9);
    while n <= nmax
    
       n = n+1;
    
       data = readline(ARD);
    
       C = strsplit(data);
    % add a line about the length of C having to equal 1 by 19? To avoid
    % inputting error no response 
        if length(C)==19
            % Detected
            M(n,1) = str2num(C(1,2));
            % Block no.
            M(n,2) = str2num(C(1,4));
            % Signature
            M(n,3) = str2num(C(1,6));
    
            % retrieving coordinates of block centroid
            % x
            M(n,4) = str2num(C(1,8));
            % y
            M(n,5) = str2num(C(1,10));
            
            % retrieving block width and height
            % width
            M(n,6) = str2num(C(1,12));
            % height
            M(n,7) = str2num(C(1,14));

            % index
            M(n,8) = str2num(C(1,16));
            % block age
            M(n,9) = str2num(C(1,18));
        else
            n=n-1;
            readerror = readerror+1;        % keep count of # incomplete data reads
        end

    end
