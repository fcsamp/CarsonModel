function [resistencia,gmr,raio] = dados_condutor(id_condutor,condutores)
    
    condutor = condutores(id_condutor+1);
    resistencia = condutor.resistence.value;
    gmr = condutor.gmr.value;
    raio_inch = condutor.diameter.value/2;
    raio = raio_inch*0.0833333;     % feet

end