<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>QuizWeb - Select Difficulty</title>
    <style>
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes floating {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', 'Arial', sans-serif;
        }

        body {
            background: linear-gradient(-45deg, #1a1b2e, #252547, #2d2a54, #1f1f3a);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: #fff;
            padding: 20px;
        }

        .difficulty-container {
            background: rgba(37, 37, 71, 0.9);
            backdrop-filter: blur(10px);
            padding: 4rem;
            border-radius: 1.5rem;
            text-align: center;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2),
                        0 0 0 1px rgba(255, 255, 255, 0.05);
            max-width: 550px;
            width: 90%;
            animation: fadeIn 1s ease-out;
            position: relative;
            overflow: hidden;
        }

        .difficulty-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            background: linear-gradient(90deg, #6366F1, #8B5CF6, #6366F1);
            background-size: 200% 100%;
            animation: gradientBG 3s linear infinite;
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            background: linear-gradient(90deg, #8B5CF6, #6366F1);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            font-weight: 700;
        }

        .difficulty-option {
            background: rgba(255, 255, 255, 0.05);
            margin: 15px 0;
            padding: 20px;
            border-radius: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .difficulty-option:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateY(-2px);
        }

        .difficulty-option input[type="radio"] {
            display: none;
        }

        .difficulty-option label {
            display: block;
            cursor: pointer;
            font-size: 1.2rem;
            font-weight: 500;
            color: #fff;
        }

        .random-options {
            margin-top: 20px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            display: none;
        }

        select {
            background: rgba(255, 255, 255, 0.1);
            border: none;
            padding: 10px 20px;
            border-radius: 10px;
            color: white;
            font-size: 1rem;
            margin-top: 10px;
            width: 100%;
            cursor: pointer;
        }

        select option {
            background: #252547;
            color: white;
        }

        .btn {
            background: linear-gradient(45deg, #6366F1, #8B5CF6);
            color: white;
            padding: 1rem 2.5rem;
            border-radius: 999px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s;
            border: none;
            cursor: pointer;
            margin-top: 30px;
            display: inline-block;
            font-size: 1.1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(99, 102, 241, 0.3);
        }

        @media (max-width: 768px) {
            .difficulty-container {
                padding: 3rem 2rem;
            }

            h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <div class="difficulty-container">
        <h1>Select Difficulty</h1>
        <form action="difficulty" method="post">
        <%
    String quizId = request.getAttribute("quizId") != null ? 
                    request.getAttribute("quizId").toString() : 
                    request.getParameter("quizId");
    %>
            <input type="hidden" name="quizId" value="<%= request.getAttribute("quizId") %>">
            
            <div class="difficulty-option">
                <input type="radio" name="difficulty" value="easy" id="easy">
                <label for="easy">Easy</label>
            </div>
            
            <div class="difficulty-option">
                <input type="radio" name="difficulty" value="medium" id="medium">
                <label for="medium">Medium</label>
            </div>
            
            <div class="difficulty-option">
                <input type="radio" name="difficulty" value="hard" id="hard">
                <label for="hard">Hard</label>
            </div>
            
            <div class="difficulty-option">
                <input type="radio" name="difficulty" value="random" id="random">
                <label for="random">Random Mix</label>
            </div>
            
            <div class="random-options" id="randomOptions">
                <select name="randomCount" id="randomCount">
                    <option value="5">5 Questions</option>
                    <option value="3">3 Questions</option>
                    <option value="5">5 Questions</option>
                </select>
            </div>
            <button type="submit" class="btn">Start Quiz</button>
        </form>
    </div>

    <script>
        document.getElementById('random').addEventListener('change', function() {
            document.getElementById('randomOptions').style.display = 
                this.checked ? 'block' : 'none';
        });

        // Add visual feedback for selected difficulty
        document.querySelectorAll('.difficulty-option').forEach(option => {
            option.addEventListener('click', function() {
                // Remove active class from all options
                document.querySelectorAll('.difficulty-option').forEach(opt => {
                    opt.style.background = 'rgba(255, 255, 255, 0.05)';
                });
                // Add active class to selected option
                this.style.background = 'rgba(255, 255, 255, 0.15)';
                // Check the radio button
                this.querySelector('input[type="radio"]').checked = true;
            });
        });
    </script>
</body>
</html>