
# h-encode Maker - R4z0r

O **h-encode Maker - R4z0r** é um script em batch que automatiza o processo de download, extração e configuração de diversas ferramentas necessárias para criar um exploit h-encore² para PS Vita. O repositório inclui o script `h-encode Maker - r4z0r.bat` e uma pasta `bin` com os arquivos binários necessários.

## Como Funciona

### Estrutura do Repositório
- **`h-encode Maker - r4z0r.bat`**: Script principal que gerencia todo o processo de criação do h-encore².
- **`bin/`**: Pasta contendo binários necessários, como `wget`, `7za` e `robocopy`.

### Passo a Passo do Script

1. **Inicialização e Preparação**
   - Exibe o cabeçalho.
   - Cria a pasta temporária `temp` se não existir ou a limpa se já existir.

2. **Download e Extração de Arquivos Necessários**
   - Faz download do h-encore² e extrai os arquivos.
   - Faz download do psvimgtools e extrai os arquivos.
   - Faz download do pkg2zip e extrai os arquivos.
   - Faz download do jogo Bitter Smile.

3. **Extração e Modificação do Jogo**
   - Extrai o jogo Bitter Smile.
   - Aplica os patches do h-encore² ao jogo extraído.

4. **Configuração do QCMA**
   - Faz download do QCMA.
   - Instruções para configurar e usar o QCMA para transferir o exploit para o PS Vita.

5. **Criação e Transferência dos Arquivos PSVIMG**
   - Solicita a chave de descriptografia do usuário.
   - Usa o psvimgtools para criar os arquivos PSVIMG com base na chave fornecida.
   - Move os arquivos criados para a pasta necessária.

### Instruções para Uso
1. Clone este repositório ou baixe os arquivos zip.
2. Execute o script `h-encode Maker - r4z0r.bat`.
3. Siga as instruções apresentadas pelo script para instalar e configurar o h-encore² no seu PS Vita.

### Dependências
- **`wget`**: Para download de arquivos.
- **`7za`**: Para extração de arquivos zip.
- **`robocopy`**: Para cópia de arquivos e diretórios.
