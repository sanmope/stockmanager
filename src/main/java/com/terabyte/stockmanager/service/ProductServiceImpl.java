package com.terabyte.stockmanager.service;


import java.math.BigDecimal;
import java.util.ArrayList;
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
	public void remove(Product product) {
		sessionFactory.getCurrentSession().delete(product);	
		
	}
	public void update(Product product) {
		sessionFactory.getCurrentSession().update(product);	
		
	}

	public List<Product> listByName(String name) {
		List<Product> products = sessionFactory.getCurrentSession().
		createQuery("FROM Product where name like '%" + name +"%' ORDER BY name,name ASC").list();
		return products;
	}
	
	public List<Product> listProducts() {
		List<Product> products = sessionFactory.getCurrentSession().
		createQuery("FROM Product ORDER BY name,name ASC").list();
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
	public Product getProductById(Long productId){
		return (Product) sessionFactory.getCurrentSession().get(Product.class,productId);

	}
	
	public List<String> getName(String name){
		
		List<String> returnMatchName =  sessionFactory.getCurrentSession().createSQLQuery("Select name From product where name like '%" + name +"%'").list();
		for (String string : returnMatchName){
			System.out.println(string);
		}
		return returnMatchName;
		
	}
}
