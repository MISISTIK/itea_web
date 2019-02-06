<%
if (session.getAttribute("user") != null) {
%> SECRET INFO <%
    } else {
        out.write("ACCESS DENIED");
    }
%>
