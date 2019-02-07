<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

myVar = ${requestScope.myVar}<br>
login = ${param.login} <br>
password = ${param.password} <br>
<hr>

<c:forEach items="${requestScope.list}" var="var">
    ${var}<br>
</c:forEach>
<hr>
<c:out value="${requestScope.dog.name}"/>