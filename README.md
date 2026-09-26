# 📸 Auto Metadata - Atualizador Inteligente de Metadados

Aplicação leve, rápida e sem necessidade de instalação para atualizar automaticamente a metadata (EXIF) e as datas do sistema de arquivos de fotos e vídeos com base no **timestamp** contido no nome do arquivo.

---

## 🚀 Como Usar

Existem duas formas muito simples de usar:

### 1. Arrastar e Soltar (Drag & Drop) — Mais Rápido
* Pegue uma pasta inteira (ou selecione vários arquivos de foto/vídeo) e **arraste e solte diretamente em cima do arquivo `atualizar_metadata.bat`**.
* O programa iniciará automaticamente, analisará os arquivos e exibirá uma pré-visualização das datas detectadas antes de aplicar.

### 2. Duplo Clique (Menu Interativo)
* Dê dois cliques em **`atualizar_metadata.bat`**.
* Um menu interativo se abrirá com as opções:
  - **[1] Abrir janela para escolher pasta**: Abre a janela nativa do Windows para você selecionar a pasta com 1 clique.
  - **[2] Digitar ou colar o caminho**: Permite colar o caminho de qualquer pasta.
  - **[3] Usar pasta atual**: Processa a própria pasta onde o aplicativo está localizado.

---

## 🔍 Formatos de Nomes Reconhecidos Inteligente

O algoritmo reconhece automaticamente diversos padrões comuns de câmeras, celulares e mensageiros:

| Padrão | Exemplo de Nome de Arquivo | Data Interpretada |
| :--- | :--- | :--- |
| **Câmeras Android / Padrão** | `IMG_20230815_143022.jpg` | 15/08/2023 14:30:22 |
| **Google Pixel (com milissegundos)** | `PXL_20230815_143022123.jpg` | 15/08/2023 14:30:22 |
| **Data e Hora com hífens/pontos** | `2023-08-15 14.30.22.jpg` | 15/08/2023 14:30:22 |
| **Capturas de Tela (Screenshots)** | `Screenshot_20230815-143022.png` | 15/08/2023 14:30:22 |
| **Compacto contínuo (14 dígitos)** | `20230815143022.jpg` | 15/08/2023 14:30:22 |
| **WhatsApp / Mensageiros (só data)** | `IMG-20230815-WA0001.jpg` | 15/08/2023 12:00:00 *(meio-dia padrão)* |
| **Vídeos de Celular** | `VID_20230815_143022.mp4` | 15/08/2023 14:30:22 |
| **Unix Epoch Timestamps** | `1692113422.jpg` | Data e hora correspondentes |

> *Arquivos que não possuem nenhum formato de data válido no nome são ignorados com segurança, sem sofrer qualquer alteração.*

---

## 🏷️ Quais Metadados São Atualizados?

1. **Metadados Internos das Fotos (EXIF/XMP)**:
   - `DateTimeOriginal` (Data e hora em que a foto foi tirada)
   - `CreateDate` (Data de criação do arquivo digital)
   - `ModifyDate` (Data de modificação da imagem)
2. **Metadados de Vídeos (QuickTime)**:
   - `QuickTime:CreateDate`, `QuickTime:ModifyDate`, `TrackCreateDate`, `MediaCreateDate`
3. **Sistema de Arquivos do Windows**:
   - `Data de Criação` (CreationTime)
   - `Data de Modificação` (LastWriteTime)
   *(Isso garante que a ordenação de fotos por data no Explorador de Arquivos do Windows e em nuvens como Google Fotos ou OneDrive funcione com 100% de precisão!)*

---

## 🛡️ Segurança e Qualidade dos Arquivos

- **100% Sem Perda de Qualidade (Lossless)**: Utiliza a ferramenta padrão da indústria **ExifTool**. As imagens **não são recompactadas**, mantendo os pixels e perfis de cor intactos.
- **Pré-visualização Obrigatória**: O script mostra uma amostra dos arquivos encontrados e das datas identificadas antes de fazer qualquer alteração.
- **Opção de Backup**: Antes de gravar, você pode escolher se deseja manter cópias de segurança (`.original`) ou sobrescrever direto no arquivo.

---

## 📁 Estrutura de Arquivos

```text
auto_metadata/
├── atualizar_metadata.bat     <-- Executável principal (duplo clique ou arraste arquivos aqui)
├── README.md                  <-- Instruções de uso e documentação
├── scripts/
│   └── process_metadata.ps1   <-- Motor inteligente em PowerShell
└── tools/
    ├── exiftool.exe           <-- Utilitário portátil oficial ExifTool
    └── exiftool_files/        <-- Bibliotecas do ExifTool
```
