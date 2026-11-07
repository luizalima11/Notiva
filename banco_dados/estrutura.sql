CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE publicacao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    conteudo TEXT NOT NULL,
    status ENUM('rascunho', 'publicado') DEFAULT 'rascunho',
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    atualizado_em DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    publicado_em DATETIME NULL,

    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
);


-- INDEX
CREATE INDEX idx_publicacao_usuario ON publicacao (usuario_id);
CREATE INDEX idx_publicacao_timeline ON publicacao (status, publicado_em);


CREATE TABLE comentario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    publicacao_id INT,
    comentario_pai_id INT DEFAULT NULL,
    conteudo TEXT NOT NULL,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (publicacao_id) REFERENCES publicacao(id) ON DELETE CASCADE,
    FOREIGN KEY (comentario_pai_id) REFERENCES comentario(id) ON DELETE CASCADE
);

-- INDEX
CREATE INDEX idx_comentario_publicacao ON comentario (publicacao_id, criado_em);
CREATE INDEX idx_comentario_pai ON comentario (comentario_pai_id);


CREATE TABLE curtida (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    publicacao_id INT,

    UNIQUE (usuario_id, publicacao_id),

    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (publicacao_id) REFERENCES publicacao(id) ON DELETE CASCADE
);

--INDEX
CREATE INDEX idx_curtida_publicacao ON curtida (publicacao_id);


CREATE TABLE favorito (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    publicacao_id INT,

    UNIQUE (usuario_id, publicacao_id),

    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (publicacao_id) REFERENCES publicacao(id) ON DELETE CASCADE
);

-- INDEX
CREATE INDEX idx_favorito_publicacao ON favorito (publicacao_id);