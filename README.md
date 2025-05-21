<div align=center>
    <h1>🏆<b>Champions Tracker</b></h1>
</div>

<div align=center>
    <img src="https://files.catbox.moe/0n7o27.png" width=200>
</div>

</br>

<div align='center'>
    <strong>
        <p><a href='https://github.com/ericksantos12'>Erick Santos Sousa</a></p>
    </strong>
</div>
<div align='center'>
    <strong>
        <p><a href='https://github.com/GabrielleCGNeves'>Gabrielle C G Neves</a></p>
    </strong>
</div>

---
## O que é o <b>Champions Tracker?</b> 🤔

</br>

> 🗄️ O <b>Champions Tracker</b> é uma plataforma que permite o gerenciamento de campeonatos, contemplando tanto o ambiente físico como o virtual, oferecendo uma ferramenta completa para a organização de equipes e torneios e jogos independente da sua modalidade. O sistema fornece uma lista base de critérios avaliativos para cada esporte, permitindo a customização ou criação de um sistema de pontuação próprio. Esses pontos poderiam ser agregados à cartilha do jogador e da equipe, a fim de uma melhor gestão de desempenho.

> 📊 É incluso também um sistemas de palpites para os espectadores, os pontos adquiridos através de palpites corretos sobre o desempenho ou pontuação de um jogador ou time serão exibidos no perfil, estimulando a participação dos usuários para torcer e engajar com seus jogadores e equipes favoritas.

---

## Layout da Aplicação 🎨🖌️

</br>

<img src="https://files.catbox.moe/nqkxsv.png">

<div>
    <a href="https://www.figma.com/file/6gkSjps0gaKoABpzlxglg8/Champions-Tracker-Web?type=design&node-id=0%3A1&mode=design&t=r5LkAvlpF6jHtMlp-1"><img src="https://img.shields.io/badge/ver_mais-F24E1E?style=for-the-badge&logo=figma&logoColor=white"></a>
</div>

---

## Desenvolvendo localmente 👨‍💻
Primeiramente você precisará ter o [Node](https://nodejs.org) instalado em sua máquina

Utilize as extensões recomendadas para o [vscode](https://vscode.dev)
- [Svelte Bundle](https://marketplace.visualstudio.com/items?itemName=1YiB.svelte-bundle)
- [Vite](https://marketplace.visualstudio.com/items?itemName=antfu.vite)
- [Prisma](https://marketplace.visualstudio.com/items?itemName=Prisma.prisma)

Após isso realize o passo-a-passo:

### 1. Clone e acesse o repositório do Github
```bash
git clone https://github.com/GabrielleCGNeves/ChampionsTracker.git

cd ChampionsTracker
```

### 2. Instale as dependências
```bash
npm install
```

### 3. Crie um arquivo `.env` na raiz do projeto
```bash
touch .env
```
Crie uma variável de [endereço de conexão](https://www.prisma.io/docs/getting-started/setup-prisma/start-from-scratch/relational-databases/connect-your-database-typescript-postgresql) no arquivo `.env`, conforme exemplo abaixo:
```bash
DATABASE_URL="mysql://USER:PASSWORD@HOST:PORT/DATABASE"
```

Se você utiliza o **XAMPP** basta renomear o arquivo `.env.example` para `.env` e ele funcionará perfeitamente

### 4. Faça a migração do banco do Prisma
```bash
npm run db:dev
```


### 5. Inicialize o servidor local
```bash
npm run dev
```
