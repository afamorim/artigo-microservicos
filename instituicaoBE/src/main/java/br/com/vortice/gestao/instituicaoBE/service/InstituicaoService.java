package br.com.vortice.gestao.instituicaoBE.service;

import br.com.vortice.gestao.instituicaoBE.domain.Instituicao;
import br.com.vortice.gestao.instituicaoBE.repository.InstituicaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class InstituicaoService {

    @Autowired
    private InstituicaoRepository instituicaoRepository;

    public Instituicao insert(Instituicao aInstituicao){
        return instituicaoRepository.save(aInstituicao);
    }

    public void update(Instituicao aInstituicao){
        instituicaoRepository.save(aInstituicao);
    }

    public Optional<Instituicao> findByPrimaryKey(Long aCodigo){
        return instituicaoRepository.findById(aCodigo);
    }
}
