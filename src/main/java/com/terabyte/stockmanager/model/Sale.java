package com.terabyte.stockmanager.model;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Sale {

	@Id @GeneratedValue
	private Long id;
	@ManyToOne
	private Client client;
	@OneToMany(cascade = {CascadeType.ALL} )
	@JoinColumn(name="sale_id")
	private List<ProductItem> productItems;
	private BigDecimal total;
	private Boolean presale;

	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public List<ProductItem> getProductItems() {
		return productItems;
	}
	public void setProductItems(List<ProductItem> productItems) {
		this.productItems = productItems;
	}
		
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	public Boolean getPresale() {
		return presale;
	}
	public void setPresale(Boolean presale) {
		this.presale = presale;
	}


}
