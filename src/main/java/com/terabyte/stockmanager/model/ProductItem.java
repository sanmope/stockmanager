package com.terabyte.stockmanager.model;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class ProductItem {

	@Id @GeneratedValue
	private long id;
	@ManyToOne
	private Product product;
	private BigDecimal quantity;
	private BigDecimal price;
	
	public ProductItem(Product product, BigDecimal quantity) {
		this.product = product;
		this.quantity = quantity;
	}
	
}
