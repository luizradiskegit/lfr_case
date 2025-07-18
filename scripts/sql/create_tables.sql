
CREATE TABLE associado (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    idade INT,
    email VARCHAR(150)
);

CREATE TABLE conta (
    id INT PRIMARY KEY,
    tipo VARCHAR(50),
    data_criacao TIMESTAMP,
    id_associado INT NOT NULL,
    FOREIGN KEY (id_associado) REFERENCES associado(id)
);

CREATE TABLE cartao (
    id INT PRIMARY KEY,
    num_cartao BIGINT NOT NULL,
    nom_impresso VARCHAR(100),
    id_conta INT NOT NULL,
    id_associado INT NOT NULL,
    FOREIGN KEY (id_conta) REFERENCES conta(id),
    FOREIGN KEY (id_associado) REFERENCES associado(id)
);

CREATE TABLE movimento (
    id INT PRIMARY KEY,
    vlr_transacao DECIMAL(10, 2),
    des_transacao VARCHAR(255),
    data_movimento TIMESTAMP,
    id_cartao INT NOT NULL,
    FOREIGN KEY (id_cartao) REFERENCES cartao(id)
);
