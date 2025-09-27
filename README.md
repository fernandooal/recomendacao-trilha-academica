# Sistema de Recomendação de Trilhas Acadêmicas

## Objetivo
Este projeto implementa um sistema especialista em Prolog para recomendar trilhas acadêmicas com base nas características pessoais e interesses do aluno.

---

## Estrutura de Arquivos

| Arquivo                     | Descrição                                                                 |
|----------------------------|---------------------------------------------------------------------------|
| `base_conhecimento.pl`     | Base de conhecimento: trilhas, características e perguntas.               |
| `motor_inferencia.pl`      | Lógica de inferência, cálculo de compatibilidade e recomendação.          |
| `interface_usuario.pl`     | Interface de linha de comando para interação com o usuário.               |
| `perfil_teste_[N].pl`        | Três perfis simulados de alunos para testes automáticos.                  |
| `testes.pl`                | Predicados auxiliares para rodar os testes com os perfis.                 |
| `profiletestinterface.pl` | Interface interativa para escolha e execução de perfis de teste. |
| `README_FINAL.md`          | Documentação completa do sistema.                                         |

---

## Rodando Testes Automatizados

```prolog
?- [base_conhecimento, motor_inferencia, testes].
?- executa_teste('perfil_teste_1.pl', Resultado).
```

Ou, para modo interativo:

```prolog
?- [base_conhecimento, motor_inferencia].
?- [profiletestinterface].
?- iniciar_testes.
```

---

## Perfis Simulados

Os arquivos `perfil_teste_1.pl`, `perfil_teste_2.pl` e `perfil_teste_3.pl` contêm perfis distintos com respostas a 12 perguntas sobre preferências, habilidades e estilos de trabalho.

---

## Checklist RA1 – Avaliação PUCPR

- [x] Uso de cláusulas de Horn
- [x] Fatos e regras bem definidos
- [x] Predicados recursivos
- [x] Matching de respostas com base de conhecimento
- [x] Predicados auxiliares e reutilizáveis
- [x] Testes automatizados
- [x] Interface amigável para execução
- [x] Uso correto de backtracking
- [x] Separação modular em arquivos

---

## Possíveis Perguntas de Arguição

1. **Como funciona a inferência no seu sistema?**
   - Explicação sobre o `findall/3`, `member/2`, e estrutura do motor de inferência.

2. **O que acontece se nenhuma trilha for compatível?**
   - O sistema retorna uma lista vazia e exibe mensagem informativa.

3. **Como é calculada a compatibilidade?**
   - Soma ponderada dos pesos das características marcadas como “sim”.

4. **Por que usar `retractall/1`?**
   - Para limpar respostas anteriores entre execuções.

5. **Como você garantiria escalabilidade para novos perfis ou trilhas?**
   - Modularização e uso de predicados genéricos como `perfil/3` e `pergunta/3`.

---

## Autor da Integração e Testes

**Jafte Carneiro Fagundes da Silva**  
Responsável pela Parte 4: testes, documentação, repositório e interface de simulação.

---

## 🔗 Referências

- [SWI-Prolog Manual](https://www.swi-prolog.org)
- PUCPR – Plano de Ensino 2025/1