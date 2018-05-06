function z_012 = sequence_matrix(z_abc, transpose)

[r,im] = pol2cart(120*pi/180,1);
a = r + 1i*im;
A = [1 1 1;1 a^2 a;1 a a^2];    % matriz de transformacao

n_circ = length(z_abc)/3;

A_n = [];
A_m = [];

for i=1:n_circ
    
    for j=1:n_circ

        if i==j

            A_n = [A_n, A]; 

        else
            
            A_n = [A_n, zeros(3)];

        end

    end

    A_m = [A_m;A_n];
    A_n = [];

end

A = A_m;

if transpose == true

    zdd = 0;
    zmm = 0;

    for i=1:length(z_abc)
        
        for j=1:length(z_abc)

            if i==j

                zdd = zdd + z_abc(i,j)/length(z_abc);   % media das impedancias de fase
                
            end
            
            if i~=j

                zmm = zmm + z_abc(i,j)/(2*length(z_abc));   % media das impedancias mutuas
                
            end

        end        
        
    end

    % matriz da LT transposta
    
    for i=1:length(z_abc)

        for j=1:length(z_abc)
            
            if i==j
            
                z_abc(i,j) = zdd;

            else
                
                z_abc(i,j) = zmm;

            end

        end

    end   

end

z_012 = inv(A)*z_abc*A;

end