package br.com.vortice.gestao.instituicaoBE.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name="curso")
@Data
@NoArgsConstructor
public class Curso {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long    codigo;

    @ManyToOne
    @JoinColumn(name="area_codigo")
    private Area    area;

    @ManyToOne
    @JoinColumn(name="instituicao_codigo")
    private Instituicao instituicao;
    private String  nome;
    private String  descricao;

}
