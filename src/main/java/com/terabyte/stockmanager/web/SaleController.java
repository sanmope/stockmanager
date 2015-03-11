package com.terabyte.stockmanager.web;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.AutoPopulatingList;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.terabyte.stockmanager.model.ClassCommand;
import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.model.Product;
import com.terabyte.stockmanager.model.ProductItem;
import com.terabyte.stockmanager.model.Sale;
import com.terabyte.stockmanager.service.ClientService;
import com.terabyte.stockmanager.service.ProductService;
import com.terabyte.stockmanager.service.SaleService;


@Controller
public class SaleController {

	@Autowired
	private ClientService clientService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private SaleService saleService;
	
	
	
	@ModelAttribute("classCommand")
	public ClassCommand getClassCommand()
	{
		ClassCommand classCommand = new ClassCommand();
		classCommand.setProductItems(new AutoPopulatingList(ProductItem.class));
		return classCommand;
	}
	
	
	@RequestMapping(method = RequestMethod.GET, value="/formProductItem.htm")
	protected String appendStudentField(@RequestParam Integer fieldId, ModelMap model)
	{	
		model.addAttribute("productItemPosition", fieldId);
		
				
		return "formProductItemInsert";
	}
	
	
	@RequestMapping(method = RequestMethod.POST, value="/productSale.htm")
	protected String onSubmit(@RequestParam(value = "saleOrPreSale") String saleOrPreSale,  @ModelAttribute("classCommand") ClassCommand classCommand,  ModelMap model, @ModelAttribute("sale") Sale sale, @ModelAttribute("clientId") Long clientId )
	{
		
		Iterator iterator = classCommand.getProductItems().iterator();
		while(iterator.hasNext()){
			ProductItem productItem = (ProductItem) iterator.next();
			productItem.setProduct(productService.getProductById(productItem.getProduct().getId()));
		}
		sale.setTotal(classCommand.getSaleTotal());
		sale.setProductItems(classCommand.getProductItems());
		if (clientId != -1){
			sale.setClient(clientService.getClientById(clientId));
		}
		
		saleService.create(sale);		
		
		Date now = new Date(); 
		
		model.addAttribute("sale", sale);
		model.addAttribute("now", DateFormat.getInstance().format(now));
		model.addAttribute("invoiceNumber",String.format("%09d",sale.getId()));
		
		if (saleOrPreSale.equalsIgnoreCase("Generar Venta")) {
			sale.setPresale(false);
			
			for( ProductItem productItem: sale.getProductItems()){
				Product product = productItem.getProduct();
				product.decreaseQuantity(productItem.getQuantity());
			}
			
		}else if (saleOrPreSale.equalsIgnoreCase("Generar Presupuesto")) {
			sale.setPresale(true);

		}
		
		return "saleCompleted";
	}
	
	@RequestMapping(method = RequestMethod.GET, value="/productSale.htm")
	protected String showProductSaleForm(ModelMap model)
	{	
		model.addAttribute("listProducts", productService.listProducts());
		return "productSale";
	}
	 	 
}
