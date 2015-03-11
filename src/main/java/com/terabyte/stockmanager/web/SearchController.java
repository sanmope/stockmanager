package com.terabyte.stockmanager.web;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.model.Product;
import com.terabyte.stockmanager.service.ClientService;
import com.terabyte.stockmanager.service.ProductService;


@Controller
@SessionAttributes
public class SearchController {

	

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ClientService clientService;
	
    @RequestMapping(value = "/searchProduct.htm", method = RequestMethod.POST)
    public ModelAndView addContact(@ModelAttribute("command") Product product, BindingResult result, ServletRequest request) throws SQLException
    {

        if (WebUtils.hasSubmitParameter(request , "Reset"))
        {
            return new ModelAndView("search", "command", new Product());
        }

        List<Product> products = sessionFactory.getCurrentSession().
		createQuery("FROM Product where name like'%" + product.getName() +"%'").list();
		ModelAndView mav = new ModelAndView("search");
		mav.addObject("products", products);
        return mav;
    }
    
    @RequestMapping(value = "/searchClient.htm", method = RequestMethod.POST)
    public ModelAndView addContact(@ModelAttribute("command") Client client, BindingResult result, ServletRequest request) throws SQLException
    {

        if (WebUtils.hasSubmitParameter(request , "Reset"))
        {
            return new ModelAndView("search", "command", new Client());
        }

        List<Client> clients = sessionFactory.getCurrentSession().
		createQuery("FROM Client where name like'%" + client.getName() +"%'").list();
		ModelAndView mav = new ModelAndView("search");
		mav.addObject("clients", clients);
        return mav;
    }

    @RequestMapping("/search.htm")
    public ModelAndView show() throws SQLException
    {       
    	ModelAndView modelAndView = new ModelAndView("search");
    	modelAndView.addObject("products",productService.listProducts());
    	modelAndView.addObject("clients",clientService.listClients());
    	return modelAndView;
    }


 }