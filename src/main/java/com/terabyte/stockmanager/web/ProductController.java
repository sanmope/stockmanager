package com.terabyte.stockmanager.web;

import java.math.BigDecimal;
import java.util.List;

import com.terabyte.stockmanager.model.Product;
import com.terabyte.stockmanager.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@RequestMapping(value="/newProduct.htm", method=RequestMethod.POST)
	public ModelAndView newProduct(Product product, Errors errors)
	{
		ModelAndView modelAndView = new ModelAndView("newProduct");
		if (errors.hasErrors()) {			
			modelAndView.addObject("errors", errors);
			return modelAndView;
		}
		
		productService.create(product);
		List<Product> products = productService.listByName(product.getName());
	
		modelAndView.addObject("products", products);
		return modelAndView;
	}
	


	@RequestMapping(value="/newProduct.htm")
	public String newProduct() {
		return "newProduct";
	}

	@RequestMapping("/allProducts.htm")
	public ModelAndView allProducts() {
		List<Product> products = productService.listProducts(); 
					
		ModelAndView modelAndView = new ModelAndView("allProducts");
		modelAndView.addObject("products", products);
		return modelAndView;
	}
	
	@RequestMapping(value="/priceIncrease.htm", method=RequestMethod.POST)
	public ModelAndView priceIncrease(BigDecimal percentage,Errors errors)
	{
		if (errors.hasErrors())
		{
			ModelAndView modelAndView = new ModelAndView("priceIncrease");
			modelAndView.addObject("errors", errors);
			return modelAndView;
		}

		 
		ModelAndView modelAndView = new ModelAndView("redirect:/allProducts.htm");	
		modelAndView.addObject("Products", productService.incricePrice(percentage));
		return  modelAndView;	
	}
	
	@RequestMapping(value="/priceIncrease.htm")
	public String priceIncrease() {
		return "priceIncrease";
	}
}

