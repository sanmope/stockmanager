<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytags"%>
<html>
<head>
	<mytags:jquery />
<!-- <mytags:style />  -->
	<style type="text/css">
		#tfheader{
		background-color:#c3dfef;
		pading: 50px;
	}
	#tfnewsearch{
		float:left;
		padding:10px;
		margin:0px;
	}
	.tftextinput{
		margin: 0;
		padding: 5px 15px;
		font-family: Arial, Helvetica, sans-serif;
		font-size:14px;
		border:1px solid #0076a3; border-right:0px;
		border-top-left-radius: 5px 5px;
		border-bottom-left-radius: 5px 5px;
	}
	.textinput{
		margin: 10;
		padding: 5px 15px 5px 5px;
		font-family: Arial, Helvetica, sans-serif;
		font-size:14px;
		border:1px solid #0076a3; border-right:1px;
		border-top-left-radius: 5px 5px ;
		border-bottom-left-radius: 5px 5px;
		border-top-right-radius: 5px 5px ;
		border-bottom-right-radius: 5px 5px;
	}
	.tfbutton {
		margin: 0;
		padding: 5px 15px;
		font-family: Arial, Helvetica, sans-serif;
		font-size:14px;
		outline: none;
		cursor: pointer;
		text-align: center;
		text-decoration: none;
		color: #ffffff;
		border: solid 1px #0076a3; border-right:0px;
		background: #0095cd;
		background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));
		background: -moz-linear-gradient(top,  #00adee,  #0078a5);
		border-top-right-radius: 5px 5px;
		border-bottom-right-radius: 5px 5px;
	}
	.tfbutton:hover {
		text-decoration: none;
		background: #007ead;
		background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e));
		background: -moz-linear-gradient(top,  #0095cc,  #00678e);
	}
	/* Fixes submit button height problem in Firefox */
	.tfbutton::-moz-focus-inner {
	  border: 0;
	}
	.tfclear{
		clear:both;
	}
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Trabajo</title>
</head>

<body>

	<div id="Client">
			<div id="tfheader">
				<p>Cliente:</p>
				<form id="tfnewsearch" method="get" action="http://www.google.com">
				    <input type="text" class="tftextinput" name="q" size="21" maxlength="120"><input type="submit" value="search" class="tfbutton">
				</form>
				<div class="tfclear"></div>
			</div>
	</div>
	<div id="device">
				<div id="tfheader">
				<p>Artefacto a reparar:</p>
				<form id="tfnewsearch" method="get" action="http://www.google.com">
				    <input type="text" class="tftextinput" name="q" size="21" maxlength="120"><input type="submit" value="search" class="tfbutton">
				</form>
				<div class="tfclear"></div>
			</div>
	</div>
	<div id="description">
		<div id="tfheader">
			<p>Descripción:</p>
			<input type="text" class="textinput" size="21" maxlength="120" name="description">
			<div class="tfclear"></div>
		</div>		
	</div>
	
	<div id="Items">
		<div id="tfheader">
			<p>Items</p>
			<table id="itemsTable" border="10px" class="textinput">
				<th>h1</th>
				<th>h2</th>
				<th>h3</th>
				
				<td>h1</td>
				<td>h2</td>
				<td>h3</td>
			</table>
			<div class="tfclear"></div>
		</div>
	</div>
	<div id="jobDetail">
		<div id="tfheader">
			<h1>Mano de Obra</h1>
			<table id="jobDetailTable" border="10px" class="textinput">
					<th>h1</th>
					<th>h2</th>
					<th>h3</th>
					
					<td>h1</td>
					<td>h2</td>
					<td>h3</td>
			</table>
			<div class="tfclear"></div>
		</div>
	</div>
	
	<div id="total">
		<div id="tfheader">
			<p>Total</p>
			<input type="text" class="textinput" size="21" maxlength="120" name="description">
			<div class="tfclear"></div>
		</div>
	</div>

</body>
</html>





