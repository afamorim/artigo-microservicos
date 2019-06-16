package br.com.vortice.gestao.instituicaoBE.domain;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="insituicao")
@Data
@Builder
@NoArgsConstructor
public class Instituicao {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long    codigo;

    @NonNull
    private String  nome;

    @NotNull
    private String  endereco;

    @NotNull
    @Column(name = "telefone_contato")
    private String  telefoneContato;
}
