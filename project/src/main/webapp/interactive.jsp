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

        /* Leaderboard styles */
        .leaderboard-wrap{display:flex;justify-content:center;margin-bottom:20px}
        .leaderboard-card{width:680px;background:var(--card);padding:20px;border-radius:12px;box-shadow:0 6px 18px rgba(0,0,0,0.06)}
        .leaderboard-card h2{margin:0 0 12px;text-align:center;font-size:18px}
        .leaderboard-list{list-style:none;padding:0;margin:0}
        .leaderboard-list li{display:flex;align-items:center;gap:12px;padding:10px 8px;font-weight:700}
        .leaderboard-list li:not(:last-child){border-bottom:1px dotted #d4d4d4}
        .rank-name{min-width:420px}
        .dots{flex:1;border-bottom:1px dotted #2b2b2b;margin:0 10px}
        .points{white-space:nowrap}

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
        <a href="#">Leaderboards</a>
        <a href="#">Profile</a>
    </nav>
</header>

<main class="container">
    <div class="page-title">Suggested Resources</div>

    <!-- Leaderboards (matches provided mockup) -->
    <div class="leaderboard-wrap">
        <div class="leaderboard-card">
            <h2>Leaderboards</h2>
            <ol class="leaderboard-list">
                <li><span class="rank-name">1. KEVIN ELSADIQ</span><span class="dots"></span><span class="points">80PTS</span></li>
                <li><span class="rank-name">2. MUSAB ELSADIG</span><span class="dots"></span><span class="points">75PTS</span></li>
                <li><span class="rank-name">3. ELVIN MASHUKA</span><span class="dots"></span><span class="points">65PTS</span></li>
                <li><span class="rank-name">4. CHUMPU USTAD</span><span class="dots"></span><span class="points">55PTS</span></li>
                <li><span class="rank-name">5. CHAGHLE GURU</span><span class="dots"></span><span class="points">45PTS</span></li>
                <li><span class="rank-name">6. RONY O'SULLIVAN</span><span class="dots"></span><span class="points">40PTS</span></li>
                <li><span class="rank-name">7. GEDRICH HENRY</span><span class="dots"></span><span class="points">40PTS</span></li>
                <li><span class="rank-name">8. MARK SELVY</span><span class="dots"></span><span class="points">42PTS</span></li>
                <li><span class="rank-name">9. JUDD TRUMP</span><span class="dots"></span><span class="points">35PTS</span></li>
                <li><span class="rank-name">10. KILLIAN MURPHY</span><span class="dots"></span><span class="points">32PTS</span></li>
            </ol>
        </div>
    </div>

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
