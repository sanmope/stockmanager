<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytags"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title class="noPrint">Venta de Producto</title>
<mytags:jquery />
<mytags:style />

</head>
<body>
<mytags:menu />
	<div class="wrapper ">
		<div class="ui-widget noPrint">
			<label>Cliente</label>
			<input class="form-control" type="search" id="query_client" name="query_client" required>
		</div>
<div >
	<label >Buscar Producto</label>
	<c:choose>
		<c:when test="${fn:length(listProducts) gt 0}">
			<div class= "noPrint"> 
				<table id="myTable" class= "table table-stripped table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th>Id</th>
							<th>Nombre</th>
							<th>Precio</th>
							<th>Stock</th>
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
						<tr id="productRow">
						<c:forEach var="product" items="${listProducts}">
							<td><c:out value="${product.id}"/></td>
							<td>${product.name}</td>
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

<div id="mainContainer">
	<label>Presupuesto</label>	
	<div id="printArea"> 
		
		<table id="myTable2" class= "table table-stripped table-bordered table-hover table-condensed  ">
			
			<thead>
				<tr>
					<th>Cliente: </th> <th colspan="3"  align="right" id="tdClient"></th>
				</tr>
				<tr >
				
					<th width="20px">Cant</th>
					<th>Producto</th>							
					<th width="40px">Precio unit.</th>
					<th width="40px" align="right">Importe</th>
					<th class="noPrint" width="40px" align="right">Quitar</th>
					<th class="hidden noPrint" width="0px" align="right">Id</th>
					
				</tr>
			</thead>
			<tfoot>

			</tfoot>
			<tbody>
			</tbody>
		</table>
		<table>
			<tr>
				<td >Total</td>
				<td id="total" colspan="5">0.00</td>				        
			</tr>
			<tr height="25px">
			</tr>
<!--  			<tr>
	            <td> <input type="button" value="Imprimir" class="printButton" onclick="PrintDoc()"/>  <input type="button" value="Impresion Previa" class="printButton" onclick="PrintPreview()"/> <input type="button" value="presupuesto" class="printButton" onclick="PreSale()"/> </td>			
	        </tr>	 --> 	
		</table>
		
	</div>
</div>

<div>

<script>

$(document).ready( function() {
	var productItemPosition = 0;
	$('#myTable tr').click(function(){
		   $(this).addClass('selected').siblings().removeClass('selected'); 	   
		   var value= "<tr> <td width=\"41px\">" + "<input id=\"quant input-mini\" value=\"1\"></input>" + "</td>" + 
		   "<td>" + $(this).find('td:eq(1)').html() + " (" + $(this).find('td:eq(4)').html() + ")</td>" + 
		   "<td>" + $(this).find('td:eq(2)').html() + "</td>" + "<td class=\"subt\">" + $(this).find('td:eq(2)').html() + "</td>" +
		   "<td> <a class=\"deleteLink noPrint\"  >Borrar</a> </td > <td class=\"hidden noPrint\">" + $(this).find('td:first').html() + "</td></tr>" 
		 
		   var data= "<tr class=\"hidden\"> <td>&nbsp;</td> <td> "+
				"<input id=\"productItems[" + productItemPosition + "].product.id\" name=\"productItems[" + productItemPosition + "].product.id\" type=\"text\" value=\"" + $(this).find('td:first').html() + "\" size=\"40\"/>" +
			"</td> <td> " +
			"<input id=\"productItems[" + productItemPosition + "].quantity\" name=\"productItems[" + productItemPosition + "].quantity\" type=\"text\" value=\"1\" size=\"40\"/>" +
			"</td> <td> " +
			"<input id=\"productItems[" + productItemPosition + "].price\" name=\"productItems[" + productItemPosition + "].price\" type=\"text\" value=\"" + $(this).find('td:eq(2)').html() + "\" size=\"40\"/>" +
			"</td> <td>&nbsp;</td> </tr>"
			
			var id= $(this).find('td:first').html();
			var tdlength= $(".hidden").filter(function() {
				return $(this).text() == id;
			 }).length;

			if(!tdlength){ 
				
			   $("#submitRow").before(data);
			   $('#myTable2 tbody').append(value);
			   calculateTotal();
			   productItemPosition++;				
			}
			if(tdlength){
				alert("Ya está insertado el producto");
			}
			
		});
});

