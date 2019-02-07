<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String[] arr = {"aa", "bb", "cc"};
    pageContext.setAttribute("MyArr",arr);
%>

<c:forEach var = "i" begin = "0" end = "2">
    Item <c:out value = "${MyArr[i]}"/><p>
</c:forEach>
<hr>
<c:forEach var="str" items = "${MyArr}">
    ${str}
</c:forEach>

<br>
Param=${param['myVar']}<br>
Param=${param.myVar}<br>
<hr>
<jsp:useBean id="dog" class="my.beans.Dog"/>
<jsp:setProperty name="dog" property="name" value="Susleg"/>
Name=${dog.name}
