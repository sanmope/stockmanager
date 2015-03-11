package com.terabyte.stockmanager.service;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.model.Job;
import com.terabyte.stockmanager.model.Product;

@Service
public class ClientServiceImpl implements ClientService {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void create(Client client){
		sessionFactory.getCurrentSession().persist(client);
		
	}
	
	public void remove(Client client){
		
		sessionFactory.getCurrentSession().delete(client);
		
	}
	
	public void update(Client client){
		sessionFactory.getCurrentSession().update(client);	
		
	}
	
	public List<Client> listByName(String name){
		List<Client> clients = sessionFactory.getCurrentSession().
		createQuery("FROM Client where name like '%" + name +"%'").list();
		return clients;
		
	}
	public List<Client> listClients(){
		List<Client> clients = sessionFactory.getCurrentSession().
		createQuery("FROM Client").list();
		return clients;
		
	}
	

	
	public List<Job> listJobsOfClient (Client client) {
		List<Job> jobs = sessionFactory.getCurrentSession().createQuery("FROM Job where clientid =" + client.getId() ).list();
		return jobs;
	}

	public Client getClientById(Long clientId){
		return (Client) sessionFactory.getCurrentSession().get(Client.class,clientId);

	}
	

}
