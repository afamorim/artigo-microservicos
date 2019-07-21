package br.com.vortice.gestao.instituicaoBE.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name="area")
@Data
@NoArgsConstructor
public class Area {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer codigo;
    private String  nome;
}
