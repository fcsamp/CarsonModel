pos_condutores = [[0,29];[2.5,29];[7.0,29];[4.0,25]];   % exemplo para validacao

id_condutores = [57 57 57 44];  % 57 = 336400 26/7 ACSR; 44 = 4/0 6/1 ACSR

[z_bus, y_bus] = carson(pos_condutores,id_condutores);

z012 = sequence_matrix(z_bus,true)  % linha transposta
z012 = sequence_matrix(z_bus,false) % linha nao transposta



