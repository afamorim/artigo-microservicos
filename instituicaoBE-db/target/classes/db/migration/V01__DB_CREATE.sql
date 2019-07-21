
CREATE TABLE responsavel(
  codigo BIGSERIAL NOT NULL,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  telefone_contato VARCHAR(20) NOT NULL,
  PRIMARY KEY (codigo)
);

CREATE TABLE perfil (
  codigo BIGSERIAL NOT NULL,
  nome VARCHAR(45) NULL,
  PRIMARY KEY (codigo)
);

CREATE TABLE usuario (
  codigo BIGSERIAL NOT NULL,
  perfil_codigo BIGINT NULL,
  login VARCHAR(50) NOT NULL,
  senha VARCHAR(100) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT fk_usuario_perfil
    FOREIGN KEY (perfil_codigo)
    REFERENCES perfil (codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE aluno (
  codigo BIGSERIAL NOT NULL,
  responsavel_codigo BIGINT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  data_nascimento VARCHAR(45) NOT NULL,
  sexo BIT NOT NULL,
  usuario_codigo BIGINT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT fk_aluno_responsavel
    FOREIGN KEY (responsavel_codigo)
    REFERENCES responsavel (codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT fk_aluno_usuario
      FOREIGN KEY (usuario_codigo)
      REFERENCES usuario (codigo)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE instituicao (
  codigo BIGSERIAL NOT NULL,
  nome VARCHAR(100) NOT NULL,
  endereco VARCHAR(45) NOT NULL,
  telefone_contato VARCHAR(45) NOT NULL,
  PRIMARY KEY (codigo)
);

CREATE TABLE area (
  codigo BIGSERIAL NOT NULL,
  nome VARCHAR(100) NOT NULL,
  PRIMARY KEY (codigo)
);

CREATE TABLE curso (
  codigo BIGSERIAL NOT NULL,
  area_codigo BIGINT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT fk_curso_area
    FOREIGN KEY (area_codigo)
    REFERENCES area (codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE matricula (
  codigo BIGSERIAL NOT NULL,
  curso_codigo BIGINT NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL,
  valor_curso FLOAT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT fk_matricula_curso
    FOREIGN KEY (curso_codigo)
    REFERENCES curso (codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE matricula_aluno (
  codigo BIGSERIAL NOT NULL,
  matricula_codigo BIGINT NOT NULL,
  aluno_codigo BIGINT NOT NULL,
  desconto FLOAT NULL,
  data_matricula DATE NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT fk_matricula_aluno_matricula
    FOREIGN KEY (matricula_codigo)
    REFERENCES matricula (codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_matricula_aluno_aluno
    FOREIGN KEY (aluno_codigo)
    REFERENCES aluno (codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE instituicao_curso (
  codigo BIGSERIAL NOT NULL,
  instituicao_codigo BIGINT NULL,
  curso_codigo BIGINT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT fk_instituicao_has_curso_instituicao
    FOREIGN KEY (instituicao_codigo)
    REFERENCES instituicao (codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_instituicao_has_curso_curso
    FOREIGN KEY (curso_codigo)
    REFERENCES curso (codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE permissao (
  codigo BIGSERIAL NOT NULL,
  nome VARCHAR(45) NULL,
  PRIMARY KEY (codigo)
);

CREATE TABLE perfil_permissao (
  codigo BIGSERIAL NOT NULL,
  perfil_codigo BIGINT NOT NULL,
  permissao_codigo BIGINT NOT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT fk_perfil_has_permissao_perfil
    FOREIGN KEY (perfil_codigo)
    REFERENCES perfil (codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_perfil_has_permissao_permissao
    FOREIGN KEY (permissao_codigo)
    REFERENCES permissao (codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
