<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
         
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<c:out value="Welcome to JSTL"></c:out><br>

<c:set var="data" value="${600}" scope="SESSION"></c:set>

<c:out value="${data}"></c:out><br>

<c:if test="${data>500}">

	<c:out value="${data} is greater than 500"></c:out>

</c:if>
<br>
<c:choose>

	<c:when test="${data>500}">
		<c:out value="${data}  is greater than 500"></c:out>
	</c:when>
	<c:when test="${data>400}">
		<c:out value="${data} is greater than 400"></c:out>
	</c:when>
	<c:otherwise>
		<c:out value="${data}"></c:out>
	</c:otherwise>
</c:choose>


<c:remove var="data" scope="SESSION"></c:remove><br>
<c:out value="${data}"></c:out><br>
<c:forEach var="i" begin="1" end="5" step="2">
	<c:out value="${i}"></c:out><br>
</c:forEach>
<br>
<c:redirect url="https://www.google.com"></c:redirect>

<c:forTokens var="input" items="Avizva@Batch@ 2020" delims="@ " begin="1" end="2">
	<c:out value="${input}"></c:out><br>
</c:forTokens>

<br>
<!-- import works as include -->
<c:import url="https://www.google.com"></c:import>

<c:url var="myURL" value="profile.jsp">
	<c:param name="driver" value="avizva"></c:param>
	<c:param name="dev" value="BATCH2020"></c:param>
</c:url>
<c:out value="${myURL}"></c:out><br>
<!-- profile.jsp?driver=avizva&dev=BATCH2020 -->
<a href='<c:out value="${myURL}"></c:out>'>VISIT</a>


<br>

<c:catch var="excep">
	<%
		
		int i=10/0;
	%>
</c:catch>

<c:if test="${excep!=null}">
	${excep}<br>java.lang.ArithemeticException:/ by zero
	${excep.message}<br>/ by zero
	
	
</c:if>











</body>
</html>