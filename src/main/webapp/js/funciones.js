	/* Set the defaults for DataTables initialisation */
	$.extend( true, $.fn.dataTable.defaults, {
		"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
		"sPaginationType": "bootstrap",
		"oLanguage": {
			"sLengthMenu": "_MENU_ registros por página"
		}
	} );


	/* Default class modification */
	$.extend( $.fn.dataTableExt.oStdClasses, {
		"sWrapper": "dataTables_wrapper form-inline"
	} );


	/* API method to get paging information */
	$.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
	{
		return {
			"iStart":         oSettings._iDisplayStart,
			"iEnd":           oSettings.fnDisplayEnd(),
			"iLength":        oSettings._iDisplayLength,
			"iTotal":         oSettings.fnRecordsTotal(),
			"iFilteredTotal": oSettings.fnRecordsDisplay(),
			"iPage":          oSettings._iDisplayLength === -1 ?
				0 : Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
			"iTotalPages":    oSettings._iDisplayLength === -1 ?
				0 : Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
		};
	};


	/* Bootstrap style pagination control */
	

	/*
	 * TableTools Bootstrap compatibility
	 * Required TableTools 2.1+
	 */
	if ( $.fn.DataTable.TableTools ) {
		// Set the classes that TableTools uses to something suitable for Bootstrap
		$.extend( true, $.fn.DataTable.TableTools.classes, {
			"container": "DTTT btn-group",
			"buttons": {
				"normal": "btn",
				"disabled": "disabled"
			},
			"collection": {
				"container": "DTTT_dropdown dropdown-menu",
				"buttons": {
					"normal": "",
					"disabled": "disabled"
				}
			},
			"print": {
				"info": "DTTT_print_info modal"
			},
			"select": {
				"row": "active"
			}
		} );

		// Have the collection use a bootstrap compatible dropdown
		$.extend( true, $.fn.DataTable.TableTools.DEFAULTS.oTags, {
			"collection": {
				"container": "ul",
				"button": "li",
				"liner": "a"
			}
		} );
	}

	
	$('#myTable').dataTable( {
		"sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
		"sPaginationType": "bootstrap",
		"oLanguage": {
                        "oPaginate": {
                            "sNext": "Próxima",
                            "sPrevious": "Anterior"
                        },
			"sLengthMenu": "Mostrar _MENU_ registros por página",
			"sZeroRecords": "No se encontraron registro",
			"sInfo": "Mostrando del _START_ al _END_ de _TOTAL_ registros",
			"sInfoEmpty": "Mostrando del 0 al 0 de 0 registros",
			"sInfoFiltered": "(Filtrado de un tota de _MAX_ records)",
                        "sSearch": "Buscar:",
                        "sNextPage": "Prox.:"
		}
	} );	