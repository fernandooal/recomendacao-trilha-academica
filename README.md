# Sistema de Recomendação de Trilhas Acadêmicas

## Alunos
- Angelo Piovezan Jorgeto
- Fernando Alonso Piroga da Silva
- Jafte Carneiro Fagundes da Silva
- Renato Pestana Gouveia


## Objetivo
Este projeto implementa um sistema especialista em Prolog para recomendar trilhas acadêmicas com base nas características pessoais e interesses do aluno.



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


## Como Executar o Sistema

### 🔧 Requisitos
- SWI-Prolog instalado ([Download aqui](https://www.swi-prolog.org/Download.html))

### Execução do Programa Principal

No terminal, acesse a pasta do projeto e digite:

```prolog
swipl
?- [base_conhecimento, motor_inferencia, interface_usuario].
?- iniciar.
```

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

## Perfis Simulados

Os arquivos `perfil_teste_1.pl`, `perfil_teste_2.pl` e `perfil_teste_3.pl` contêm perfis distintos com respostas a 12 perguntas sobre preferências, habilidades e estilos de trabalho.


## Equipe

### Aluno 1 — Renato Pestana Gouveia
- **Parte:** Base de Conhecimento
- **Arquivo:** `base_conhecimento.pl`
- **Responsabilidades:**
  - Criar perguntas, características e pesos associados a cada trilha
  - Garantir que a base esteja bem estruturada, sem redundâncias
  - Separar a base do motor lógico


### Aluno 2 — Fernando Alonso Piroga da Silva
- **Parte:** Motor de Inferência
- **Arquivo:** `motor_inferencia.pl`
- **Responsabilidades:**
  - Implementar os predicados de inferência e cálculo de compatibilidade
  - Usar `findall`, `member`, `sum_list` e outras ferramentas de lógica
  - Garantir uso correto de cláusulas de Horn e recursividade


### Aluno 3 — Angelo Piovezan Jorgeto
- **Parte:** Interface com Usuário
- **Arquivo:** `interface_usuario.pl`
- **Responsabilidades:**
  - Criar a interface de diálogo com o usuário real
  - Coletar respostas dinamicamente e invocar o motor lógico
  - Cuidar da interação em terminal e clareza das perguntas

### Aluno 4 — Jafte Carneiro Fagundes da Silva
- **Parte:** Testes, Documentação e Repositório
- **Arquivos:**
  - `perfil_teste_1.pl`, `perfil_teste_2.pl`, `perfil_teste_3.pl`
  - `testes.pl`, `profiletestinterface.pl`
  - `README_FINAL.md`
- **Responsabilidades:**
  - Criar perfis de teste representativos
  - Automatizar testes e construir interface interativa de simulação
  - Organizar a documentação final e garantir integridade do repositório
