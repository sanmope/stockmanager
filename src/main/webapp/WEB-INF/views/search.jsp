<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytags"%>

<html>
<head>

<mytags:style /> 
<mytags:jquery />


</head>
<body >
<mytags:menu/>
<h3 >Search</h3>
<!-- search for client -->
<div id="mainContainer">
<%-- 	<form  method="post" action="searchClient.htm" >
			 <tr> 
				 <label for="name">Name:</label> 
				 <input type="text" name="name" /><br />
			 </tr>
			 <input style ='float: left; padding: 5px;' class="btnExample" type="submit" value="Buscar">
	</form> --%>
	
	<c:choose>
		<c:when test="${fn:length(clients) gt 0}">
			<div> 
				<table id="myTable" class= "table table-stripped table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Address</th>
							<th>Phone 1</th>
							<th>Phone2</th>
							<th>Phone 3</th>
							<th>Occupation</th>
							<th>Age</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="5">
							<div> 
							</div>
						</tr>
					</tfoot>
					<tbody>
						<tr>
						<c:forEach var="client" items="${clients}">
							<td><c:out value="${client.id}"/></td>
							<td>${client.name} ${client.lastName}</td>
							<td>${client.address}</td>
							<td>${client.phoneHome}</td>
							<td>${client.phoneCell}</td>
							<td>${client.phoneOffice}</td>
							<td>${client.occupation}</td>
							<td>${client.age}</td>
														
						</tr>	
						</c:forEach>
					</tbody>
				</table>
				</div>
		</c:when>
		<c:otherwise>No clients</c:otherwise>
	</c:choose>
</div>


<div id="mainContainer">
<%-- 	<form  method="post" action="searchProduct.htm" >
			 <tr> 
				 <label for="name">Name:</label> 
				 <input type="text" name="name" /><br />
			 </tr>
			 <input style ='float: left; padding: 5px;' class="btnExample" type="submit" value="Buscar">
	</form> --%>
<!-- search for product -->
	<c:choose>
		<c:when test="${fn:length(products) gt 0}">
			<div> 
				<table id="myTable" class= "table table-stripped table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>cost</th>
							<th>price</th>
							<th>quantity</th>
							<th>description</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="5">
							<div> 
							</div>
						</tr>
					</tfoot>
					<tbody>
						<tr>
						<c:forEach var="product" items="${products}">
							<td><c:out value="${product.id}"/></td>
							<td>${product.name}</td>
							<td>${product.cost}</td>
							<td>${product.price}</td>
							<td>${product.quantity}</td>
							<td>${product.description}</td>
														
						</tr>	
						</c:forEach>
					</tbody>
				</table>
				</div>
		</c:when>
		<c:otherwise>No products</c:otherwise>
	</c:choose>
</div>
	
<mytags:footer/>



</body>
</html>
<!DOCTYPE>

