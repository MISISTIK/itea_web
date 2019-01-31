<%
    String msg = "";
    String str_size = request.getParameter("size");
    int size = 0;
    boolean form = true;
    if (str_size != null && str_size.length() > 0) {
        try {
            size = Integer.parseInt(str_size);
            if (size > 0 && size <= 15 ) {
                form = false;
            } else {
                out.write("<center><h1><font color='red'>Must be between 1 and 15</font></h1></center>");
            }
        } catch (Exception e) {
            out.write("<center><h1><font color='red'>Not a number</font></h1></center>");
        }
    }
if (form) {
%>
<body>

<form action=''>
    <table align='center'>
        <tr width='100'>
            <td>
                <input type='text' name='size' placeholder='Input table size:' autofocus/>
            </td>
        </tr>
        <tr width='100'>
            <td>
                <input type='submit' value='SEND'>
            </td>
        </tr>
    </table>
</form>
<br>
<br>
<br>

</body>

<%
    } else {
        out.write("<table align=\'center\' border=\'1\'>");
        int index = 0;
        String[] img = {"whiskey.jpg","vodka.jpg","jager.jpg"};
        int imgcount = img.length;
        for (int i = 0; i < size;i++) {
            out.write("<tr>");
            for (int j = 0; j < size; j++) {
                out.write("<td><img src='img/" +img[index]+ "' width='100' height='100'></td>" );
                index++;
                if (index >= 3) {
                    index = 0;
                }
            }
            out.write("</tr>");
        }
        out.write("</table>");
%>
<br><br><br>
<center>
<input type="button" value="<-- GO BACK" onclick="history.go(-1)" autofocus>
</center>
<%
    }
%>