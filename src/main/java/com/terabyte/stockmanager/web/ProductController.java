package com.terabyte.stockmanager.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	
	@RequestMapping(value="/newProduct.htm", method=RequestMethod.GET)
	public String newProduct() {
		
		return "newProduct";
		
	}
}
