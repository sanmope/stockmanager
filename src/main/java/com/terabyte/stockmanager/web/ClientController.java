package com.terabyte.stockmanager.web;

import java.util.HashMap;
import java.util.List;

import org.hibernate.mapping.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.model.Product;
import com.terabyte.stockmanager.service.ClientService;


@Controller
public class ClientController {

	@Autowired
	private ClientService clientService;
	
	 @RequestMapping(value="/clients.htm" ,  method = RequestMethod.GET)
	    public String listClients(Model model) {
	        model.addAttribute("client", new Client());
	        model.addAttribute("listClients", clientService.listClients());
	        model.addAttribute("map",  new HashMap<String, String>());
	        return "client";
	    }
	
	 @RequestMapping(value= "client/add.htm", method = RequestMethod.POST)
	    public String addClient(@ModelAttribute("client") Client client){
	         
	        if(client.getId() == 0){
	            clientService.create(client);
	        }else{
	            clientService.update(client);
	        }
	         
	        return "redirect:/clients.htm";
	         
	    } 
	 
	 @RequestMapping("client/remove.htm")
 	public ModelAndView removeClient (@RequestParam int id) { 
		 clientService.remove(clientService.getClientById(new Long(id)));
		 return new ModelAndView("redirect:/clients.htm");
	 	}
	
	 @RequestMapping(value="client/edit.htm", method= RequestMethod.GET	)
	    public ModelAndView editClient(@RequestParam int id,  
	    @ModelAttribute Client c) {
			 HashMap<String, String> map = new HashMap<String, String>();
	
			 map.put("Herbology", "book Herbology"); 
			 map.put("Quidditch", "book Quidditch"); 

		    Client client = clientService.getClientById(new Long(id));
		    ModelAndView modelAndView = new ModelAndView();
		    modelAndView.addObject("map",map);
		    modelAndView.setViewName("client");
		    modelAndView.addObject("client", client);
		    return modelAndView;
	    }     
    
	 @RequestMapping(value="/allClients.htm" ,  method = RequestMethod.GET)
	    public String allClients() {
	        return "allClients";
	    }
	 
		@RequestMapping(value = "/getClientList.htm",  method = RequestMethod.GET)
	    public @ResponseBody List getClientList(@RequestParam("term") String query) {
	        List clientList = clientService.listByName(query);
	        return clientList;
	    }
 
		@RequestMapping("client/{id}.htm")
		@ResponseBody
		public List<Client> getById(@PathVariable Long id) {
			return clientService.listClients();
		}
}
