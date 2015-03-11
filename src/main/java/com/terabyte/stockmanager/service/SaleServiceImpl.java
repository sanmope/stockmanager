package com.terabyte.stockmanager.service;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.stereotype.Service;

import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.model.ProductItem;
import com.terabyte.stockmanager.model.Sale;

@Service
public class SaleServiceImpl implements SaleService{

	@Autowired
	private SessionFactory sessionFactory;
	
	public void create(Sale sale) {
		sessionFactory.getCurrentSession().save(sale);	
		
	}
	public void remove(Sale sale) {
		sessionFactory.getCurrentSession().delete(sale);	
		
	}
	public void update(Sale sale) {
		sessionFactory.getCurrentSession().update(sale);	
		
	}

	public List<Sale> listSales(){
		List<Sale> sales = sessionFactory.getCurrentSession().
		createQuery("FROM Sale").list();
		return sales;
		
	}
	
	public List<ProductItem> ProductItems (Sale sale){
		List<ProductItem> productItems = sessionFactory.getCurrentSession().
		createQuery("FROM ProductItem where sale_id = " + sale.getId()).list();
		return productItems;
		
	}
	

	public Sale getSaleById(Long saleId){
		return (Sale) sessionFactory.getCurrentSession().get(Sale.class,saleId);

	}	
	
	public List<Sale> listSalesByClient(Client client){
		List<Sale> sales = sessionFactory.getCurrentSession().
		createQuery("FROM Sale where client_id = " + client.getId()).list();
		return sales;
		
	}
	
}
