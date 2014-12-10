package com.terabyte.stockmanager.web;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sun.nio.cs.ext.DoubleByteEncoder;

import com.terabyte.stockmanager.model.Product;
import com.terabyte.stockmanager.service.PriceIncrease;

@Controller
public class ProductController {

	@Autowired
	private SessionFactory sessionFactory;

	@RequestMapping(value="/newProduct.htm", method=RequestMethod.POST)
	public ModelAndView newProduct(Product p, Errors errors)
	{
		if (errors.hasErrors())
		{
			ModelAndView mav = new ModelAndView("newProduct");
			mav.addObject("errors", errors);
			return mav;
		}
		
		sessionFactory.getCurrentSession().save(p);	
		return new ModelAndView("redirect:/allProducts.htm");
	}

	@RequestMapping(value="/newProduct.htm")
	public String newProduct()
	{
		return "newProduct";
	}

	
	
	@RequestMapping("/allProducts.htm")
	public ModelAndView allProducts()
	{
		List<Product> products = sessionFactory.getCurrentSession().
			createQuery("FROM Product").list();
		
		ModelAndView mav = new ModelAndView("allProducts");
		mav.addObject("products", products);
		return mav;
	}
	
	@RequestMapping(value="/priceIncrease.htm", method=RequestMethod.POST)
	public ModelAndView priceIncrease(PriceIncrease pi,Errors errors)
	{
		if (errors.hasErrors())
		{
			ModelAndView mav = new ModelAndView("priceIncrease");
			mav.addObject("errors", errors);
			return mav;
		}
		List<Product> products = sessionFactory.getCurrentSession().
				createQuery("FROM Product").list();
		
		
		 if (products != null) {
		            for (Product product : products) {
		                double newPrice = product.getPrice().doubleValue()*(1 + (pi.getPercentage()*1.0/100));
		                product.setPrice(newPrice);
		            }
		        }
		 return  new ModelAndView("redirect:/allProducts.htm");		
	}
	
	@RequestMapping(value="/priceIncrease.htm")
	public String priceIncrease()
	{
		return "priceIncrease";
	}
}

