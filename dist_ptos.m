function distancias = dist_ptos(vetor_pontos,incluir_imagens)

% Funcao calcula a distancia entre todos os pontos de um vetor fornecido
% (vetor_pontos) como entrada e armazena os resultados em uma matriz (d), 
% caso o parametro incluir_imagens seja true sao calculadas tambem as 
% distancias dos pontos em relacao as suas imagens em relacao ao eixo y

if incluir_imagens == true
    
    dimensao_inicial = length(vetor_pontos);
    
    for k=1:dimensao_inicial
       
        vetor_pontos(k+dimensao_inicial,:) = [vetor_pontos(k,1),-vetor_pontos(k,2)];
        
    end
    
end

for i=1:length(vetor_pontos) 
    
    for j=1:length(vetor_pontos)
       
       distancias(i,j) = dist(vetor_pontos(i,:),vetor_pontos(j,:));
        
    end 
    
end

