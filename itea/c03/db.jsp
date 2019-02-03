<%@ page import="my.jdbc.DBWorker" %>

<%
    DBWorker db = new DBWorker();
    out.write(db.getUsers());
    db.close();
%>