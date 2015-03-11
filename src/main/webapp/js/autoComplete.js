$(function() {
	$( "#query" ).autocomplete({
	      source:function (request, response) {
	            $.getJSON("/getClientList.htm", request, function(result) {
	                response($.map(result, function(item) {
	                    return {
	                        // following property gets displayed in drop down
	                        label: item.name + ' - ' + item.lastName + ' - ' + item.eMail + ' - ' + item.address, 
	                        value: item.name + "(" + item.id + ")",
	                        tag_url: item.id,
	                        id: item.id
	                }
	                }));
	            });
	        },
	      minLength: 2, 
	      select: function(event, ui) {
	        if (ui.item) {
	            event.preventDefault();
	            $("#txtProducto").append("<li>" + ui.item.label + "</li>");
	            $( "#query" ).val('');
	            
	            
	        	return false;
	        }
	    } 
	    });
	
});

$(function() {

	$( "#query_client" ).autocomplete({
      source:function (request, response) {
            $.getJSON("/getClientList.htm", request, function(result) {
                response($.map(result, function(item) {
                    return {
                        // following property gets displayed in drop down
                        label: item.name + ' - ' + item.lastName + ' - ' + item.eMail + ' - ' + item.address, 
                        value: item.name + "(" + item.id + ")",
                        name: item.name + ' ' + item.lastName,
                        eMail: item.eMail,
                        address: item.address, 
                        occupation:item.occupation,
                        phone:+ 'Celular:' + item.phoneCell + 'Oficina:' + item.phoneOffice  + 'Casa:' + item.phoneHome,
                        id: item.id
                }
                }));
            });
        },
     /*  minLength: 2,  */
      select: function(event, ui) {
        if (ui.item) {
            event.preventDefault();
            $("#tdClient").text('Nombre: ' + ui.item.name + ' - Direccion: ' + ui.item.address + ' - telefono: ' + ui.item.address + ' - Email: ' + ui.item.eMail);
            $( "#clientId" ).val(ui.item.id);
            $( "#query_client" ).val('');
            
        	return false;
        }
    } 
    });
	
});

$(function() {
$( "#query_product" ).autocomplete({
    source:function (request, response) {
          $.getJSON("/getProductList.htm", request, function(result) {
              response($.map(result, function(item) {
                  return {
                      // following property gets displayed in drop down
                      label: item.name + ' - ' + item.quantity + ' - ' + item.cost + ' - ' + item.price, 
                      value: item.name + "(" + item.id + ")",
                      tag_url: item.id,
                      id: item.id
              }
              }));
          });
      },
    minLength: 2, 
    select: function(event, ui) {
      if (ui.item) {
          event.preventDefault();
          $("#txtProducto").append("<li>" + ui.item.label + "</li>");
          $( "#query_product" ).val('');
          
      	return false;
      }
  } 
  });
            
});