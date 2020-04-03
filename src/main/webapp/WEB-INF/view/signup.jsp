<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>게시판</title>
</head>
<body>

<div id="root">
    <header>
        <h1>Sign Up</h1>
    </header>
    <hr />

    <nav>
        Sign up
    </nav>
    <hr />

    <section id="container">
        <form role="form" method="post" action="/addUser">
            <table>
                <tbody>
                <tr>
                    <label for="name">name</label><textarea id="name" name="name"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="pwd">password</label><textarea id="pwd" name="pwd" ></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="email">email</label><textarea id="email" name="email" ></textarea>
                    </td>
                </tr>
                <td>
                    <button type="submit">submit</button>
                </td>
                </tr>
                </tbody>
            </table>
        </form>
    </section>
    <hr />
</div>
</body>
</html>