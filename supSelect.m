% attribute
% attr = 4;


% Column
col = 1;

% Horizontal Column
horz = size(GWN,2);

PQ = [];

for row = 1:size(GWN,1)
    
    pq = 0;
    
    klm = 1;
    
    for col = 1:size(GWN,2)
        
        % G^max - G_min
        GG =  max( GWN(row, klm:klm+1) )...
              - min( idealSupp(klm:klm+1) );
        
        % L* calculation
        Lstar = ( idealSupp(klm+1) - idealSupp(klm)) + ...
                ( GWN(row,klm+1) - GWN(row,klm) );
        
        pq = pq + max(0,Lstar-max(0,GG))/Lstar;
        
        klm = klm+2;
        if klm+1 > size(GWN,2)
            break;
        end
        
    end
    
    pq = pq/numAtt;
    
    PQ = [PQ pq];
    
end


