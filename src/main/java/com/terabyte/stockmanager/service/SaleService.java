package com.terabyte.stockmanager.service;

import java.util.List;

import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.model.Job;
import com.terabyte.stockmanager.model.ProductItem;
import com.terabyte.stockmanager.model.Sale;

public interface SaleService {

	void create(Sale sale);
	void update(Sale sale);
	void remove(Sale sale);
	
	List<Sale> listSales();
	List<Sale> listSalesByClient(Client client);
	List<ProductItem> ProductItems (Sale sale);
	Sale getSaleById(Long id);
	
}
