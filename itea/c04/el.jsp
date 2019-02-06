<%
    if (request.getParameter("logout") != null) {
        session.invalidate();
        session = request.getSession();
    }
    String login = request.getParameter("login");

    if (login != null) {
        if (login.equals("admin")) {
            session.setAttribute("user","Alex");
        } else {
            out.write("error<br>");
        }


    }
    out.write("<hr>" + session.getAttribute("user") + "<hr>");
%>

<form action='el.jsp' method='post'>
<input type='text' name='login'/>
<input type='submit' name='go'/>
</form>


<%
if (session.getAttribute("user") != null) {
%>
<form action="" method='post'>
    <input type='hidden' name='logout'/>
    <input type='submit' value='logout'/>
</form>
<%
}
%>

<a href="secret.jsp">To secret info</a>

<%--<a href="?logout"><button>Logout</button></a>--%>