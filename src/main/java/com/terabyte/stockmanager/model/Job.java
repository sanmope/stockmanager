package com.terabyte.stockmanager.model;

import java.math.BigDecimal;
import java.util.ArrayList;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


public class Job {

	@Id @GeneratedValue
	private long id;
	@ManyToOne
	private Client client;
	@ManyToOne
	private Device device;
	@OneToMany
	private ArrayList<ProductItem> productItems;
	@OneToMany
	private ArrayList<JobDetail> jobDetails;
	
	public void setId(long id) {
		this.id = id;
	}

	public long getId() {
		return id;
	}
	
	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Device getDevice() {
		return device;
	}

	public void setDevice(Device device) {
		this.device = device;
	}

	public ArrayList<ProductItem> getProductItems() {
		return productItems;
	}

	public void setProductItems(ArrayList<ProductItem> productItems) {
		this.productItems = productItems;
	}

	public ArrayList<JobDetail> getJobDetails() {
		return jobDetails;
	}

	public void setJobDetails(ArrayList<JobDetail> jobDetails) {
		this.jobDetails = jobDetails;
	}



	public void addProduct(Product product, BigDecimal quantity) {
		productItems.add(new ProductItem(product, quantity));
		product.decreaseQuantity(quantity);
	}

}

