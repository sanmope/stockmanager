<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
 
<tr>
	<td>&nbsp;</td>
	<td>
		<form:input path="classCommand.productItems[${productItemPosition}].product.id" size="40" />
	</td>
	<td>
		<form:input path="classCommand.productItems[${productItemPosition}].product.name" size="40" />
	</td>
	<td>
		<form:input path="classCommand.productItems[${productItemPosition}].quantity" size="40" />
	</td>
	<td>
		<form:input path="classCommand.productItems[${productItemPosition}].price" size="40" />
	</td>
	<td>&nbsp;</td>
</tr>