<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<c:choose>
	<c:when test="${fn:length(jobList) gt 0}">
		<table border=1>
			<tr>
				<th>id</th>
				<th>Name</th>
				<th>lastName</th>
				<th>address</th>
				<th>phoneHome</th>
				<th>phoneCell</th>								
				<th>phoneOffice</th>
				<th>eMail</th>
				<th>occupation</th>
				<th>age</th>
				<th>edit</th>
			</tr>
			<c:forEach var="client" items="${jobList}">
					<td>${job.client.getName()}</td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>No clients</c:otherwise>
</c:choose>

</body>
</html>