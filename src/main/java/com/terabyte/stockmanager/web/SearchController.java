package com.terabyte.stockmanager.web;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.terabyte.stockmanager.model.Product;


@Controller
@SessionAttributes
public class SearchController {

	@Autowired
	private SessionFactory sessionFactory;
	
    @RequestMapping(value = "/search.htm", method = RequestMethod.POST)
    public ModelAndView addContact(@ModelAttribute("command") Product p, BindingResult result, ServletRequest request) throws SQLException
    {

        if (WebUtils.hasSubmitParameter(request , "Reset"))
        {
            return new ModelAndView("search", "command", new Product());
        }

        List<Product> products = sessionFactory.getCurrentSession().
		createQuery("FROM Product where name like'%" + p.getName() +"%'").list();
		ModelAndView mav = new ModelAndView("search");
		mav.addObject("products", products);
        return mav;
    }

    @RequestMapping("/search.htm")
    public ModelAndView showContacts() throws SQLException
    {       
       return new ModelAndView("search", "command", new Product());
    }


}