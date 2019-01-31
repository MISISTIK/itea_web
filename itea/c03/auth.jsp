<%
    String login_email = request.getParameter("login");
    String name = request.getParameter("name");
    String pass = request.getParameter("password");
    String re_pass = request.getParameter("password");
    String gender = request.getParameter("gender");
    String address = request.getParameter("address");
    String comment = request.getParameter("comment");
    String checkbox = request.getParameter("agree");
    String br = "<br>";
    boolean error = false;
    boolean form = true;


    StringBuffer errorText = new StringBuffer("<font color = 'red'><ul>");
    if (login_email != null) {
        if (login_email.isEmpty()) {
            error = true;
            errorText.append("<li>Login(email) must not be empty</li>");
        }

        if (name.isEmpty()) {
            error = true;
            errorText.append("<li>Name must not be empty</li>");
        }

        if (pass.isEmpty()) {
            error = true;
            errorText.append("<li>Pass must not be empty</li>");
        }

        if (re_pass.isEmpty()) {
            error = true;
            errorText.append("<li>Password retype must not be empty</li>");
        }

        if (!pass.isEmpty() && !re_pass.isEmpty() && !pass.equals(re_pass)) {
            error = true;
            errorText.append("<li>Password retype must not be empty</li>");
        }


        if (!error) form = false;
    }
        errorText.append("</ul></font>");

    if (form) {
%>

Menu: <a href='auth.jsp'>Auth</a>------------<a href='db.jsp'>DB</a>
<body>
<center>
    <form action="" method='post'>
        <table>
            <tr><td>
            <table>
                <tr>
                    <td> Login</td>
                    <td><input type='email' name='login' value='<%=(login_email != null ? login_email : "")%>'/></td>
                </tr>
                <tr>
                    <td> Name</td>
                    <td><input type='text' name='name' value='<%=(name != null ? name : "")%>'/></td>
                </tr>
                <tr>
                    <td> Password</td>
                    <td><input type='password' name='password' /></td>
                </tr>
                <tr>
                    <td> Retype password</td>
                    <td><input type='password' name='re_password' /></td>
                </tr>
                <tr>
                    <td> Gender</td>
                    <td>
                        <input type='radio' name='gender' value='M' <%= (gender!=null && gender.equals("M") ? "checked" : ' ') %>/>Male
                        <input type='radio' name='gender' value='F' <%= (gender!=null && gender.equals("F") ? "checked" : ' ') %>/>Female
                    </td>
                </tr>
                <tr>
                    <td> Adress</td>
                    <td>
                        <select name='address'>
                            <option value='Italy' <%= (address!=null && address.equals("Italy") ? "selected" : ' ') %>>Italy</option>
                            <option value='Ukraine' <%= (address!=null && address.equals("Ukraine") ? "selected" : ' ') %>>Ukraine</option>
                            <option value='Hawaii' <%= (address!=null && address.equals("Hawaii") ? "selected" : ' ') %>>Hawaii</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td> Comment</td>
                    <td>
                        <textarea cols='20' rows='5' name='comment'></textarea>
                    </td>
                </tr>
                <tr>
                    <td> Checkbox</td>
                    <td><input type='checkbox' name='agree'/></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td><input type='submit'/></td>
                </tr>
            </table>
            </td>
                <td>
                    <%-- Errors--%>
                    <%
                    // Errors scriplet
                        if (error) {
                            out.write(errorText.toString());
                        }
                    %>
                </td>
            </tr>
        </table>
    </form>
</center>
</body>

<% } else {
        out.write("form is valid");
}
%>

<br><br><br><input type='button'value='<-- GO BACK' onclick='history.go(-1)' autofocus>