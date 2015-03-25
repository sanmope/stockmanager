package com.terabyte.stockmanager.model;

import java.math.BigDecimal;

import org.springframework.util.AutoPopulatingList;

public class ClassCommand {
	private String className = null;
	private AutoPopulatingList productItems = null;
	private AutoPopulatingList jobDetail = null;
	private BigDecimal saleTotal=null;
	private Long clientId=null;
 
 
	public String getClassName() {
		return className;
	}
 
	public void setClassName(String className) {
		this.className = className;
	}
 
	public AutoPopulatingList getProductItems() {
		return productItems;
	}
 
	public void setProductItems(AutoPopulatingList productItems) {
		this.productItems = productItems;
	}

	public void setJobDetail(AutoPopulatingList jobDetail) {
		this.jobDetail = jobDetail;
	}
	
	public AutoPopulatingList getJobDetail() {
		return jobDetail;
	}
	
	public BigDecimal getSaleTotal() {
		return saleTotal;
	}

	public void setSaleTotal(BigDecimal saleTotal) {
		this.saleTotal = saleTotal;
	}

	public Long getClientId() {
		return clientId;
	}

	public void setClientId(Long clientId) {
		this.clientId = clientId;
	}
}