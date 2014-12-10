package com.terabyte.stockmanager.service;

import java.io.Serializable;
import java.util.List;

import com.terabyte.stockmanager.model.Product;


public interface ProductManager extends Serializable{

	
    public void increasePrice(int percentage);
    
    public List<Product> getProducts();
    
}