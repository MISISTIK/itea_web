<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:set var="name" value="max"/>
<c:set var="salary" value="200"/>

My name is ${name}

<c:if test="${salary > 2000}"> OK </c:if>
<hr>
<c:choose>
    <c:when test="${salary < 500}">
        You are nishebrod
    </c:when>
    <c:when test="${(salary > 500) && (salary < 1000)}">
        You are junior
    </c:when>
    <c:otherwise>
        You are middle
    </c:otherwise>
</c:choose>