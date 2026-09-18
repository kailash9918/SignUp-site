<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Sign Up & Sign In</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(
                135deg,
                #667eea,
                #764ba2
            );
        }

        .container {
            width: 400px;
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .input-box {
            margin-bottom: 18px;
        }

        .input-box label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
            color: #444;
        }

        .input-box input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 7px;
            font-size: 15px;
        }

        .btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 7px;
            background: #667eea;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn:hover {
            background: #5568d8;
        }

        .switch {
            text-align: center;
            margin-top: 20px;
            color: #555;
        }

        .switch a {
            color: #667eea;
            font-weight: bold;
            cursor: pointer;
        }

        .message {
            text-align: center;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .error {
            color: red;
        }

        .success {
            color: green;
        }

        #signup {
            display: none;
        }

    </style>

</head>

<body>

<div class="container">

    <!-- SIGN UP -->

    <div id="signup">

        <h2>Create Account</h2>

        <%
            String error = request.getParameter("error");
            String registered = request.getParameter("registered");

            if ("exists".equals(error)) {
        %>

            <div class="message error">
                Email already registered!
            </div>

        <%
            }

            if ("success".equals(registered)) {
        %>

            <div class="message success">
                Registration successful! Please Sign In.
            </div>

        <%
            }

            if ("failed".equals(error)) {
        %>

            <div class="message error">
                Registration failed!
            </div>

        <%
            }
        %>

        <form action="register" method="post">

            <div class="input-box">

                <label>Name</label>

                <input
                    type="text"
                    name="name"
                    placeholder="Enter your name"
                    required
                >

            </div>

            <div class="input-box">

                <label>Email</label>

                <input
                    type="email"
                    name="email"
                    placeholder="Enter your email"
                    required
                >

            </div>

            <div class="input-box">

                <label>Password</label>

                <input
                    type="password"
                    name="password"
                    placeholder="Enter password"
                    required
                >

            </div>

            <button type="submit" class="btn">
                Sign Up
            </button>

        </form>

        <div class="switch">

            Already have an account?

            <a onclick="showLogin()">
                Sign In
            </a>

        </div>

    </div>


    <!-- SIGN IN -->

    <div id="signin">

        <h2>Welcome Back</h2>

        <%
            String login = request.getParameter("login");

            if ("failed".equals(login)) {
        %>

            <div class="message error">
                Invalid email or password!
            </div>

        <%
            }
        %>

        <form action="login" method="post">

            <div class="input-box">

                <label>Email</label>

                <input
                    type="email"
                    name="email"
                    placeholder="Enter your email"
                    required
                >

            </div>

            <div class="input-box">

                <label>Password</label>

                <input
                    type="password"
                    name="password"
                    placeholder="Enter password"
                    required
                >

            </div>

            <button type="submit" class="btn">
                Sign In
            </button>

        </form>

        <div class="switch">

            Don't have an account?

            <a onclick="showSignup()">
                Sign Up
            </a>

        </div>

    </div>

</div>


<script>

    function showSignup() {

        document.getElementById("signin").style.display = "none";

        document.getElementById("signup").style.display = "block";
    }


    function showLogin() {

        document.getElementById("signup").style.display = "none";

        document.getElementById("signin").style.display = "block";
    }


    const params =
        new URLSearchParams(window.location.search);


    if (
        params.get("error") === "exists" ||
        params.get("error") === "failed" ||
        params.get("registered") === "success"
    ) {

        showSignup();

    } else {

        showLogin();

    }

</script>

</body>

</html>