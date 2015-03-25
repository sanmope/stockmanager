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
 
function Add(){
	$("#tblData tbody").append(
		"<tr>"+
		"<td><input type='text'/></td>"+
		"<td><input type='text'/></td>"+
		"<td><input type='text'/></td>"+
		"<td><img src='images/disk.png' class='btnSave'><img src='images/delete.png' class='btnDelete'/></td>"+
		"</tr>");
	
		$(".btnSave").bind("click", Save);		
		$(".btnDelete").bind("click", Delete);
}; 

function Save(){
	var par = $(this).parent().parent(); //tr
	var tdName = par.children("td:nth-child(1)");
	var tdPhone = par.children("td:nth-child(2)");
	var tdEmail = par.children("td:nth-child(3)");
	var tdButtons = par.children("td:nth-child(4)");

	tdName.html(tdName.children("input[type=text]").val());
	tdPhone.html(tdPhone.children("input[type=text]").val());
	tdEmail.html(tdEmail.children("input[type=text]").val());
	tdButtons.html("<img src='images/delete.png' class='btnDelete'/><img src='images/pencil.png' class='btnEdit'/>");

	$(".btnEdit").bind("click", Edit);
	$(".btnDelete").bind("click", Delete);
}; 

function Edit(){
	var par = $(this).parent().parent(); //tr
	var tdName = par.children("td:nth-child(1)");
	var tdPhone = par.children("td:nth-child(2)");
	var tdEmail = par.children("td:nth-child(3)");
	var tdButtons = par.children("td:nth-child(4)");

	tdName.html("<input type='text' id='txtName' value='"+tdName.html()+"'/>");
	tdPhone.html("<input type='text' id='txtPhone' value='"+tdPhone.html()+"'/>");
	tdEmail.html("<input type='text' id='txtEmail' value='"+tdEmail.html()+"'/>");
	tdButtons.html("<img src='images/disk.png' class='btnSave'/>");

	$(".btnSave").bind("click", Save);
	$(".btnEdit").bind("click", Edit);
	$(".btnDelete").bind("click", Delete);
};


function Delete(){
	var par = $(this).parent().parent(); //tr
	par.remove();
}; 



$(function(){
	//Add, Save, Edit and Delete functions code
	$(".btnEdit").bind("click", Edit);
	$(".btnDelete").bind("click", Delete);
	$("#btnAdd").bind("click", Add);
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
									<th>Numero</th>
									<th>Detalle</th>
									<th>Presupuestado</th>
									<th>Reparado</th>
									<th>Entregado</th>
									
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
								<tr id="jobRow">
								<c:forEach var="job" items="${jobList}">
									<td><c:out value="${job.id}"/></td>
									<td>${job.device.description}</td>
									<c:choose>
										<c:when test="${job.presupuestado == true}"><td><img src='images/tick.png'></td></c:when>
										<c:when test="${job.presupuestado == false}"><td><img src='images/pendiente.png'></c:when>
									</c:choose>
									
									<c:choose>
											<c:when test="${job.reparado == true}">	<td><img src='images/tick.png'></td></c:when>
											<c:when test="${job.reparado == false}"><td><img src='images/pendiente.png'></c:when>
									</c:choose>
									
									<c:choose>
										<c:when test="${job.entregado == true}"> <td><img src='images/tick.png'></td>   </c:when>
										<c:when test="${job.entregado == false}"><td><img src='images/pendiente.png'></c:when>
									</c:choose>
						
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
			<h3 >Nueva orden de Trabajo</h3>
			

					
				
							
				<button id="btnAdd">Nuevo</button>
				<table id="tblData">			
					<thead>
						<tr>
							<th>Name</th>
							<th>Phone</th>
							<th>Email</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			
		</div>
		
	
	</body>