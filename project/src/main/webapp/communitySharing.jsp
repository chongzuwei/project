<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta
      name="description"
      content="Wellness Community Forum – Support, Share, Connect. Join our community to discuss wellness topics, share experiences, and support each other."
    />
    <title>Community Forum – Wellness Community</title>

    <style>
      @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      html {
        scroll-behavior: smooth;
      }

      body {
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
        background-color: #e8f4f8;
        color: #2c3e50;
        line-height: 1.6;
      }

      /* Header Navigation */
      header {
        background-color: #f5f5f5;
        border-bottom: 1px solid #e0e0e0;
        position: sticky;
        top: 0;
        z-index: 100;
      }

      nav {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 2rem;
        display: flex;
        align-items: center;
        justify-content: space-evenly;
        min-height: 70px;
      }

      nav a {
        text-decoration: none;
        color: #2c3e50;
        font-size: 1.05rem;
        font-weight: 500;
        transition: color 0.2s;
        position: relative;
      }

      nav a:hover {
        color: #000;
      }

      nav a.active {
        font-weight: 700;
        color: #000;
      }

      /* Hero Section */
      .hero {
        max-width: 1200px;
        margin: 0 auto;
        padding: 3rem 2rem 2rem;
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
      }

      .hero-content h1 {
        font-size: 2.5rem;
        font-weight: 700;
        color: #000;
        margin-bottom: 0.5rem;
      }

      .hero-content p {
        font-size: 1.05rem;
        color: #6b7280;
        font-weight: 400;
      }

      .new-post-btn {
        background-color: #000;
        color: #fff;
        border: none;
        padding: 0.875rem 1.75rem;
        border-radius: 8px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        transition: background-color 0.2s;
      }

      .new-post-btn:hover {
        background-color: #1a1a1a;
      }

      /* Main Content */
      .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 2rem;
      }

      /* Post Card */
      .post-card {
        background-color: #fff;
        border-radius: 16px;
        padding: 2rem;
        margin-bottom: 1.5rem;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
      }

      .post-header {
        display: flex;
        gap: 1rem;
      }

      .avatar {
        width: 48px;
        height: 48px;
        border-radius: 50%;
        background: linear-gradient(135deg, #e74c3c 0%, #5dade2 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        color: #fff;
        font-weight: 700;
        font-size: 1rem;
        flex-shrink: 0;
      }

      .post-meta {
        flex: 1;
      }

      .post-author-line {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        margin-bottom: 0.5rem;
      }

      .post-author {
        font-weight: 600;
        font-size: 1rem;
        color: #000;
      }

      .post-time {
        color: #6b7280;
        font-size: 0.95rem;
      }

      .post-category {
        display: inline-block;
        padding: 0.35rem 0.875rem;
        border-radius: 6px;
        font-size: 0.875rem;
        font-weight: 500;
      }

      .category-success {
        background-color: #dbeafe;
        color: #1e40af;
      }

      .category-question {
        background-color: #dbeafe;
        color: #1e40af;
      }

      .post-title {
        font-size: 1.125rem;
        font-weight: 600;
        color: #000;
        margin-bottom: 0.75rem;
      }

      .post-content {
        font-size: 1rem;
        color: #4b5563;
        line-height: 1.7;
        margin-bottom: 1.5rem;
        margin-left: 64px;
      }

      .post-actions {
        display: flex;
        align-items: center;
        gap: 1.5rem;
      }

      .action-btn {
        background: none;
        border: none;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        color: #6b7280;
        font-size: 0.95rem;
        cursor: pointer;
        transition: color 0.2s;
      }

      .action-btn:hover {
        color: #000;
      }

      .action-btn svg {
        width: 20px;
        height: 20px;
      }

      /* Modal Styles */
      .modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: rgba(0, 0, 0, 0.5);
        display: none;
        align-items: flex-start;
        justify-content: center;
        z-index: 1000;
        padding-top: 2rem;
        overflow-y: auto;
      }

      .modal-overlay.active {
        display: flex;
      }

      .modal-content {
        background-color: #fff;
        border-radius: 16px;
        padding: 2.5rem;
        max-width: 1000px;
        width: 90%;
        margin: 2rem auto;
        box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
      }

      .modal-header {
        margin-bottom: 2rem;
      }

      .modal-header h2 {
        font-size: 1.5rem;
        font-weight: 600;
        color: #000;
      }

      .category-selector {
        display: flex;
        gap: 0.75rem;
        margin-bottom: 2rem;
        flex-wrap: wrap;
      }

      .category-btn {
        padding: 0.625rem 1.25rem;
        border: 1px solid #d1d5db;
        border-radius: 8px;
        background-color: #fff;
        color: #374151;
        font-size: 0.95rem;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.2s;
      }

      .category-btn:hover {
        border-color: #9ca3af;
      }

      .category-btn.active {
        background-color: #000;
        color: #fff;
        border-color: #000;
      }

      .post-textarea {
        width: 100%;
        min-height: 150px;
        padding: 1rem;
        border: 1px solid #d1d5db;
        border-radius: 8px;
        font-size: 1rem;
        font-family: 'Inter', sans-serif;
        color: #374151;
        resize: vertical;
        margin-bottom: 1.5rem;
      }

      .post-textarea:focus {
        outline: none;
        border-color: #000;
      }

      .post-textarea::placeholder {
        color: #9ca3af;
      }

      .modal-actions {
        display: flex;
        gap: 1rem;
      }

      .btn-post {
        background-color: #000;
        color: #fff;
        border: none;
        padding: 0.75rem 2rem;
        border-radius: 8px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.2s;
      }

      .btn-post:hover {
        background-color: #1a1a1a;
      }

      .btn-cancel {
        background-color: #fff;
        color: #000;
        border: 1px solid #d1d5db;
        padding: 0.75rem 2rem;
        border-radius: 8px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.2s;
      }

      .btn-cancel:hover {
        background-color: #f3f4f6;
      }

      /* Trending Topics Section */
      .trending-section {
        background-color: #fff;
        border-radius: 16px;
        padding: 2rem;
        margin-bottom: 1rem;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
      }

      .trending-header {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        margin-bottom: 1.5rem;
      }

      .trending-header svg {
        width: 24px;
        height: 24px;
        color: #3b82f6;
      }

      .trending-header h3 {
        font-size: 1.25rem;
        font-weight: 600;
        color: #000;
      }

      .trending-tags {
        display: flex;
        gap: 0.75rem;
        flex-wrap: wrap;
      }

      .trending-tag {
        padding: 0.625rem 1.25rem;
        border: 1px solid #d1d5db;
        border-radius: 8px;
        background-color: #fff;
        color: #374151;
        font-size: 0.95rem;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.2s;
      }

      .trending-tag:hover {
        background-color: #f3f4f6;
        border-color: #9ca3af;
      }

      /* Mobile Responsive */
      @media (max-width: 768px) {
        nav {
          flex-wrap: wrap;
          gap: 1.5rem;
          padding: 1rem;
        }

        .hero {
          flex-direction: column;
          gap: 1.5rem;
        }

        .hero-content h1 {
          font-size: 2rem;
        }

        .post-card {
          padding: 1.5rem;
        }

        .modal-content {
          width: 95%;
          padding: 1.5rem;
        }

        .category-selector {
          gap: 0.5rem;
        }

        .category-btn {
          padding: 0.5rem 1rem;
          font-size: 0.875rem;
        }

        .modal-actions {
          flex-direction: column;
        }

        .btn-post,
        .btn-cancel {
          width: 100%;
        }
      }
    </style>
  </head>
  <body>
    <!-- Header Navigation -->
    <header>
      <nav role="navigation" aria-label="Main navigation">
        <a href="#home">Home</a>
        <a href="#resources">Resources</a>
        <a href="#assessment">Self-Assessment</a>
        <a href="#activity">Activity Log</a>
        <a href="#community" class="active">Community</a>
        <a href="#profile">Profile</a>
      </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero">
      <div class="hero-content">
        <h1>Community Forum</h1>
        <p>Connect, share, and support each other on your wellness journey</p>
      </div>
      <button class="new-post-btn">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <line x1="12" y1="5" x2="12" y2="19"></line>
          <line x1="5" y1="12" x2="19" y2="12"></line>
        </svg>
        New Post
      </button>
    </section>

    <!-- Trending Topics Section -->
    <section class="container">
      <div class="trending-section">
        <div class="trending-header">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline>
            <polyline points="17 6 23 6 23 12"></polyline>
          </svg>
          <h3>Trending Topics</h3>
        </div>
        <div class="trending-tags">
          <button class="trending-tag">#ExamStress</button>
          <button class="trending-tag">#SelfCare</button>
          <button class="trending-tag">#Mindfulness</button>
          <button class="trending-tag">#SleepTips</button>
          <button class="trending-tag">#Boundaries</button>
        </div>
      </div>
    </section>

    <!-- Modal Overlay -->
    <div class="modal-overlay" id="newPostModal">
      <div class="modal-content">
        <div class="modal-header">
          <h2>Create a Post</h2>
        </div>

        <div class="category-selector">
          <button class="category-btn active" data-category="question">Question</button>
          <button class="category-btn" data-category="discussion">Discussion</button>
          <button class="category-btn" data-category="support">Support</button>
          <button class="category-btn" data-category="success">Success Story</button>
        </div>

        <textarea 
          class="post-textarea" 
          placeholder="Share your thoughts, ask a question or offer support"
        ></textarea>

        <div class="modal-actions">
          <button class="btn-post">Post</button>
          <button class="btn-cancel" id="cancelBtn">Cancel</button>
        </div>
      </div>
    </div>

    <!-- Main Content -->
    <main class="container">
      <!-- Post Card 1 -->
      <article class="post-card">
        <div class="post-header">
          <div class="avatar">FA</div>
          <div class="post-meta">
            <div class="post-author-line">
              <span class="post-author">Farah Ann</span>
              <span class="post-time">• 2 hours ago</span>
              <span class="post-category category-success">Success Story</span>
            </div>
            <h2 class="post-title">Finally manages my exam anxiety!</h2>
          </div>
        </div>
        <p class="post-content">
          I wanted to share that I successfully completed my midterms without having a panic attack. The breathing techniques from the resources here really helped. To anyone struggling, it gets better!
        </p>
        <div class="post-actions">
          <button class="action-btn">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
            </svg>
            <span>24</span>
          </button>
          <button class="action-btn">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
            </svg>
            <span>8</span>
          </button>
          <button class="action-btn">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="18" cy="5" r="3"></circle>
              <circle cx="6" cy="12" r="3"></circle>
              <circle cx="18" cy="19" r="3"></circle>
              <line x1="8.59" y1="13.51" x2="15.42" y2="17.49"></line>
              <line x1="15.41" y1="6.51" x2="8.59" y2="10.49"></line>
            </svg>
            <span>Share</span>
          </button>
        </div>
      </article>

      <!-- Post Card 2 -->
      <article class="post-card">
        <div class="post-header">
          <div class="avatar">CY</div>
          <div class="post-meta">
            <div class="post-author-line">
              <span class="post-author">Chen Yi</span>
              <span class="post-time">• 2 hours ago</span>
              <span class="post-category category-question">Question</span>
            </div>
            <h2 class="post-title">Tips for maintaining boundaries with friends?</h2>
          </div>
        </div>
        <p class="post-content">
          I've been struggling with saying no to friends when I need alone time to recharge. Does anyone have advice on how to communicate boundaries without feeling guilty?
        </p>
        <div class="post-actions">
          <button class="action-btn">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
            </svg>
            <span>18</span>
          </button>
          <button class="action-btn">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
            </svg>
            <span>15</span>
          </button>
          <button class="action-btn">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="18" cy="5" r="3"></circle>
              <circle cx="6" cy="12" r="3"></circle>
              <circle cx="18" cy="19" r="3"></circle>
              <line x1="8.59" y1="13.51" x2="15.42" y2="17.49"></line>
              <line x1="15.41" y1="6.51" x2="8.59" y2="10.49"></line>
            </svg>
            <span>Share</span>
          </button>
        </div>
      </article>

      <!-- Post Card 3 -->
      <article class="post-card">
        <div class="post-header">
          <div class="avatar">CY</div>
          <div class="post-meta">
            <div class="post-author-line">
              <span class="post-author">Chen Yi</span>
              <span class="post-time">• 2 hours ago</span>
              <span class="post-category category-question">Question</span>
            </div>
            <h2 class="post-title">Tips for maintaining boundaries with friends?</h2>
          </div>
        </div>
        <p class="post-content">
          I've been struggling with saying no to friends when I need alone time to recharge. Does anyone have advice on how to communicate boundaries without feeling guilty?
        </p>
        <div class="post-actions">
          <button class="action-btn">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
            </svg>
            <span>18</span>
          </button>
          <button class="action-btn">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
            </svg>
            <span>15</span>
          </button>
          <button class="action-btn">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="18" cy="5" r="3"></circle>
              <circle cx="6" cy="12" r="3"></circle>
              <circle cx="18" cy="19" r="3"></circle>
              <line x1="8.59" y1="13.51" x2="15.42" y2="17.49"></line>
              <line x1="15.41" y1="6.51" x2="8.59" y2="10.49"></line>
            </svg>
            <span>Share</span>
          </button>
        </div>
      </article>
    </main>

    <script>
      // Modal functionality
      const newPostBtn = document.querySelector('.new-post-btn');
      const modal = document.getElementById('newPostModal');
      const cancelBtn = document.getElementById('cancelBtn');
      const categoryBtns = document.querySelectorAll('.category-btn');

      // Open modal
      newPostBtn.addEventListener('click', () => {
        modal.classList.add('active');
        document.body.style.overflow = 'hidden';
      });

      // Close modal
      cancelBtn.addEventListener('click', () => {
        modal.classList.remove('active');
        document.body.style.overflow = 'auto';
      });

      // Close modal when clicking outside
      modal.addEventListener('click', (e) => {
        if (e.target === modal) {
          modal.classList.remove('active');
          document.body.style.overflow = 'auto';
        }
      });

      // Category selection
      categoryBtns.forEach(btn => {
        btn.addEventListener('click', () => {
          categoryBtns.forEach(b => b.classList.remove('active'));
          btn.classList.add('active');
        });
      });

      // Close modal on Escape key
      document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && modal.classList.contains('active')) {
          modal.classList.remove('active');
          document.body.style.overflow = 'auto';
        }
      });
    </script>
  </body>
</html>
