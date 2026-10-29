
<?php
$publicacoes = [
    [
        "id" => 1,
        "autor" => "Ana Silva",
        "data" => "28/10/2026",
        "conteudo" => "Hoje comecei a compartilhar minhas ideias aqui no Notiva!"
    ],
    [
        "id" => 2,
        "autor" => "Pedro Santos",
        "data" => "28/10/2026",
        "conteudo" => "Qual é o livro que vocês mais recomendam para ler?"
    ],
    [
        "id" => 3,
        "autor" => "Mariana Costa",
        "data" => "27/10/2026",
        "conteudo" => "Uma ideia compartilhada pode inspirar muitas pessoas."
    ]
];
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Notiva | Início</title>

    <link rel="stylesheet" href="css/publicacao.css">
</head>

<body>

    <header class="cabecalho">
        <a class="logo" href="index.php">Notiva</a>

        <nav>
            <a href="index.php">Início</a>
            <a href="paginas/nova_publicacao.php">Publicar</a>
        </nav>
    </header>

    <main class="conteudo">

        <section class="boas-vindas">
            <h1>Seu espaço para compartilhar ideias.</h1>
            <p>Descubra publicações e compartilhe o que pensa.</p>

            <a class="botao" href="paginas/nova_publicacao.php">
                Criar publicação
            </a>
        </section>

        <section class="feed">
            <h2>Publicações recentes</h2>

            <?php foreach ($publicacoes as $publicacao): ?>
                <article class="cartao-publicacao">

                    <div class="informacoes-autor">
                        <strong>
                            <?= htmlspecialchars($publicacao["autor"]) ?>
                        </strong>

                        <span>
                            <?= htmlspecialchars($publicacao["data"]) ?>
                        </span>
                    </div>

                    <p class="texto-publicacao">
                        <?= htmlspecialchars($publicacao["conteudo"]) ?>
                    </p>

                    <div class="acoes-publicacao">
                        <a href="paginas/publicacao.php?id=<?= $publicacao["id"] ?>">
                            Ver publicação
                        </a>

                        <a href="paginas/publicacao.php?id=<?= $publicacao["id"] ?>">
                            Editar
                        </a>
                    </div>

                </article>
            <?php endforeach; ?>

        </section>

    </main>

    <footer class="rodape">
        <p>Notiva — Compartilhe suas ideias.</p>
    </footer>

</body>
</html>
