--associado
INSERT INTO associado (id, nome, sobrenome, idade, email) VALUES
(1, 'Luiz', 'Radiske', 34, 'lfradiske@gmail.com'),
(2, 'Bruno', 'Souza', 18, 'brunosouza@gmail.com'),
(3, 'Carlos', 'Oliveira', 35, 'carlosoliveira@gmail.com'),
(4, 'Daniela', 'Costa', 26, 'danielacosta@hotmail.com'),
(5, 'Ana', 'Silva', 22, 'anasilva@gmail.com');

--conta
INSERT INTO conta (id, tipo, data_criacao, id_associado) VALUES
(1, 'Corrente', '2025-07-16 10:00:00', 1),
(2, 'Poupanca', '2023-02-20 11:30:00', 2),
(3, 'Corrente', '2023-03-10 09:45:00', 3),
(4, 'Poupanca', '2023-04-05 14:20:00', 4),
(5, 'Corrente', '2023-05-01 08:15:00', 5);

--cartao
INSERT INTO cartao (id, num_cartao, nom_impresso, id_conta, id_associado) VALUES
(1, 4111111111111111, 'LUIZ RADISKE', 1, 1),
(2, 4222222222222222, 'BRUNO SOUZA', 2, 2),
(3, 4333333333333333, 'CARLOS OLIVEIRA', 3, 3),
(4, 4444444444444444, 'DANIELA COSTA', 4, 4),
(5, 4555555555555555, 'ANA SILVA', 5, 5);

--movimento
INSERT INTO movimento (id, vlr_transacao, des_transacao, data_movimento, id_cartao) VALUES
(1, 120.50, 'Supermercado', '2023-06-01 12:30:00', 1),
(2, 75.00, 'Posto de gasolina', '2023-06-02 09:15:00', 2),
(3, 200.00, 'Mc Donalds', '2023-06-03 16:00:00', 3),
(4, 45.75, 'Ifood', '2023-06-04 20:45:00', 4),
(5, 310.90, 'Kabum', '2023-06-05 11:20:00', 5);