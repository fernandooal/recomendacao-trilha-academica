# Sistema de Recomendação de Trilhas Acadêmicas

Este projeto, desenvolvido em Prolog, recomenda trilhas acadêmicas personalizadas com base no perfil de interesses e habilidades do aluno.

## 🎯 Objetivo

Ajudar estudantes a identificar trilhas de especialização mais adequadas no curso de Ciência da Computação da PUCPR, com base em perguntas sobre preferências, aptidões e estilo de trabalho.

---

## ⚙️ Como Funciona

1. O aluno responde a 12 perguntas sobre seus interesses e habilidades.
2. O sistema compara as respostas com as características exigidas por cada trilha.
3. Cada trilha recebe uma pontuação com base nos pesos definidos.
4. As trilhas são ordenadas da mais compatível à menos compatível.

---

## 🗂️ Arquitetura do Sistema

| Arquivo                  | Função Principal                                     |
|--------------------------|------------------------------------------------------|
| `base_conhecimento.pl`   | Define perguntas, características e trilhas          |
| `motor_inferencia.pl`    | Calcula compatibilidade e recomenda trilhas          |
| `interface_usuario.pl`   | Interação com o usuário no modo interativo           |
| `perfil_teste_[N].pl`      | Perfis simulados para testes automatizados           |
| `testes.pl`              | Executa testes automatizados com múltiplos perfis    |

---

## 🚀 Como Executar

### ✅ Modo Interativo

1. Inicie o Prolog:

```bash
$ swipl
```

2. Carregue os módulos principais:

```prolog
?- [base_conhecimento, motor_inferencia, interface_usuario].
```

3. Execute o sistema:

```prolog
?- iniciar.
```

O sistema fará perguntas ao usuário e ao final recomendará trilhas com base nas respostas.

---

### 🧪 Modo de Teste Automatizado

1. Carregue o módulo de testes:

```prolog
?- [testes].
```

2. Execute um dos perfis simulados:

```prolog
?- executa_teste('perfil_teste_2.pl', R).
```

---

## 📊 Perfis de Teste Disponíveis

| Arquivo               | Perfil Simulado                   | Trilha Esperada                     |
|-----------------------|-----------------------------------|-------------------------------------|
| `perfil_teste_1.pl`   | Lógico e Analítico                | Inteligência Artificial / Dados     |
| `perfil_teste_2.pl`   | Criativo e Comunicativo           | Desenvolvimento Web / Mobile        |
| `perfil_teste_3.pl`   | Técnico e Detalhista              | Redes / Segurança da Informação     |

---

## ⚠️ Avisos Importantes

- Após testar um perfil (`perfil_teste_X.pl`), use:

```prolog
?- unload_file('perfil_teste_X.pl').
```

ou reinicie o Prolog com `halt.` antes de executar o sistema interativo (`iniciar/0`).

- Não carregue arquivos de teste antes do `iniciar/0` — isso pode causar erro de permissão ao limpar `resposta/2`.

---

## 👨‍💻 Autores e Divisão de Tarefas

| Aluno                                   | Parte Responsável                      |
|----------------------------------------|----------------------------------------|
| Renato Pestana Gouveia                 | Base de Conhecimento (`base_conhecimento.pl`) |
| Fernando Alonso Piroga da Silva        | Motor de Inferência (`motor_inferencia.pl`)   |
| Angelo Piovezan Jorgeto                | Interface com o Usuário (`interface_usuario.pl`) |
| **Jafte Carneiro Fagundes da Silva**  | **Testes, Documentação, Integração**   |

