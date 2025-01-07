<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .header {
        padding: 0.8rem 2rem;
        background: rgba(0,0,0,0.2);
        backdrop-filter: blur(10px);
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: fixed;
        width: 100%;
        top: 0;
        z-index: -100;
    }

    .left-section {
        display: flex;
        align-items: center;
        gap: 1.5rem;
    }

    .back-btn {
        color: var(--text-primary);
        background: transparent;
        border: none;
        font-size: 1.5rem;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        padding: 0.5rem;
        border-radius: 50%;
        transition: all 0.3s ease;
    }

    .back-btn:hover {
        background: rgba(255, 255, 255, 0.1);
        transform: translateX(-3px);
    }

    .back-btn i {
        font-size: 1.2rem;
    }

    .logo {
        font-size: 1.8rem;
        font-weight: 700;
        color: var(--text-primary);
        text-decoration: none;
        letter-spacing: 1px;
    }

    .user-controls {
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .logout-btn {
        background: #dc2626;
        color: white;
        border: none;
        padding: 0.5rem 1.5rem;
        border-radius: 25px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .logout-btn:hover {
        background: #ef4444;
        transform: var(--hover-transform);
    }

    @media (max-width: 768px) {
        .header {
            padding: 1rem;
        }

        .logo {
            font-size: 1.5rem;
        }
        
        .back-btn {
            font-size: 1.2rem;
        }
    }
</style>

<header class="header">
    <div class="left-section">
        <button onclick="goBack()" class="back-btn" title="Go Back">
            <i class="fas fa-arrow-left"></i>
        </button>
        <a href="#" class="logo">QuizWeb</a>
    </div>
    <div class="user-controls">
        <span>Hello, <%= session.getAttribute("fname") %></span>
        <form action="logout" method="get" style="display: inline;">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>
</header>

<script>
    function goBack() {
        window.history.back();
    }

    // Show/hide back button based on navigation history
    window.addEventListener('load', function() {
        const backBtn = document.querySelector('.back-btn');
        if (window.history.length <= 1) {
            backBtn.style.display = 'none';
        }
    });
</script>