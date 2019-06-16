package br.com.vortice.gestao.instituicaoBE.repository;

import br.com.vortice.gestao.instituicaoBE.domain.Instituicao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InstituicaoRepository extends JpaRepository<Instituicao, Long> {
}
