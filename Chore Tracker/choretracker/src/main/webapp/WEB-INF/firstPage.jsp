<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Chore Tracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #ffecd2, #fcb69f);
            color: #333;
            animation: fadeIn 1s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 40px;
            background: rgba(0,0,0,0.5);
            color: white;
            position: fixed;
            width: 100%;
            top: 0;
        }

        .navbar .logo {
            font-size: 22px;
            font-weight: bold;
        }

        .navbar ul {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
            padding: 0;
        }

        .navbar ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .navbar ul li a:hover {
            color: #ffeebc;
        }

        .hero {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding-top: 60px;
        }

        .hero h1 {
            font-size: 50px;
            color: white;
        }

        .hero p {
            font-size: 18px;
            color: white;
        }

        .btn {
            margin-top: 20px;
            padding: 10px 25px;
            background: #ff7e5f;
            color: white;
            border: none;
            border-radius: 20px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn:hover {
            background: #feb47b;
        }

        section {
            padding: 60px 20px;
            max-width: 1000px;
            margin: 0 auto;
        }

        section h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
            color: #333;
        }

        section p {
            text-align: center;
            font-size: 16px;
        }

        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .gallery img {
            width: 100%;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .contact-form form {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 20px;
        }

        .contact-form input,
        .contact-form textarea {
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        .contact-form button {
            padding: 10px;
            background: #ff7e5f;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }

        .contact-form button:hover {
            background: #feb47b;
        }

        footer {
            text-align: center;
            padding: 15px;
            font-size: 14px;
            color: white;
            background: rgba(0,0,0,0.5);
        }

        @media (max-width: 768px) {
            .hero h1 {
                font-size: 36px;
            }

            .hero p {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <div class="logo">🧹 Chore Tracker</div>
        <ul>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
    </div>

    <section class="hero">
        <h1>Welcome to Chore Tracker</h1>
        <p>Track, manage, and conquer your household chores beautifully.</p>
        <a href="/login" class="btn">Get Started</a>
    </section>

    <section id="about">
        <h2>About the Website</h2>
        <p>
            Chore Tracker is a simple yet robust web application built with Java, Spring Boot, and MySQL. Users can sign up, log in, and manage tasks collaboratively.
            With features like chore creation, detailed views, editing, and cancellation, it helps you stay organized.
        </p>
    </section>

    <section id="gallery" style="padding: 3rem 0; background-color: #f9fafb;">
        <div style="max-width: 1200px; margin: 0 auto; padding: 0 1rem;">
            <h2 style="font-size: 1.875rem; font-weight: bold; text-align: center; margin-bottom: 2rem; color: #4f46e5;">
                Showcase
            </h2>
            
            <div style="display: flex; flex-wrap: wrap; justify-content: center; gap: 1.5rem;">
                <div style="display: flex; align-items: center; justify-content: center; 
                            background: white; padding: 1rem; border-radius: 0.5rem; 
                            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1),0 2px 4px -1px rgba(0,0,0,0.06);
                            transition: all 0.3s ease;">
                    <img src="https://img.icons8.com/fluency/96/000000/broom.png" 
                         alt="Cleaning" 
                         style="height: 5rem; width: 5rem; object-fit: contain;">
                </div>
                
                <div style="display: flex; align-items: center; justify-content: center; 
                            background: white; padding: 1rem; border-radius: 0.5rem; 
                            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1),0 2px 4px -1px rgba(0,0,0,0.06);
                            transition: all 0.3s ease;">
                    <img src="https://img.icons8.com/color/96/000000/to-do.png" 
                         alt="Chores" 
                         style="height: 5rem; width: 5rem; object-fit: contain;">
                </div>
                
                <div style="display: flex; align-items: center; justify-content: center; 
                            background: white; padding: 1rem; border-radius: 0.5rem; 
                            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1),0 2px 4px -1px rgba(0,0,0,0.06);
                            transition: all 0.3s ease;">
                    <img src="https://img.icons8.com/color/96/000000/home.png" 
                         alt="Housework" 
                         style="height: 5rem; width: 5rem; object-fit: contain;">
                </div>
                
                <div style="display: flex; align-items: center; justify-content: center; 
                            background: white; padding: 1rem; border-radius: 0.5rem; 
                            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1),0 2px 4px -1px rgba(0,0,0,0.06);
                            transition: all 0.3s ease;">
                    <img src="https://img.icons8.com/color/96/000000/washing-machine.png" 
                         alt="Laundry" 
                         style="height: 5rem; width: 5rem; object-fit: contain;">
                </div>
            </div>
        </div>
    </section>
    <section id="contact" class="contact-form">
        <h2>Contact Me</h2>
        <form action="SendMessageServlet" method="post">
            <input type="text" name="name" placeholder="Your name" required>
            <input type="email" name="email" placeholder="Your email" required>
            <textarea name="message" placeholder="Your message" rows="4" required></textarea>
            <button type="submit">Send Message</button>
        </form>
    </section>

    <footer>
        © 2025 Chore Tracker | Designed by Malek 😇
    </footer>
</body>
</html>
