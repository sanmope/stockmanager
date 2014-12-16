<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytags"%>
<html>
<head>
<mytags:jquery />
<mytags:style />
</head>
<body>
<mytags:menu/>
<h3>Clients</h3>
<c:choose>
	<c:when test="${fn:length(clients) gt 0}">
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
			<c:forEach var="client" items="${clients}">
				<tr class="${client.age gt 70 ? 'senior' : 'junior'}">
					<td><c:out value="${client.id}"/></td>
					<td>${client.name}</td>
					<td>${client.lastName}</td>
					<td>${client.address}</td>
					<td>${client.phoneHome}</td>
					<td>${client.phoneCell}</td>
					<td>${client.phoneOffice}</td>
					<td>${client.eMail}</td>
					<td>${client.occupation}</td>
					<td>${client.age}</td>
					<td>${client.phoneHome}</td>
					<td><input type="submit" /></td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>No clients</c:otherwise>
</c:choose>
<mytags:footer/>

</body>
</html>


