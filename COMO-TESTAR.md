# Assistente — como gerar o instalador e testar

## Por que ainda não existe um `.exe` pronto

O Assistente é um app Tauri: a interface é web, mas o motor é em Rust e o instalador é
montado com ferramentas do próprio Windows (NSIS e MSI). Isso significa que o `.exe`
**precisa ser gerado uma vez num PC com Windows** — não é algo que se produza em outro
sistema e saia funcionando. Depois de gerado, o instalador serve para qualquer pessoa:
é só mandar o arquivo.

## O caminho mais curto: duplo clique

Na raiz desta pasta há o arquivo **`instalar-e-testar.bat`**. Dê duplo clique nele.
Ele faz sozinho:

1. confere se Node.js e Rust estão instalados, avisando o que falta;
2. baixa as dependências do projeto (`npm install`);
3. compila e monta o instalador (`npm run pack`);
4. abre a pasta `windows\release` com o resultado.

Na primeira vez leva de 5 a 15 minutos, porque compila todo o Rust. Depois disso,
rodar de novo é bem mais rápido.

## O que precisa estar instalado (uma vez só)

| Programa | Onde pegar | Para que serve |
|---|---|---|
| Node.js 20 ou mais novo | <https://nodejs.org> (versão LTS) | monta a interface |
| Rust | <https://rustup.rs> | compila o motor |
| Visual Studio Build Tools | <https://visualstudio.microsoft.com/downloads> | fornece o compilador C++ que o Rust usa no Windows |

No instalador do Visual Studio, marque a carga **"Desktop development with C++"**.
Sem ela, a compilação falha com um erro citando `link.exe` ou MSVC.

## O que sai no fim

Na pasta `windows\release\`:

- `Assistente-Windows-0.5.9-setup.exe` — instalador por usuário (não pede senha de administrador);
- `Assistente-Windows-0.5.9.msi` — instalação para todos os usuários da máquina.

O `.exe` é o que você manda para alguém testar. Ele instala o app e o Assistente aparece
no topo da tela, do mesmo jeito que o Coucou original.

## Se o Windows reclamar

O app não tem assinatura digital (assinatura é paga, cerca de 300 dólares por ano). Na
primeira execução o Windows pode mostrar "O Windows protegeu o computador". Clique em
**Mais informações → Executar assim mesmo**. Isso é esperado em programas sem
certificado, não é sinal de vírus.

## Alternativa: rodar sem instalar

Se quiser só ver o app funcionando, com recarga automática a cada alteração:

```powershell
cd windows
npm install
npm run tauri dev
```

Isso abre o Assistente direto, sem gerar instalador.