$(document).ready( function() {
	$('#myTable2 tbody').on("keyup",'input',function(e){
	    var code = (e.keyCode ? e.keyCode : e.which);
    		var one = parseFloat($(this).parent().parent().find('td:eq(2)').html()).toFixed(2);
	    	var two = parseFloat($(this).val());
	    	var pId = $(this).parent().parent().find('td:eq(5)').html();
	    	
	    	$(this).parent().parent().find('td:eq(3)').html(parseFloat(one*two).toFixed(2)); 
	    	$('#myTableForm').find("input").filter(function() { return $(this).val()=== pId;}).parent().parent().find('td:eq(3) input').val(parseFloat(one*two).toFixed(2));
	    	$('#myTableForm').find("input").filter(function() { return $(this).val()=== pId;}).parent().parent().find('td:eq(2) input').val(two);
	    	calculateTotal();	    
	});
	


});

$(document).ready( function() {
	$('#myTable2 tbody').on("click",".deleteLink",function() {
		var pId = $(this).parent().parent().find('td:eq(5)').html();
		var tr = $(this).closest('tr');
        var trInput = $('#myTableForm').find("input").filter(function() { return $(this).val()=== pId;}).parent().parent().find('td:eq(2) input').closest('tr');
        tr.fadeOut(400, function(){
            tr.remove();
            trInput.remove();
            calculateTotal();
        });
        return false;
    });
});

function calculateTotal() {
	var sum = 0;	    	
	$('.subt').each(function( index, elem ){
        var val = parseFloat($(elem).html());
        if( !isNaN( val ) ) {
            sum += val;
        }
	});	
	$('#total').html(sum.toFixed(2));
	$('#saleTotal').val(sum.toFixed(2));
};

/* function PreSale() {
	var productItemPosition = 0;
	for 
	
} */
</script>
 
<form:form method="post" name="classForm" id="classForm" commandName="classCommand">
			<table id="myTableForm">
				
				<tr class="hidden">
					<td>Product id</td>
					<td>
						<spring:bind path="classCommand.productItems[0].product.id">
<%-- 							<form:input class="productId" path="${status.expression}" size="40" /> --%>
			  			</spring:bind>
					</td>
					<td>quantity</td>
					<td>
						<spring:bind path="classCommand.productItems[0].quantity">
<%-- 							<form:input class="quantity" path="${status.expression}" size="40" /> --%>
			  			</spring:bind>
					</td>
					<td>Price</td>
					<td>
						<spring:bind path="classCommand.productItems[0].price">
<%-- 							<form:input class="price" path="${status.expression}" size="40" /> --%>
			  			</spring:bind>
<!-- 					</td>
					<td><input type="button" id="addProductItemButton" value="Add" /></td> -->
				</tr>
				<tr id="submitRow">
					<td>
						<spring:bind path="classCommand.saleTotal">
							<form:input class="saleTotal hidden" path="${status.expression}" size="40" />
			  			</spring:bind>
					</td>
					<td>
						<spring:bind path="classCommand.clientId">
							<form:input class="clientId hidden" path="${status.expression}" value="-1" size="40" />
			  			</spring:bind>
					</td>
					<td>&nbsp;</td>
					<td><input type="submit" name="saleOrPreSale" value="Generar Presupuesto" /></td>
					<td><input type="submit" name="saleOrPreSale" value="Generar Venta" /></td>
				</tr>
			</table>
		</form:form>

</div>



</body>
</html>