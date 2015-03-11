<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytags"%>
<%@ page session="false" %>
<html>
<head>
    <title>Pagina de Producto</title>
<mytags:jquery />
<mytags:style />
<link rel="stylesheet" href="../../css/bootstrap.css" type="text/css">
<mytags:menu />
</head>
<body>
<h1>
    Agregar Producto
</h1>

	<div id="mainContainer">  
		<c:url var="addAction" value="/product/add.htm" ></c:url>
		<form:form  action="${addAction}" commandName="product">
			<table >
			    <c:if test="${!empty product.name}">
			    <tr>
			        <td>
			            <form:label path="id">
			                <spring:message text="ID"/>
			            </form:label>
			        </td>
			        <td>
			            <form:input path="id" readonly="true" size="8"  disabled="true" />
			            <form:hidden path="id" />
			        </td>
			    </tr>
			    </c:if>
			    <tr>
			        <td>
			            <form:label path="name">
			                <spring:message text="Nombre"/>
			            </form:label>
			        </td>
			        <td>
			            <form:input  path="name" size="4" />
			        </td>
			        <td>
			            <form:label path="description">
			                <spring:message text="Descripcion"/>
			            </form:label>
			        </td>
			        <td>
			            <form:input path="description"  />
			        </td>
			    </tr>
			 </table>
			    <table>
				    <tr>
				         <td>
				            <form:label path="cost">
				                <spring:message text="Costo"/>
				            </form:label>
				        </td>
				        <td>
				            <form:input path="cost"  />
				        </td>
				        <td>
				            <form:label path="price">
				                <spring:message text="Precio"/>
				            </form:label>
				        </td>
				        <td>
				            <form:input path="price"  />
				        </td>
				        <td>
				            <form:label path="quantity">
				                <spring:message text="Cantidad"/>
				            </form:label>
				        </td>
				        <td>
				            <form:input path="quantity"  />
				        </td>		       
				    </tr>
				</table>
				<table>
			    <tr>
			        <td colspan="2">
			            <c:if test="${!empty product.name}">
			                <input type="submit"
			                    value="<spring:message text="Editar Producto"/>" />
			            </c:if>
			            <c:if test="${empty product.name}">
			                <input type="submit"
			                    value="<spring:message text="Agregar Producto"/>" />
			            </c:if>
			        </td>
			    </tr>
			</table> 
		</form:form>
		<br>
		<h3>Lista de Productos</h3>
		<c:if test="${!empty listProducts}">
		    <table  id="myTable" class= "table table-stripped table-bordered table-hover table-condensed" class="tg"> 
			    <thead>
				    <tr>
				        <th width="80">ID</th>
				        <th width="120">Nombre</th>
				        <th width="60">Costo</th>
				        <th width="60">Precio</th>
				        <th width="60">Cantidad</th>
				        <th width="120">Descripcion</th>
				        <th width="60">Editar</th>
				        <th width="60">Borrar</th>
				    </tr>
				</thead>
			    <tbody>
				    <c:forEach items="${listProducts}" var="product">
				        <tr>
				            <td>${product.id}</td>
				            <td>${product.name}</td>
				            <td>${product.cost}</td>
							<td>${product.price}</td>
							<td>${product.quantity}</td>
							<td>${product.description}</td>
				            <td><a href="<c:url value='/product/edit.htm?id=${product.id}' />" >Edit</a></td>
				            <td><a href="<c:url value='/product/remove.htm?id=${product.id}' />" >Delete</a></td>
				        </tr>
				    </c:forEach>
			  </tbody>
		    </table>
		</c:if>
	</div>

</body>
</html>
<!DOCTYPE>
