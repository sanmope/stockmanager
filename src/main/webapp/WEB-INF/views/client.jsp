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
    <title>Client Page</title>
<mytags:jquery />
<mytags:style /> 
<!-- <link rel="stylesheet" href="../../css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="../../css/style.css" type="text/css"> -->

<mytags:menu />

</head>
<body>
<h1>
    Agregar Cliente
</h1>
	<div id="mainContainer"> 
		<c:url var="addAction" value="/client/add.htm" ></c:url>
		 
		<form:form action="${addAction}" commandName="client">
		<a>${addAction}</a>
		<table >
			    <c:if test="${!empty client.name}">
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
			            <form:input path="name" />
			        </td>
			        <td><form:errors path="name" /></td>
	<!-- 		    </tr>
			    <tr> -->
			        <td>
			            <form:label path="lastName">
			                <spring:message text="Apellido"/>
			            </form:label>
			        </td>
			        <td>
			            <form:input path="lastName" />
			        </td>
			        <td><form:errors path="lastName" /></td>
	<!-- 		    </tr>
					<tr>-->		    
			        <td>
			            <form:label path="eMail">
			                <spring:message text="E-Mail"/>
			            </form:label>
			        </td>
			        <td>
			            <form:input path="eMail" />
			        </td>
	<!--		</tr>
	 		    <tr> -->
	 		    	<td>
			            <form:label path="female">
			                <spring:message text="Sexo (Femenino)"/>
			            </form:label>
			        </td>
			    	<td><form:checkbox path="female"/></td>
	        	</tr>
        	</table>
        	<table>
	        	<tr>		    
			        <td>
			            <form:label path="occupation">
			                <spring:message text="Ocupacion"/>
			            </form:label>
			        </td>
			        <td>
			            <form:input path="occupation" />
			        </td>
<!-- 			    </tr>
			     <tr>	 -->	    
			        <td>
			            <form:label path="age">
			                <spring:message text="Edad"/>
			            </form:label>
			        </td>
			        <td>
			            <form:input path="age" />
			        </td>  
			    <tr> 
			        <td>
			            <form:label path="address">
			                <spring:message text="Direccion"/>
			            </form:label>
			        </td>
			        <td>
			            <form:input path="address" />
			        </td>
			    </tr>
		    </table>
		    <table>
			    <tr>		    
			        <td>
			            <form:label path="phoneHome">
			                <spring:message text="Tel Casa"/>
			            </form:label>
			        </td>
			        <td>
			            <form:input path="phoneHome" />
			        </td>
<!-- 			    </tr>
			    <tr>	 -->	    
			        <td>
			            <form:label path="phoneCell">
			                <spring:message text="Celular"/>
			            </form:label>
			        </td>
			        <td>
			            <form:input path="phoneCell" />
			        </td>
<!-- 			    </tr>		 
			     <tr>	 -->	    
			        <td>
			            <form:label path="phoneOffice">
			                <spring:message text="Tel Oficina"/>
			            </form:label>
			        </td>
			        <td>
			            <form:input path="phoneOffice" />
			        </td>
			    </tr>
			</table>  		  
		    <tr>
		    
		        <td colspan="2">
		            <c:if test="${!empty client.name}">
		                <input type="submit"
		                    value="<spring:message text="Editar Cliente"/>" />
		            </c:if>
		            <c:if test="${empty client.name}">
		                <input type="submit"
		                    value="<spring:message text="Agregar Cliente"/>" />
		            </c:if>
		        </td>
		    </tr>
		</table> 
		</form:form>
		<br>
		
		<tr>
    <td>Interests:</td>
</tr>
		
		<h3>Clients List</h3>
		<c:if test="${!empty listClients}">
		    <table  id="myTable" class= "table table-stripped table-bordered table-hover table-condensed" ><!--  class="tg"> -->
				<thead>   
					<tr>
				        <th width="40">ID</th>
				        <th width="120">Nombre</th>
				        <th width="120">Apellido</th>
				        <th width="120">Direccion</th>
				        <th width="60">Tel Casa</th>
				        <th width="60">Tel Celular</th>
				        <th width="60">Tel Oficina</th>
				        <th width="120">Email</th>
				        <th width="120">Ocupacion</th>
				        <th width="60">Edad</th>
				        <th width="60">Edit</th>
				        <th width="60">Delete</th>
				    </tr>
				</thead>
				<tbody>
				    <c:forEach items="${listClients}" var="client">
				        <tr>
				            <td>${client.id}</td>
				            <td>${client.name}</td>
				            <td>${client.lastName}</td>
				            <td>${client.address}</td>
				            <td>${client.phoneHome}</td>
				            <td>${client.phoneCell}</td>
				            <td>${client.phoneOffice}</td>
				            <td>${client.eMail}</td>
				            <td>${client.occupation}</td>
				            <td>${client.age}</td>
				            <td><a href="<c:url value='/client/edit.htm?id=${client.id}' />" >Editar</a></td>
				            <td><a href="<c:url value='/client/remove.htm?id=${client.id}' />" >Borrar</a></td>
				        </tr>
				    </c:forEach>
				</tbody>
		    </table>
		</c:if>
	</div>
</body>
</html>

