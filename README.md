# PACOTE TECNICO ULTRA V6.0.1 by MrCanatto

**Ferramenta completa para técnicos de informática** — Reparo, limpeza, otimização e ativação do Windows.

Desenvolvido para facilitar o dia a dia de assistências técnicas e profissionais de TI.

## Como Usar

1. Baixe o arquivo `PACOTE TECNICO ULTRA V6.0.1 by MrCanatto.bat`
2. Clique com o botão direito sobre o arquivo e selecione **"Executar como administrador"**
3. O programa irá solicitar privilégios elevados automaticamente caso não esteja rodando como Admin.
4. Escolha a opção desejada no menu e aguarde a conclusão.
5. Na maioria das funções será gerado um arquivo de log na sua **Área de Trabalho**.

> **Recomendação:** Sempre execute o script como Administrador para que todas as funções funcionem corretamente.

---

## Avisos de Uso (Importante Ler)

- Este script realiza ações poderosas de limpeza e modificação do sistema. Use com **cautela**.
- Recomenda-se criar um **Ponto de Restauração do Sistema** antes de usar as opções de limpeza pesada.
- Feche todos os programas importantes antes de executar a **Limpeza e Otimização Completa**.
- A opção de ativação ([0]) baixa e executa código diretamente da internet. Use por sua conta e risco.
- Algumas funções podem demorar vários minutos (principalmente o DISM).
- Não interrompa o script enquanto ele estiver executando.

---

## Menu Principal

| Opção | Nome | Descrição |
|-------|------|---------|
| **0** | **Win & Office Magic Activation** | Ativação automática do Windows e Office |
| **1** | **Reparo Rápido Internet/Navegadores** | Reparo rápido de rede e navegadores |
| **2** | **Limpeza e Otimização Completa** | Limpeza profunda do sistema |
| **3** | **Reparar Impressoras** | Reparo básico de impressoras |
| **4** | **Reparar Impressoras ULTRA** | Reparo avançado de impressoras |
| **5** | **Reparar Áudio** | Reparo de problemas de som |
| **6** | **Reparar Arquivos Windows (SFC)** | Verificação e reparo de arquivos do sistema |
| **7** | **Reparar Imagem Windows (DISM)** | Reparo da imagem do Windows |
| **8** | **Abrir Ferramentas Técnicas** | Atalhos para ferramentas nativas |
| **9** | **Sair** | Fecha o programa |

---

## Detalhamento das Funções

### **[0] Win & Office Magic Activation**
Inicia o script de ativação automática do Windows e Office (HWID/KMS) em segundo plano.

### **[1] Reparo Rápido Internet/Navegadores**
- Encerra navegadores e aplicativos leves.
- Repara configurações de rede (flushdns, winsock reset, etc.).
- Aplica DNS Cloudflare (1.1.1.1 e 1.0.0.1).
- Limpa cache de navegadores (Chrome, Edge, Firefox, Opera, Brave, Vivaldi).
- Limpa histórico Chromium, temporários, prefetch e lixeira.
- Gera log na Área de Trabalho.

### **[2] Limpeza e Otimização Completa**
- Encerra aplicativos pesados.
- Limpeza completa de temporários, caches do Windows, thumbnails, ícones e logs.
- Limpa arquivos do Windows Update.
- Executa **DISM Cleanup**.
- Limpa Lixeira.
- Salva informações do sistema e processos.

### **[3] Reparar Impressoras**
- Para o serviço Spooler.
- Limpa fila de impressão e cache do spooler.
- Reinicia serviços relacionados.
- Reparo rápido e simples.

### **[4] Reparar Impressoras ULTRA**
- Versão avançada com PowerShell.
- Lista impressoras instaladas e status.
- Limpeza profunda das pastas de spool.
- Reinicia múltiplos serviços relacionados.
- Gera log detalhado com informações técnicas.

### **[5] Reparar Áudio**
- Reinicia os serviços de áudio (Audiosrv e AudioEndpointBuilder).
- Limpa configurações de registro do áudio.
- Abre o painel de configurações de som.

### **[6] Reparar Arquivos Windows (SFC)**
Executa o comando nativo:
```cmd `sfc /scannow`.

### **[7] Reparar Imagem Windows (DISM)**
Executa `DISM /Online /Cleanup-Image /RestoreHealth`.

### **[8] Abrir Ferramentas Técnicas**
Acesso rápido a: MSConfig, Gerenciador de Tarefas, Serviços, Gerenciador de Dispositivos, etc.

---

## Observações Importantes

- A opção **[1]** preserva configurações de **IP fixo, máscara e gateway** (pula o comando `netsh int ip reset`).
- A opção **[2]** contém limpeza mais pesada e executa **DISM Cleanup** (pode demorar bastante).
- Algumas rotinas exigem **reinicialização** do computador para concluir totalmente os reparos.
- A limpeza de histórico Chromium remove o arquivo `History`; não mexe diretamente em senhas, mas pode afetar dados de navegação.
- O **DISM Cleanup** (dentro da opção 2) pode demorar muito dependendo do estado do Windows.

---

## Requisitos

- Windows 10 ou 11
- Executar como **Administrador**
- Conexão com a internet (para ativação e alguns reparos)

---
Autor
Desenvolvido e idealizado TEC. Mr.Canatto com apoio de Inteligência Artificial aplicada ao desenvolvimento e arquitetura do Script Batch.
