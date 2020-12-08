<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
            
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	int empId=900;

%>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/avizva?useSSL=false&autoreconnect=true" user="root" password="root"/>

<c:set var="id" value="1001"></c:set>

<c:set var="name" value="Jatin"></c:set>

<c:set var="age" value="24"></c:set>
<sql:transaction dataSource="${db}" isolation="READ_COMMITTED|READ_UNCOMMITTED|REPEATBALE_READ|SERIALIZABLE">
<sql:update var="count">
	insert into employee values(?,?,?);
	
	<sql:param value="<%=empId%>"></sql:param>
	<sql:param value="${name}"></sql:param>
	<sql:param value="${age}"></sql:param>	
</sql:update>

<sql:update var="count">
	insert into employee values(?,?,?);
	
	<sql:param value="${id}>"></sql:param>
	<sql:param value="${name}"></sql:param>
	<sql:param value="${age}"></sql:param>	
</sql:update>
</sql:transaction>

<c:if test="${count>0}">
	Inserted Successfully!!
</c:if>


<sql:query dataSource="${db}" var="rs">
	select * from employee;
</sql:query>

<table border="1">
<tr><th>Id</th><th>Name</th><th>Age</th>
</tr>
<c:forEach var="res" items="${rs.rows}">
<tr>
<td><c:out value="${res.id}"/></td>
<td><c:out value="${res.name}"/></td>
<td><c:out value="${res.age}"/></td>
</tr>
</c:forEach>

</table>
</body>
</html>