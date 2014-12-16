package com.terabyte.stockmanager.service;


import java.math.BigDecimal;
import java.util.List;

import javafx.util.converter.PercentageStringConverter;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.terabyte.stockmanager.model.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void create(Product product) {
		sessionFactory.getCurrentSession().save(product);	
		
	}

	public List<Product> listByName(String name) {
		List<Product> products = sessionFactory.getCurrentSession().
		createQuery("FROM Product where name='" + name +"'").list();
		return products;
	}
	
	public List<Product> listProducts() {
		List<Product> products = sessionFactory.getCurrentSession().
		createQuery("FROM Product").list();
		return products;
	}
	
	public List<Product> incricePrice(BigDecimal precentage){
	
		List<Product> products = listProducts();
	
		if (products != null) {
	        for (Product product : products) {
		        if (product.getPrice() == null){
		        	product.setPrice(BigDecimal.ZERO);
		        }
	        	BigDecimal newPrice = product.getPrice().multiply(precentage);
		        product.setPrice(newPrice);
		    }
		}
		return products;
	}
}
