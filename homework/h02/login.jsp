<%@ page import="my.jdbc.DBWorker" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<meta charset="UTF-8" />
	<link href="style.css" rel="stylesheet" />
</head>

<b>Menu:</b> <a href='register.jsp'>Register</a>

<body>
<%
	String login = request.getParameter("login");
	String password = request.getParameter("password");
	String remember_me = request.getParameter("remember_me");
	boolean form = true;
	boolean access = false;
	boolean error = false;
	StringBuffer errorText = new StringBuffer("<font color = 'red'><ul>");
	if (login != null) {
	    if (login.isEmpty()) {
	        error = true;
			errorText.append("<li>Login must be filled</li>");
		}

		if (password.isEmpty()) {
			error = true;
			errorText.append("<li>Password must be filled</li>");
		}

		if (!login.isEmpty() && !password.isEmpty()) {
		    DBWorker db = new DBWorker();
		    if (db.checkLogin(login, password)) {
				access = true;
			} else {
				error = true;
				errorText.append("<li>Login or password not correct or user doesn't exist</li>");
			}
			db.close();
		}
	}
	errorText.append("</ul></font>");

	if (form) {
%>
<form id="loginForm" action="" method="post">

	<div class="field">
		<label>Enter your login:</label>
		<div class="input"><input type="text" name="login" value='<%=(login != null ? login : "")%>' id="login" /></div>
	</div>

	<div class="field">
		<a href="#" id="forgot">Forgot your password?</a>
		<label>Enter your password:</label>
		<div class="input"><input type="password" name="password" value="" id="pass" /></div>
	</div>

	<% if (error) {
		out.write("<div>" + errorText.toString() + "</div>");
	}
    if (remember_me != null) {
        out.write("" + remember_me);
    }
	if (access) {

	    session.setAttribute("user",login);
        response.sendRedirect("secret.jsp");
	}
    %>

	<div class="submit">
		<button type="submit">Enter</button>
		<label id="remember"><input name="remember_me" type="checkbox" value="" <%= (remember_me != null ? "checked" : "") %>/> Remember me</label>
	</div>

</form>
<% } %>
</body>
</html>