 /*--This JavaScript method for Print command--*/

function PrintDoc() {
        var toPrint = document.getElementById('printArea');
        var popupWin = window.open('/saleCompleted.htm', '_blank', 'width=350,height=150,location=no,left=200px');
        popupWin.document.open();
        popupWin.document.write('<html><title>::Preview::</title><link media="print" rel="stylesheet" type="text/css" href="../../css/invoice.css"  /></head><body onload="window.print()">')
        popupWin.document.write(toPrint.innerHTML);
        popupWin.document.write('</html>');
        popupWin.document.close();
    }

/*--This JavaScript method for Print Preview command--*/

    function PrintPreview() {
        var popupWin = window.open();
        popupWin.document.open();
        popupWin.document.write('<html><title>::Previsulalizacion de impresion::</title><link  rel="stylesheet" type="text/css" href="../../css/invoice.css" /></head><body">')
        popupWin.document.write(toPrint.innerHTML);
        popupWin.document.write('</html>');
        popupWin.document.close();
    }