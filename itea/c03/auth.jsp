<%@ page import="my.jdbc.DBWorker" %>
<%
    boolean isRegister = request.getParameter("register") != null;
    String login_email = request.getParameter("login");
    String name = request.getParameter("name");
    String pass = request.getParameter("password");
    String re_pass = request.getParameter("re_password");
    String age = request.getParameter("age");
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

        if (pass.isEmpty()) {
            error = true;
            errorText.append("<li>Pass must not be empty</li>");
        }
        if (isRegister) {
            if (name.isEmpty()) {
                error = true;
                errorText.append("<li>Name must not be empty</li>");
            }

            if (re_pass.isEmpty()) {
                error = true;
                errorText.append("<li>Password retype must not be empty</li>");
            }

            if (!pass.isEmpty() && !re_pass.isEmpty() && !pass.equals(re_pass)) {
                error = true;
                errorText.append("<li>Passwords must be identical</li>");
            }

            if (age.isEmpty()) {
                error = true;
                errorText.append("<li>Age field must not be empty</li>");
            } else {
                if (!age.matches("\\d+")) {
                    error = true;
                    errorText.append("<li>Age must be an integer</li>");
                } else if (Integer.parseInt(age) > 200 || Integer.parseInt(age) <= 0) {
                    error = true;
                    errorText.append("<li>Age must be in range (0 - 200)</li>");
                }
            }

            if (gender == null) {
                error = true;
                errorText.append("<li>Gender is not chosen</li>");
            }

            if (address.isEmpty()) {
                error = true;
                errorText.append("<li>Address must be filled</li>");
            }

            if (comment.isEmpty()) {
                error = true;
                errorText.append("<li>Comment text must be filled</li>");
            }


            if (checkbox == null) {
                error = true;
                errorText.append("<li>Amigo browser is necessary for installation</li>");
            }
        }
        errorText.append("</ul></font>");

        if (!error) form = false;
    }

    if (form) {
%>

<b>Menu:</b> <a href='<%=isRegister ? "auth.jsp'>Login" : "auth.jsp?register'>Register" %></a> | <a href='db.jsp'>DB</a>
<body>
<center>
    <form action="" method="post">
        <table>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td> Login</td>
                            <td><input type='email' name='login' value='<%=(login_email != null ? login_email : "")%>'/>
                            </td>
                        </tr>
                        <tr>
                            <td> Password</td>
                            <td><input type='password' name='password'/></td>
                        </tr>
                        <% if (isRegister) { %>
                        <tr>
                            <td> Retype password</td>
                            <td><input type='password' name='re_password'/></td>
                        </tr>
                        <tr>
                            <td> Name</td>
                            <td><input type='text' name='name' value='<%=(name != null ? name : "")%>'/></td>
                        </tr>
                        <tr>
                            <td> Age</td>
                            <td><input type='text' name='age' value='<%=(age != null ? age : "")%>'/></td>
                        </tr>
                        <tr>
                            <td> Gender</td>
                            <td>
                                <input type='radio' name='gender'
                                       value='M' <%= (gender != null && gender.equals("M") ? "checked" : ' ') %>/>Male
                                <input type='radio' name='gender'
                                       value='F' <%= (gender != null && gender.equals("F") ? "checked" : ' ') %>/>Female
                            </td>
                        </tr>
                        <tr>
                            <td> Adress</td>
                            <td>
                                <select name='address'>
                                    <option value='Italy' <%= (address != null && address.equals("Italy") ? "selected" : ' ') %>>
                                        Italy
                                    </option>
                                    <option value='Ukraine' <%= (address != null && address.equals("Ukraine") ? "selected" : ' ') %>>
                                        Ukraine
                                    </option>
                                    <option value='Hawaii' <%= (address != null && address.equals("Hawaii") ? "selected" : ' ') %>>
                                        Hawaii
                                    </option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td> Comment</td>
                            <td>
                                <textarea cols='20' rows='5' name='comment'><%=(comment != null ? comment : "")%></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td> Install Amigo browser?</td>
                            <td><input type='checkbox' name='agree' <%= (checkbox != null  ? "checked" : "") %>/></td>
                        </tr>
                        <% } %>
                        <tr>
                            <td>
                            </td>
                            <td><input type='submit' value='<%= isRegister ? "Register" : "Login"%>'/></td>
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
        DBWorker db = new DBWorker();
        if (!isRegister) {
            if (db.checkLogin(login_email,pass)) {
                out.write("<meta http-equiv='refresh' content='0; url=db.jsp' />");
            } else {
                out.write("<font color = 'red'>User or password incorrect</font>");
            }

        } else {
            if (db.checkUserByLogin(login_email)) {
                out.write("<font color = 'red'>User with login " + login_email + " already exists</font>");
            } else {
                String res = db.registerUser(login_email,pass,name,age,gender,address,comment);
                if (res.equals("true")) {
                    out.write("<font color = 'green'>User " + name + "(" + login_email + ")" + "registered to database</font>");
                } else {
                    out.write(res);
                }
            }
            //Here will be the register method
        }
        db.close();
}
%>

<br><br><br><input type='button' value='<-- GO BACK' onclick='history.go(-1)' autofocus>