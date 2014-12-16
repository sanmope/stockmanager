package com.terabyte.stockmanager.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.service.ClientService;
import com.terabyte.stockmanager.service.ClientServiceImpl;

@Controller
public class ClientController {

	@Autowired
	private ClientService clientservice;
	
	public ClientController() {
		// TODO Auto-generated constructor stub
//		this.clientservice = new ClientServiceImpl()
	}

	@RequestMapping(value="/addClient.htm", method=RequestMethod.POST)
	public ModelAndView addClient(Client client, Errors errors)
	{
		if (errors.hasErrors())
		{
			ModelAndView modelAndView = new ModelAndView("addClient");
			modelAndView.addObject("errors", errors);
			return modelAndView;
		}
		
		clientservice.create(client);	
		List<Client> clients = clientservice.listClients();
		ModelAndView modelAndView =  new ModelAndView("redirect:/allClents.htm");
		modelAndView.addObject("clients", clients );
		return modelAndView;
	}

	@RequestMapping(value="/addClient.htm")
	public String addClient()
	{
		return "addClient";
	}

	
	
	@RequestMapping("/allClients.htm")
	public ModelAndView allClients()
	{
		List<Client> clients = clientservice.listClients();
		
		ModelAndView modelAndView = new ModelAndView("allClients");
		modelAndView.addObject("clients", clients);
		return modelAndView;
	}
	
	
	
	@RequestMapping(value="/editClient.htm", method=RequestMethod.GET)
	public ModelAndView editClient()
	{
		List<Client> clients = clientservice.listClients();
			
			ModelAndView modelAndView = new ModelAndView("editClient");
			modelAndView.addObject("client", clients.get(0));
			return modelAndView;
	}
	
	@RequestMapping(value="/editClient.htm", method=RequestMethod.POST)
	public ModelAndView editClient(Client client, Errors errors)
	{
		if (errors.hasErrors())
		{
			ModelAndView modelAndView = new ModelAndView("editClient");
			modelAndView.addObject("errors", errors);
			return modelAndView;
		}
		clientservice.update(client);	
		return new ModelAndView("redirect:/allClients.htm");
	}

}
