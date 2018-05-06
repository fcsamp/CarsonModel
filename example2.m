% line with two three phase circuits and a neutral conductor

% conductors position [x,y]
pos_condutores = [[0,35];[2.5,35];[7.0,35];[0,33];[2.5,33];[7.0,33];[4.0,29]]; 

% conductors id are available in condutors.json file
id_condutores = [57 57 57 57 57 57 44];  % 57 = 336400 26/7 ACSR; 44 = 4/0 6/1 ACSR

[z_bus,y_bus] = carson(pos_condutores,id_condutores);   % impedance and admittance matrix

z012 = sequence_matrix(z_bus,true)  % transposed line
z012 = sequence_matrix(z_bus,false) % untransposed line