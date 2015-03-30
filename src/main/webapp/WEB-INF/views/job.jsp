<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytags"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>
<mytags:style /> 
<mytags:jquery />
 
 
 <script>
 





$(document).ready( function() {
	$('#myTable tr').click(function(){
  		$('#jobId').val($(this).find('td:first').html());
  		$('#clientId').val($(this).find('td:eq(8)').html());
  		$('#deviceId').val($(this).find('td:eq(9)').html());
  		$('#jobDescription').val($(this).find('td:eq(4)').html());
  		
		
	})
});	
 
 
 </script>
 
 </head>
	<body>
		<mytags:menu />
		<div class="wrapper ">
			<div class="ui-widget noPrint">
				<label>Cliente</label>
				<input class="form-control" type="search" id="query_job_by_Client" name="#query_job_by_Client" required>
			</div>
		</div>
		<div >
			<label >Cliente: </label> ${client.name} ${client.lastName} <label id= "#lblClient"></label>
			<label >Ordenes de Trabajo</label>
			<c:choose>
				<c:when test="${fn:length(jobList) gt 0}">
					<div class= "noPrint"> 
						<table id="myTable" class= "table table-stripped table-bordered table-hover table-condensed">
							<thead>
								<tr>
									<th>N trabajo</th>
									<th>Aparato</th>
									<th>Caracteristicas</th>
									<th>N Serie</th>
									<th>Detalle Reparacion</th>
									<th>Presupuestado</th>
									<th>Reparado</th>
									<th>Entregado</th>
									<th class="hidden">clientId</th>
									<th class="hidden">deviceId</th>
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
								<c:forEach var="job" items="${jobList}">
								<tr id="jobRow">
									<td ><c:out value="${job.id}"/></td>
									<td >${job.device.name}</td>
									<td>${job.device.description}</td>
									<td >${job.device.barCode}</td>
									<td >${job.description}</td>
									<c:choose>
										<c:when test="${job.presupuestado == true}"><td id="jobPresupuestado"><img src='images/tick.png'></td></c:when>
										<c:when test="${job.presupuestado == false}"><td id="jobPresupuestado"><img src='images/pendiente.png'></td></c:when>
									</c:choose>
									
									<c:choose>
											<c:when test="${job.reparado == true}">	<td id="jobReparado"><img src='images/tick.png'></td></c:when>
											<c:when test="${job.reparado == false}"><td id="jobReparado"><img src='images/pendiente.png'></td></c:when>
									</c:choose>
									
									<c:choose>
										<c:when test="${job.entregado == true}"> <td id="jobEntregado"><img src='images/tick.png'></td>   </c:when>
										<c:when test="${job.entregado == false}"><td id="jobEntregado"><img src='images/pendiente.png'></td></c:when>
									</c:choose>
								<td class="hidden" >${job.client.id}</td>
								<td class="hidden" >${job.device.id}</td>
								</tr>
								</c:forEach>						
							</tbody>
						</table>
						</div>
				</c:when>
				<c:otherwise>sin ordenes de Trabajo</c:otherwise>
			</c:choose>

		</div>
		<div>
			<h3 >Orden de Trabajo</h3>
			
</head>
<body>
<h1></h1>
	<div id="mainContainer"> 
		<c:url var="addAction" value="/job/add.htm" ></c:url>
		 
		<form:form action="${addAction}" commandName="job">
		<table id=tablaOrdenDeTrabajo>
			        <td>
			            <form:input  id="jobId" path="id" readonly="true" size="8"  disabled="true" />
			        </td>
			    <tr>
			        <td>
			            <form:input id="clientId" path="client.id" />
			        </td>
			        <td>
			            <form:input id="deviceId" path="device.id" />
			        </td>
			        <td>
			            <form:input id="jobDescription" path="description" />
			        </td>
			    </tr>
			  	<tr id="addButton">
			
					<td><input type="submit" name="action" value="Agregar Orden" />	</td>				
		    	</tr>
		    	<tr id="editButton">
		    		<td><input type="submit" name="action" value="Editar Orden" /></td>
		    	</tr>
		    	
		    </table>
		</form:form>
				

		</div>
		
	
	</body>