<%
if (session.getAttribute("user") != null) {
    if (request.getParameter("logout") != null) {
        session.invalidate();
        session = request.getSession();
        response.sendRedirect("login.jsp");
    }
%>
SECRET INFO
<a href="?logout"><button>Logout</button></a>
<%
    } else {
        out.write("ACCESS DENIED<br>");
        out.write("<a href='login.jsp'><button>To Login page</button></a>");
    }
%>
