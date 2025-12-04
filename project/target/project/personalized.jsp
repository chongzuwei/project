<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Suggested Resources</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        :root{ --bg:#dff4f7; --card:#ffffff; --accent:#cfeff6; --muted:#6b6b6b }
        html,body{height:100%;margin:0;padding:0;font-family: Arial, Helvetica, sans-serif;background:var(--bg)}
        .site-header{background:#fff;padding:10px 20px;box-shadow:0 1px 0 rgba(0,0,0,0.06)}
        .nav{max-width:1000px;margin:0 auto;display:flex;align-items:center;gap:18px}
        .nav a{color:#333;text-decoration:none;padding:8px 10px;border-radius:4px}
        .nav a.active{background:var(--accent);font-weight:600}
        .container{max-width:1000px;margin:28px auto;padding:18px}
        .page-title{font-size:20px;margin:6px 0 18px}

        .resources{display:flex;gap:24px}
        .main{flex:1}
        .side{width:320px}

        .section{background:var(--card);padding:18px;border-radius:8px;box-shadow:0 4px 8px rgba(0,0,0,0.04);margin-bottom:18px}
        .section h2{margin:0 0 12px;font-size:16px}

        /* Video thumbnail */
        .video-thumb{Width:100%;height:180px;object-fit:cover;border-radius:6px;border:1px solid #e6e6e6}

        /* Article box */
        .article-box{background:#fff;padding:12px;border-radius:8px;border:1px dashed #d0e9ef;color:#0b6b7a;word-break:break-all}

        /* Peer story */
        .peer-story{background:#fff;padding:14px;border-radius:12px;box-shadow:inset 0 0 0 6px rgba(255,255,255,0.6);line-height:1.4;color:#222}
        .peer-story p{margin:0;font-size:14px}

        /* small helper styles */
        .label{font-size:13px;color:var(--muted);font-weight:600;margin-bottom:8px}

        @media(max-width:900px){.resources{flex-direction:column}.side{width:auto}}
    </style>
</head>
<body>

<header class="site-header">
    <nav class="nav">
        <a href="#">Home</a>
        <a href="#" class="active">Resource</a>
        <a href="#">Self-Assessment</a>
        <a href="#">Activity</a>
        <a href="#">Community</a>
        <a href="#">Profile</a>
    </nav>
</header>

<main class="container">
    <div class="page-title">Suggested Resources</div>

    <div class="resources">
        <div class="main">
            <section class="section">
                <div class="label">Videos</div>
                <img class="video-thumb" src="https://via.placeholder.com/900x300.png?text=Video+Thumbnail" alt="Video thumbnail">
            </section>

            <section class="section">
                <div class="label">Articles</div>
                <div class="article-box">https://www.pinerest.org/newsroom/articles/mental-health-awareness-blog/</div>
            </section>
        </div>

        <aside class="side">
            <section class="section">
                <div class="label">Peer Stories</div>
                <div class="peer-story">
                    <p>
                        The impact of hiding: Another story involves someone with type 2 bipolar disorder who hid their diagnosis for years, only openly admitting to having depression. They share that hiding the full truth prevented them from seeking the right help sooner and that they wished they had accepted support instead of thinking they were "better", according to this story from Keele University.
                    </p>
                </div>
            </section>
        </aside>
    </div>
</main>

</body>
</html>
