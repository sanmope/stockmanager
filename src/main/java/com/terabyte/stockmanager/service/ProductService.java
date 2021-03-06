package com.terabyte.stockmanager.service;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.ejb.criteria.ValueHandlerFactory.BigDecimalValueHandler;

import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.model.Job;
import com.terabyte.stockmanager.model.Product;

public interface ProductService {

	void create(Product product);
	void update(Product product);
	void remove(Product product);

	List<Product> listByName(String name);
	List<Product> listProducts();
	List<Product> incricePrice(BigDecimal percentage);
	Product getProductById(Long productid);
	List<String> getName(String name);
}
