package com.terabyte.stockmanager.service;

import java.util.List;

import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.model.Job;

public interface ClientService {
	
	void create(Client client);
	void update(Client client);
	
	List<Client> listByName(String name);
	List<Client> listClients();
	List<Job> listJobsOfClient (Client client);
	Client getClientById(Integer clientid);

}
