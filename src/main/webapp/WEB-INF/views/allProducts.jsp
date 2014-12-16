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
<h3>Products</h3>
<c:choose>
	<c:when test="${fn:length(products) gt 0}">
		<table border=1>
			<tr>
				<th>Name</th>
				<th>cost</th>
				<th>price</th>
				<th>quantity</th>
				<th>description</th>
				
			</tr>
			<c:forEach var="product" items="${products}">
					<td><c:out value="${product.name}"/></td>
					<td>${product.cost}</td>
					<td>${product.price}</td>
					<td>${product.quantity}</td>
					<td>${product.description}</td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>No products</c:otherwise>
</c:choose>
<mytags:footer/>
</body>
</html>

	