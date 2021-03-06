package com.terabyte.stockmanager.model;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Product {

	@Id @GeneratedValue
	private long id;
	private Integer barcode;
	private String name;
	private Integer quantity;
	private BigDecimal price;
	private BigDecimal cost;
	private String description;

	
	public void setBarcode(Integer barcode) {
		this.barcode = barcode;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;

	}
	

	
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
	
	public BigDecimal getPrice() {
	        return price;
    }
    
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    
    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append("Description: " + description + ";");
        buffer.append("Price: " + price);
        return buffer.toString();
    }
	public BigDecimal getCost() {
		return cost;
	}
	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}
	public int getBarcode() {
		return barcode;
	}
	public void setBarcode(int barcode) {
		this.barcode = barcode;
	}
	public void decreaseQuantity(Integer quantity) {
		
		setQuantity( getQuantity() - quantity ); 
	}
	
}
