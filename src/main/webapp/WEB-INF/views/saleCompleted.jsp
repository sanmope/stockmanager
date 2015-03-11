<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytags"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" media="all" href="../../css/invoice.css" type="text/css">

</head>



</html>
<body>
		<div id="toPrint" >
			<div id="page-wrap">
				<textarea id="header" >Presupuesto</textarea>
				<table border="0">
					<tr>
						<td id="logo" class="noBorder" rowspan="2" padding="8">
							<h1>Servimas</h1>
							<h6>AUDIO - TV - LCD - LED - HORNOS MICROONDAS </h6> 
							<h6>Av. Armada Argentina 999 B° Parque Latino - CP 5016   Córdoba - Tel: 4621321 </h6> 
						</td>
						<td id="date" class="noBorder">
			            	<p>N°: ${invoiceNumber} </p>
			            	<p>${now}</p> 
			            	<p></p>	            	
			            </td>
			       </tr>	                        				
				</table>
		
				<div id="identity">
					<div id="address">
				</div>
				<div style="clear:both"></div>
				<div id="customer">
					<table>
						<c:if test="${!empty sale.client.id}">
						
							<tr>
								<td class="noBorder">Señor/es:</td>
								<td class="noBorder" id="custommer-title"> ${sale.client.name}  ${sale.client.lastName} </td>
							</tr>
							<tr>
								<td class="noBorder">Dirección:</td>
								<td class="noBorder" id="custommer-title"> ${sale.client.address} </td>
							</tr>
						</c:if>
					</table>
				</div>
				
				<table id="items">
					<thead>
						 <th>
						 	Item
						 </th>
						 <th>
						 	Descripcion
						 </th>
						 <th>
						 	Cant.
						 </th>
						 <th class="price">
						 	SubT.
						 </th>
					</thead>
					<c:forEach var="productItem" items="${sale.productItems}">
						<tr class="item-row">	
							<td>${productItem.product.name}</td>
							<td>${productItem.product.description}</td>
							<td class="quantity">${productItem.quantity}</td>
							<td class="coin">${productItem.price}</td>
						</tr>
					</c:forEach>
					<tr>
						
						<td colspan="4" class="total-line balance">Total: $ ${sale.total}</td>
					</tr>
				</table>
				
				<div id="terms">
				  <h5>Terminos</h5>
				  <h6>Reparaciones: 60 dias de Garantia sobre mano de Obra. No se cubren roturas por conexiones clandestinas o por golpes de tension de EPEC</h6>
				</div>
			</div>
		</div>
	</div>
	
	<input type="button" value="Imprimir" class="printButton" onclick="print()"/>
	<form  method="get" action="productSale.htm" >
		<input type="submit" value="Nuevo Presupuesto" class="printButton"/>
	</form>
	
	
	<script type="text/javascript">
	function print(){
		var toPrint = document.getElementById('toPrint');
		var popupWin = window.open('', '_blank', 'width=350,height=150,location=no,left=200px');
	    popupWin.document.open();  
	    popupWin.document.write('<html><link  rel="stylesheet" type="text/css" href="../../css/invoice.css"  /></head><body onload="window.print();window.close()">');
	    popupWin.document.write(toPrint.innerHTML);
		popupWin.document.write('</html>');
	    popupWin.document.close();
	}
	</script> 

</body>
