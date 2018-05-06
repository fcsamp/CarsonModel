function [z_abc,y_abc] = carson(pos_condutores,id_condutores)

addpath(genpath('./jsonlab-1.5')); 
condutores = loadjson('conductors.json','SimplifyCell',1);

% loop preenche os dados de resistencia e gmr de cada condutor

for i=1:length(id_condutores)

    [res(i), gmr(i), raio(i)] = dados_condutor(id_condutores(i),condutores);

end

distancias = dist_ptos(pos_condutores,true);  % matriz armazena as distancias entre os condutores

dmatriz = (length(distancias)/2);   % dimensao da matriz de distancias

% calculo das impedancias serie
% freq = 60 hz; rho = 100 ohms-m 

for i=1:dmatriz

    for j=1:dmatriz

        if i == j

            z_bus(i,j) = res(i) + 0.0953 + 1j*0.12134*(log(1/gmr(i)) + 7.93402); 

        end

        if i~=j

            z_bus(i,j) = 0.0953 + 1j*0.12134*(log(1/distancias(i,j)) + 7.93402);

        end

    end

end

% reducao de kron

z_abc = kron(z_bus);

% calculo das admitancies shunt

for i=1:dmatriz

    for j=1:dmatriz

        if i == j

            p_bus(i,j) = 11.17689*log(distancias(i,j+dmatriz)/raio(i));

        end

        if i~=j

            p_bus(i,j) = 11.17689*log(distancias(i,j+dmatriz)/distancias(i,j));

        end

    end

end

p_abc = kron(p_bus);
C_abc = inv(p_abc);

y_abc = (1j*2*pi*60)*C_abc;     % freq = 60 hz

end