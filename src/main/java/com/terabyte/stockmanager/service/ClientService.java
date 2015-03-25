package com.terabyte.stockmanager.service;

import java.util.List;

import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.model.Job;
import com.terabyte.stockmanager.model.Product;

public interface ClientService {
	
	public void create(Client client);
	public void update(Client client);
    public void remove(Client client);

	List<Client> listByName(String name);
	List<Client> listClients();
	Client getClientById(Long clientid);
	
}

