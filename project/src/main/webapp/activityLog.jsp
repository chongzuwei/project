<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Activity Log | Wellness Tracker</title>
    <meta
      name="description"
      content="Track your wellness activities and reflect on your journey with our mindful activity log interface."
    />

    <style>
      @import url('https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;500;600;700&display=swap');

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      html,
      body {
        color: hsl(210, 25%, 15%);
        background-color: hsl(185, 40%, 85%);
      }

      html {
        scroll-behavior: smooth;
      }

      body {
        font-family: 'Nunito Sans', sans-serif;
        font-weight: 300;
        line-height: 1.5;
      }

      h1,
      h2,
      h3,
      h4,
      h5,
      h6 {
        font-weight: 500;
        line-height: 1.2;
        letter-spacing: -0.025em;
      }

      button:focus-visible,
      a:focus-visible,
      input:focus-visible,
      textarea:focus-visible,
      select:focus-visible {
        outline: 2px solid hsl(210, 90%, 45%);
        outline-offset: 2px;
      }

      .drawer-overlay {
        position: fixed;
        inset: 0;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 40;
        opacity: 0;
        transition: opacity 200ms ease-in;
        pointer-events: none;
      }

      .drawer-overlay.active {
        opacity: 1;
        pointer-events: auto;
      }

      .drawer {
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        width: 100%;
        max-width: 480px;
        background-color: hsl(0, 0%, 100%);
        z-index: 50;
        transform: translateX(100%);
        transition: transform 300ms ease-in-out;
        overflow-y: auto;
      }

      .drawer.active {
        transform: translateX(0);
      }

      .toast {
        position: fixed;
        bottom: 24px;
        right: 24px;
        background-color: hsl(0, 0%, 100%);
        color: hsl(210, 25%, 15%);
        padding: 16px 24px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        z-index: 60;
        opacity: 0;
        transform: translateY(20px);
        transition:
          opacity 200ms ease-in,
          transform 200ms ease-in;
        pointer-events: none;
      }

      .toast.active {
        opacity: 1;
        transform: translateY(0);
        pointer-events: auto;
      }

      .mobile-menu {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: hsl(0, 0%, 100%);
        z-index: 50;
        transform: translateX(-100%);
        transition: transform 300ms ease-in-out;
        overflow-y: auto;
      }

      .mobile-menu.active {
        transform: translateX(0);
      }

      @keyframes fadeInUp {
        from {
          opacity: 0;
          transform: translateY(20px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      .activity-card {
        animation: fadeInUp 400ms ease-out;
      }
    </style>
    <link rel="stylesheet" href="globals.css" />
  </head>
  <body>
    <!-- Navigation Bar -->
    <nav
      class="bg-neutral text-navbar-text fixed top-0 left-0 right-0 z-30 border-b border-gray-200"
    >
      <div class="max-w-7xl mx-auto px-6 lg:px-8">
        <div class="flex items-center justify-between h-16 lg:h-20">
          <div class="flex items-center">
            <span class="text-xl font-medium text-primary-foreground"
              >Wellness Tracker</span
            >
          </div>

          <!-- Desktop Navigation -->
          <div class="hidden md:flex items-center space-x-8">
            <a
              href="#home"
              class="text-navbar-text hover:text-gray-700 transition-colors duration-200 ease-in text-sm font-normal"
              >Home</a
            >
            <a
              href="#resources"
              class="text-navbar-text hover:text-gray-700 transition-colors duration-200 ease-in text-sm font-normal"
              >Resources</a
            >
            <a
              href="#self-assessment"
              class="text-navbar-text hover:text-gray-700 transition-colors duration-200 ease-in text-sm font-normal"
              >Self-Assessment</a
            >
            <a
              href="#activity-log"
              class="text-navbar-text border-b-2 border-cta-primary font-medium text-sm"
              >Activity Log</a
            >
            <a
              href="#community"
              class="text-navbar-text hover:text-gray-700 transition-colors duration-200 ease-in text-sm font-normal"
              >Community</a
            >
            <a
              href="#profile"
              class="text-navbar-text hover:text-gray-700 transition-colors duration-200 ease-in text-sm font-normal"
              >Profile</a
            >
          </div>

          <!-- Mobile Menu Button -->
          <button
            id="mobile-menu-button"
            class="md:hidden text-navbar-text hover:text-gray-700 transition-colors duration-200 ease-in p-2"
            aria-label="Open mobile menu"
          >
            <svg
              width="24"
              height="24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <line x1="3" y1="12" x2="21" y2="12"></line>
              <line x1="3" y1="6" x2="21" y2="6"></line>
              <line x1="3" y1="18" x2="21" y2="18"></line>
            </svg>
          </button>
        </div>
      </div>
    </nav>

    <!-- Mobile Menu -->
    <div id="mobile-menu" class="mobile-menu">
      <div class="p-6">
        <div class="flex items-center justify-between mb-8">
          <span class="text-xl font-medium text-primary-foreground">Menu</span>
          <button
            id="mobile-menu-close"
            class="text-navbar-text hover:text-gray-700 transition-colors duration-200 ease-in p-2"
            aria-label="Close mobile menu"
          >
            <svg
              width="24"
              height="24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <line x1="18" y1="6" x2="6" y2="18"></line>
              <line x1="6" y1="6" x2="18" y2="18"></line>
            </svg>
          </button>
        </div>
        <nav class="flex flex-col space-y-6">
          <a
            href="#home"
            class="text-navbar-text hover:text-gray-700 transition-colors duration-200 ease-in text-base font-normal py-3"
            >Home</a
          >
          <a
            href="#resources"
            class="text-navbar-text hover:text-gray-700 transition-colors duration-200 ease-in text-base font-normal py-3"
            >Resources</a
          >
          <a
            href="#self-assessment"
            class="text-navbar-text hover:text-gray-700 transition-colors duration-200 ease-in text-base font-normal py-3"
            >Self-Assessment</a
          >
          <a
            href="#activity-log"
            class="text-navbar-text border-l-4 border-cta-primary pl-4 font-medium text-base py-3"
            >Activity Log</a
          >
          <a
            href="#community"
            class="text-navbar-text hover:text-gray-700 transition-colors duration-200 ease-in text-base font-normal py-3"
            >Community</a
          >
          <a
            href="#profile"
            class="text-navbar-text hover:text-gray-700 transition-colors duration-200 ease-in text-base font-normal py-3"
            >Profile</a
          >
        </nav>
      </div>
    </div>

    <!-- Main Content -->
    <main class="pt-16 lg:pt-20 min-h-screen" id="activity-log">
      <!-- Header Section -->
      <section class="bg-gradient-1 py-16 lg:py-24 px-6 lg:px-8">
        <div class="max-w-4xl mx-auto">
          <div
            class="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-6"
          >
            <div>
              <h1 class="text-3xl lg:text-5xl font-medium text-hero-text mb-3">
                Activity Log
              </h1>
              <p class="text-base lg:text-lg text-gray-700">
                Track your wellness activities and reflect on your journey.
              </p>
            </div>
            <button
              id="open-drawer-btn"
              class="bg-cta-primary text-cta-primary-foreground px-6 py-3 rounded font-normal text-base hover:bg-gray-900 transition-all duration-200 ease-in hover:scale-105 whitespace-nowrap self-start lg:self-auto"
            >
              + Log Activity
            </button>
          </div>
        </div>
      </section>

      <!-- Activity Feed Section -->
      <section class="py-16 lg:py-24 px-6 lg:px-8">
        <div class="max-w-4xl mx-auto">
          <div id="activity-feed" class="space-y-6">
            <!-- Activity Card 1 -->
            <article
              class="activity-card bg-neutral rounded p-6 border border-gray-200"
            >
              <div
                class="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-4 mb-4"
              >
                <div class="flex items-start gap-4">
                  <div class="text-4xl" aria-hidden="true">🧘</div>
                  <div>
                    <h2
                      class="text-xl font-medium text-primary-foreground mb-1"
                    >
                      Morning Meditation
                    </h2>
                    <p class="text-sm text-gray-600">
                      December 15, 2024 • 20 minutes
                    </p>
                  </div>
                </div>
                <span
                  class="bg-success text-neutral px-4 py-1 rounded-full text-sm font-normal self-start"
                  >Mood: Great</span
                >
              </div>
              <div class="bg-gray-50 border border-gray-200 rounded p-4">
                <p class="text-gray-700 text-sm leading-relaxed">
                  Started my day with a peaceful meditation session. Focused on
                  breath awareness and felt a deep sense of calm. This practice
                  continues to help me manage stress and stay centered
                  throughout the day.
                </p>
              </div>
            </article>

            <!-- Activity Card 2 -->
            <article
              class="activity-card bg-neutral rounded p-6 border border-gray-200"
            >
              <div
                class="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-4 mb-4"
              >
                <div class="flex items-start gap-4">
                  <div class="text-4xl" aria-hidden="true">📝</div>
                  <div>
                    <h2
                      class="text-xl font-medium text-primary-foreground mb-1"
                    >
                      Gratitude Journaling
                    </h2>
                    <p class="text-sm text-gray-600">
                      December 14, 2024 • 15 minutes
                    </p>
                  </div>
                </div>
                <span
                  class="bg-success text-neutral px-4 py-1 rounded-full text-sm font-normal self-start"
                  >Mood: Good</span
                >
              </div>
              <div class="bg-gray-50 border border-gray-200 rounded p-4">
                <p class="text-gray-700 text-sm leading-relaxed">
                  Reflected on three things I'm grateful for today: my
                  supportive family, good health, and the opportunity to learn
                  new things. This simple practice shifts my perspective and
                  helps me appreciate the present moment.
                </p>
              </div>
            </article>

            <!-- Activity Card 3 -->
            <article
              class="activity-card bg-neutral rounded p-6 border border-gray-200"
            >
              <div
                class="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-4 mb-4"
              >
                <div class="flex items-start gap-4">
                  <div class="text-4xl" aria-hidden="true">🚶</div>
                  <div>
                    <h2
                      class="text-xl font-medium text-primary-foreground mb-1"
                    >
                      Nature Walk
                    </h2>
                    <p class="text-sm text-gray-600">
                      December 13, 2024 • 45 minutes
                    </p>
                  </div>
                </div>
                <span
                  class="bg-success text-neutral px-4 py-1 rounded-full text-sm font-normal self-start"
                  >Mood: Great</span
                >
              </div>
              <div class="bg-gray-50 border border-gray-200 rounded p-4">
                <p class="text-gray-700 text-sm leading-relaxed">
                  Took a long walk in the park and connected with nature. The
                  fresh air and movement helped clear my mind. I noticed the
                  changing colors of the leaves and felt grateful for these
                  simple moments of peace.
                </p>
              </div>
            </article>

            <!-- Activity Card 4 -->
            <article
              class="activity-card bg-neutral rounded p-6 border border-gray-200"
            >
              <div
                class="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-4 mb-4"
              >
                <div class="flex items-start gap-4">
                  <div class="text-4xl" aria-hidden="true">🎨</div>
                  <div>
                    <h2
                      class="text-xl font-medium text-primary-foreground mb-1"
                    >
                      Creative Expression
                    </h2>
                    <p class="text-sm text-gray-600">
                      December 12, 2024 • 30 minutes
                    </p>
                  </div>
                </div>
                <span
                  class="bg-warning text-neutral px-4 py-1 rounded-full text-sm font-normal self-start"
                  >Mood: Okay</span
                >
              </div>
              <div class="bg-gray-50 border border-gray-200 rounded p-4">
                <p class="text-gray-700 text-sm leading-relaxed">
                  Spent time painting and letting my creativity flow without
                  judgment. It was therapeutic to express myself through colors
                  and shapes. Even though I felt a bit stressed before starting,
                  the process helped me relax.
                </p>
              </div>
            </article>

            <!-- Activity Card 5 -->
            <article
              class="activity-card bg-neutral rounded p-6 border border-gray-200"
            >
              <div
                class="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-4 mb-4"
              >
                <div class="flex items-start gap-4">
                  <div class="text-4xl" aria-hidden="true">📖</div>
                  <div>
                    <h2
                      class="text-xl font-medium text-primary-foreground mb-1"
                    >
                      Reading Time
                    </h2>
                    <p class="text-sm text-gray-600">
                      December 11, 2024 • 40 minutes
                    </p>
                  </div>
                </div>
                <span
                  class="bg-success text-neutral px-4 py-1 rounded-full text-sm font-normal self-start"
                  >Mood: Good</span
                >
              </div>
              <div class="bg-gray-50 border border-gray-200 rounded p-4">
                <p class="text-gray-700 text-sm leading-relaxed">
                  Read a chapter from a mindfulness book before bed. The
                  insights about living in the present moment resonated deeply
                  with me. This quiet time helps me wind down and prepare for
                  restful sleep.
                </p>
              </div>
            </article>
          </div>
        </div>
      </section>
    </main>

    <!-- Drawer Overlay -->
    <div id="drawer-overlay" class="drawer-overlay"></div>

    <!-- Drawer -->
    <aside
      id="drawer"
      class="drawer"
      role="dialog"
      aria-labelledby="drawer-title"
      aria-modal="true"
    >
      <div class="p-6 border-b border-gray-200">
        <div class="flex items-center justify-between">
          <h2
            id="drawer-title"
            class="text-2xl font-medium text-primary-foreground"
          >
            Log New Activity
          </h2>
          <button
            id="close-drawer-btn"
            class="text-gray-600 hover:text-gray-900 transition-colors duration-200 ease-in p-2"
            aria-label="Close drawer"
          >
            <svg
              width="24"
              height="24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <line x1="18" y1="6" x2="6" y2="18"></line>
              <line x1="6" y1="6" x2="18" y2="18"></line>
            </svg>
          </button>
        </div>
      </div>

      <form id="activity-form" class="p-6 space-y-6">
        <div>
          <label
            for="activity-name"
            class="block text-sm font-normal text-gray-700 mb-2"
            >Activity Name</label
          >
          <select
            id="activity-name"
            name="activity-name"
            required=""
            class="w-full px-4 py-3 border border-gray-300 rounded bg-neutral text-neutral-foreground focus:outline-none focus:ring-2 focus:ring-cta-primary"
          >
            <option value="">Select an activity</option>
            <option value="meditation">Meditation</option>
            <option value="journaling">Journaling</option>
            <option value="exercise">Exercise</option>
            <option value="nature-walk">Nature Walk</option>
            <option value="creative">Creative Expression</option>
            <option value="reading">Reading</option>
            <option value="yoga">Yoga</option>
            <option value="breathing">Breathing Exercises</option>
          </select>
        </div>

        <div>
          <label
            for="activity-date"
            class="block text-sm font-normal text-gray-700 mb-2"
            >Date</label
          >
          <input
            type="date"
            id="activity-date"
            name="activity-date"
            required=""
            class="w-full px-4 py-3 border border-gray-300 rounded bg-neutral text-neutral-foreground focus:outline-none focus:ring-2 focus:ring-cta-primary"
          />
        </div>

        <div>
          <label
            for="activity-duration"
            class="block text-sm font-normal text-gray-700 mb-2"
            >Duration (minutes)</label
          >
          <input
            type="number"
            id="activity-duration"
            name="activity-duration"
            min="1"
            required=""
            class="w-full px-4 py-3 border border-gray-300 rounded bg-neutral text-neutral-foreground focus:outline-none focus:ring-2 focus:ring-cta-primary"
            placeholder="e.g., 20"
          />
        </div>

        <div>
          <label
            for="activity-mood"
            class="block text-sm font-normal text-gray-700 mb-2"
            >Mood</label
          >
          <select
            id="activity-mood"
            name="activity-mood"
            required=""
            class="w-full px-4 py-3 border border-gray-300 rounded bg-neutral text-neutral-foreground focus:outline-none focus:ring-2 focus:ring-cta-primary"
          >
            <option value="">Select your mood</option>
            <option value="great">Great</option>
            <option value="good">Good</option>
            <option value="okay">Okay</option>
            <option value="low">Low</option>
          </select>
        </div>

        <div>
          <label
            for="activity-reflection"
            class="block text-sm font-normal text-gray-700 mb-2"
            >Reflection</label
          >
          <textarea
            id="activity-reflection"
            name="activity-reflection"
            rows="6"
            required=""
            class="w-full px-4 py-3 border border-gray-300 rounded bg-neutral text-neutral-foreground focus:outline-none focus:ring-2 focus:ring-cta-primary resize-none"
            placeholder="Share your thoughts and feelings about this activity..."
          ></textarea>
        </div>

        <button
          type="submit"
          class="w-full bg-cta-primary text-cta-primary-foreground px-6 py-3 rounded font-normal text-base hover:bg-gray-900 transition-all duration-200 ease-in"
        >
          Save Activity
        </button>
      </form>
    </aside>

    <!-- Toast Notification -->
    <div id="toast" class="toast" role="alert" aria-live="polite">
      <p id="toast-message" class="text-sm font-normal"></p>
    </div>

    <script>
      // Mobile Menu
      const mobileMenuButton = document.getElementById('mobile-menu-button');
      const mobileMenu = document.getElementById('mobile-menu');
      const mobileMenuClose = document.getElementById('mobile-menu-close');

      mobileMenuButton.addEventListener('click', () => {
        mobileMenu.classList.add('active');
      });

      mobileMenuClose.addEventListener('click', () => {
        mobileMenu.classList.remove('active');
      });

      // Close mobile menu when clicking on a link
      const mobileMenuLinks = mobileMenu.querySelectorAll('a');
      mobileMenuLinks.forEach((link) => {
        link.addEventListener('click', () => {
          mobileMenu.classList.remove('active');
        });
      });

      // Drawer functionality
      const openDrawerBtn = document.getElementById('open-drawer-btn');
      const closeDrawerBtn = document.getElementById('close-drawer-btn');
      const drawer = document.getElementById('drawer');
      const drawerOverlay = document.getElementById('drawer-overlay');

      function openDrawer() {
        drawer.classList.add('active');
        drawerOverlay.classList.add('active');
        document.body.style.overflow = 'hidden';
      }

      function closeDrawer() {
        drawer.classList.remove('active');
        drawerOverlay.classList.remove('active');
        document.body.style.overflow = '';
      }

      openDrawerBtn.addEventListener('click', openDrawer);
      closeDrawerBtn.addEventListener('click', closeDrawer);
      drawerOverlay.addEventListener('click', closeDrawer);

      // Toast functionality
      const toast = document.getElementById('toast');
      const toastMessage = document.getElementById('toast-message');

      function showToast(message, duration = 3000) {
        toastMessage.textContent = message;
        toast.classList.add('active');

        setTimeout(() => {
          toast.classList.remove('active');
        }, duration);
      }

      // Form submission
      const activityForm = document.getElementById('activity-form');
      const activityFeed = document.getElementById('activity-feed');

      // Activity emoji mapping
      const activityEmojis = {
        meditation: '🧘',
        journaling: '📝',
        exercise: '💪',
        'nature-walk': '🚶',
        creative: '🎨',
        reading: '📖',
        yoga: '🧘',
        breathing: '🌬️',
      };

      // Activity name mapping
      const activityNames = {
        meditation: 'Meditation',
        journaling: 'Journaling',
        exercise: 'Exercise',
        'nature-walk': 'Nature Walk',
        creative: 'Creative Expression',
        reading: 'Reading',
        yoga: 'Yoga',
        breathing: 'Breathing Exercises',
      };

      // Mood color mapping
      const moodColors = {
        great: 'bg-success text-neutral',
        good: 'bg-success text-neutral',
        okay: 'bg-warning text-neutral',
        low: 'bg-gray-400 text-neutral',
      };

      activityForm.addEventListener('submit', (e) => {
        e.preventDefault();

        const formData = new FormData(activityForm);
        const activityType = formData.get('activity-name');
        const activityDate = formData.get('activity-date');
        const activityDuration = formData.get('activity-duration');
        const activityMood = formData.get('activity-mood');
        const activityReflection = formData.get('activity-reflection');

        // Format date
        const date = new Date(activityDate);
        const formattedDate = date.toLocaleDateString('en-US', {
          year: 'numeric',
          month: 'long',
          day: 'numeric',
        });

        // Create new activity card
        const newCard = document.createElement('article');
        newCard.className =
          'activity-card bg-neutral rounded p-6 border border-gray-200';
        newCard.innerHTML = `
        <div class="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-4 mb-4">
          <div class="flex items-start gap-4">
            <div class="text-4xl" aria-hidden="true">${activityEmojis[activityType] || '✨'}</div>
            <div>
              <h2 class="text-xl font-medium text-primary-foreground mb-1">${activityNames[activityType] || activityType}</h2>
              <p class="text-sm text-gray-600">${formattedDate} • ${activityDuration} minutes</p>
            </div>
          </div>
          <span class="${moodColors[activityMood] || 'bg-gray-400 text-neutral'} px-4 py-1 rounded-full text-sm font-normal self-start">Mood: ${activityMood.charAt(0).toUpperCase() + activityMood.slice(1)}</span>
        </div>
        <div class="bg-gray-50 border border-gray-200 rounded p-4">
          <p class="text-gray-700 text-sm leading-relaxed">${activityReflection}</p>
        </div>
      `;

        // Insert at the beginning of the feed
        activityFeed.insertBefore(newCard, activityFeed.firstChild);

        // Reset form and close drawer
        activityForm.reset();
        closeDrawer();

        // Show success toast
        showToast('Activity logged successfully!');
      });

      // Set today's date as default
      const today = new Date().toISOString().split('T')[0];
      document.getElementById('activity-date').value = today;
    </script>
  </body>
</html>
