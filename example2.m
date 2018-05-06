% dois circuitos trifasicos e um condutor neutro

pos_condutores = [[0,35];[2.5,35];[7.0,35];[0,33];[2.5,33];[7.0,33];[4.0,29]]; 

id_condutores = [57 57 57 57 57 57 44];  % 57 = 336400 26/7 ACSR; 44 = 4/0 6/1 ACSR

[z_bus,y_bus] = carson(pos_condutores,id_condutores);

z012 = sequence_matrix(z_bus,true)  % linha transposta
z012 = sequence_matrix(z_bus,false) % linha nao transposta