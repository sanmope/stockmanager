package com.terabyte.stockmanager.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.terabyte.stockmanager.model.Product;
import com.terabyte.stockmanager.service.ProductService;


@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	 @RequestMapping(value="/products.htm" , method = RequestMethod.GET)
	    public String listProducts(Model model) {
	        model.addAttribute("product", new Product());
	        model.addAttribute("listProducts", productService.listProducts());
	        return "product";
	    }
	
	 @RequestMapping(value= "/product/add.htm", method = RequestMethod.POST)
	    public String addProduct(@ModelAttribute("product") Product product){
	         
	        if(product.getId() == 0){
	            productService.create(product);
	        }else{
	            productService.update(product);
	        }
	         
	        return "redirect:/products.htm";
	         
	    } 
	 
    @RequestMapping("/product/remove.htm")
    	public ModelAndView removeProduct (@RequestParam int id) { 
    	productService.remove(productService.getProductById(new Long(id)));
	    return new ModelAndView("redirect:/products.htm");
    }
    	
    	
    @RequestMapping(value="/product/edit.htm", method= RequestMethod.GET	)
	    public ModelAndView editProduct	(@RequestParam int id,  
	    @ModelAttribute Product p) {
		    Product product = productService.getProductById(new Long(id));
		    return new ModelAndView("product", "product", product);
	 }
    
    
    
    @RequestMapping(value="/priceIncrease/{productId}.htm", method=RequestMethod.POST)
    public String findProduct(@PathVariable Long productId, Model model) {
        Product product = productService.getProductById(productId);
        model.addAttribute("product", product);
        return "priceIncrease";
    }
    
	@RequestMapping("/priceIncrease.htm")
	public ModelAndView job() {
		return new ModelAndView("priceIncrease");
	}
	
	@RequestMapping(value = "/getProductList.htm",  method = RequestMethod.GET)
    public @ResponseBody List getProductList(@RequestParam("term") String query) {
        List productList = productService.listByName(query);
        return productList;

    }
	
	
  
}
