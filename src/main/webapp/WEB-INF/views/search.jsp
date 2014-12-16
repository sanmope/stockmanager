<!DOCTYPE html>
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
<div id="mainContainer">
	<form  method="post" action="search.htm" >
			 <label for="name">Name:</label>
			 <input type="text" name="name" /><br />
			 <input style ='float: left; padding: 5px;' class="btnExample" type="submit" value="Buscar">
	</form>
	
	<c:choose>
		<c:when test="${fn:length(products) gt 0}">
			<div> <!-- class="datagrid"> -->
				<table id="myTable" class= "table table-stripped table-bordered table-hover table-condensed">
					<thead>
						<tr>
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
							<div> <!--  id="paging"> 
								<ul>
									<li><a href="#"><span>Previous</span></a></li>
									<li><a href="#" class="active"><span>1</span></a></li>
									<li><a href="#"><span>2</span></a></li>
									<li><a href="#"><span>3</span></a></li>
									<li><a href="#"><span>4</span></a></li>
									<li><a href="#"><span>5</span></a></li>
									<li><a href="#"><span>Next</span></a></li>
								</ul>
							</div> -->
						</tr>
					</tfoot>
					<tbody>
						<tr>
						<c:forEach var="product" items="${products}">
							<td><c:out value="${product.name}"/></td>
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

