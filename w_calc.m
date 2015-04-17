
% eval('atab')

[w_num w_txt w_raw] = xlsread('att_wt.xlsx');

Q_wt = [];

minimum = 0;
maximum = 0;

% row 


for i = 2:size(w_txt,1)
   
    for j = 2:size(w_txt,2)
      
        x = genvarname(w_txt(i,j));
        num = eval(x{1});
        minimum = minimum + num(1);
        maximum = maximum + num(2);
        
    end
    
    Q_wtt = [minimum/4 maximum/4] ;
    minimum = 0;
    maximum = 0;
    
    Q_wt = horzcat(Q_wt,Q_wtt);
    
end



    