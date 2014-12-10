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
<h3>Persons</h3>
<c:choose>
	<c:when test="${fn:length(persons) gt 0}">
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
			<c:forEach var="person" items="${persons}">
				<tr class="${person.age gt 70 ? 'senior' : 'junior'}">
					<td><c:out value="${person.id}"/></td>
					<td>${person.name}</td>
					<td>${person.lastName}</td>
					<td>${person.address}</td>
					<td>${person.phoneHome}</td>
					<td>${person.phoneCell}</td>
					<td>${person.phoneOffice}</td>
					<td>${person.eMail}</td>
					<td>${person.occupation}</td>
					<td>${person.age}</td>
					<td>${person.phoneHome}</td>
					<td><input type="submit" /></td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>No persons</c:otherwise>
</c:choose>
<mytags:footer/>

</body>
</html>


