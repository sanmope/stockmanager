<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytags"%>
<html>
<head>
<mytags:jquery />
<mytags:style />
</head>
<body align="right">
<h4 >New Product</h4>
	<c:if test="${errors.errorCount gt 0}">
		Errors!<br/>
		<c:forEach var="error" items="${errors.allErrors}">
			<span class="error">${error.objectName} ${error.code}</span>
			<br />
		</c:forEach>
	</c:if>
	<form method="post" action="newProduct.htm">
	  <label for="name">Name:</label>
	  <input type="text" name="name" /><br />
	  <label for="name">barcode:</label>
	  <input type="text" name="barcode" /><br />
	  <label for="name">price:</label>
	  <input type="text" name="price" /><br />
	  <label for="name">cost:</label>
	  <input type="text" name="cost" /><br />
	  <label for="name">description:</label>
	  <input type="text" name="description" /><br />
	  <label for="name">Quantity:</label>
	  <input type="text" name="quantity" /><br />
	  <input type="submit" /><input type="reset" />
	  
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
	</c:choose>
  
</body>
</html>

