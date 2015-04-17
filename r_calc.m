
% for supplier number 
[r_num r_txt r_raw] = xlsread('att_rat1.xlsx');


desMaker = size(r_txt,2)-2;

% Supplier Number
supNum = size(r_txt,1)-1;


% for Number of Attributes
% =4 initially
[r_num r_txt r_raw] = xlsread('att_wt.xlsx');
numAtt = size(r_txt,1)-1;


% Supplier 1 Matrix
Q = [];



for i = 1:numAtt
    

    file = strcat('att_rat',num2str(i),'.xlsx');
    
    [r_num r_txt r_raw] = xlsread(file);
    
    minimum = 0;
    maximum = 0;
    
    % 6,2
    q = zeros(supNum,2);
    
    index = 1;
    for i = 2:supNum+1         % 2:7
        
        for j = 3:size(r_txt,2)
            
            x = genvarname(r_txt(i,j));
            num = eval(x{1});
            minimum = minimum + num(1);
            maximum = maximum + num(2);
            
        end
        
        q(index,1) = minimum/desMaker;
        q(index,2) = maximum/desMaker;
        index = index + 1;
        minimum = 0;
        maximum = 0;
    end   
    Q = horzcat(Q,q);
    
end






