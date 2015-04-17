%% Control point of Matlab program
%% version : 1
%% 0911006 & 0911015
% get attribute table
eval('atab');
% Weight calculate
eval('w_calc');
% rating calculation
eval('r_calc');
% Grey NOrmalized Matrix Calculation
klm = 1;
QNorm = [];
for i = 1:size(Q,2)
 
        q1 = Q(:,klm:klm+1)/max([Q(:,klm) ; Q(:,klm+1)]);
    
        QNorm = [QNorm q1];
        
        klm = klm+2;
        if klm+1 > size(Q,2)
            break;
        end    
end
GWN = [];
for i = 1:supNum % 1:6
   GWN = vertcat(GWN,QNorm(i,:).*Q_wt);
end
idealSupp = max(GWN,[],1);
% Evaluate supplier selection
eval('supSelect');
%% Displaying Output:
disp('Ideal Supplier Matrix(S*): ')
idealSupp
disp('Grey Weighted Normalized Matrix: ')
GWN
disp('Suppliers Ranking Order (Lower is better)');
PQ
disp('Supplier Ranking: ');
[C, ia, ic] = unique(PQ);
ia'