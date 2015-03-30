package com.terabyte.stockmanager.web;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.model.Device;
import com.terabyte.stockmanager.model.Job;
import com.terabyte.stockmanager.model.JobDetail;
import com.terabyte.stockmanager.service.ClientService;
import com.terabyte.stockmanager.service.JobService;
import com.terabyte.stockmanager.service.ProductService;
@Controller
public class JobController {
		
	@Autowired
	private JobService jobService;
	
	@Autowired
	private ClientService clientService;
	
	 @RequestMapping(value="/job.htm" ,  method = RequestMethod.GET)
	    public String job(Model model) {
	        model.addAttribute("job", new Job());
	        model.addAttribute("device", new Device());
	        return "job";
	    }
	 
	 @RequestMapping(value= "job/add.htm", method = RequestMethod.POST)
	    public String addJob(@ModelAttribute("job") Job job,@RequestParam String action){
	         
	        if(action.equals("Agregar Orden")){
	            jobService.create(job);
	        }else{
	            jobService.update(job);
	        }
	         
	        return "redirect:/job.htm";
	         
	    } 
	 
	
	@RequestMapping(value="/listJobByClient", method=RequestMethod.GET)
	public ModelAndView listJob(Long id){
		
		Client client = clientService.getClientById(id);
		List<Job> jobList = jobService.listJobsByClient(client);
		ModelAndView modelAndView = new ModelAndView("job");
		modelAndView.addObject("job", new Job());
		modelAndView.addObject("jobList", jobList);
		modelAndView.addObject("client", client);			
		return modelAndView;

	}

	/*@RequestMapping(value = "/listJobByClient.htm",  method = RequestMethod.GET)
    public @ResponseBody ModelAndView listJobByClient(@RequestParam("term") String query) {
		
		System.out.println("ID de Cliente" + query);
		ModelAndView modelAndView = new ModelAndView("job");
		Client client = clientService.getClientById(new Long(query));
		List<Job> jobList = jobService.listJobsByClient(client);
		modelAndView.addObject("jobList", jobList);
		modelAndView.addObject("client", client);			

		return modelAndView;
    }*/

	
	@RequestMapping("/job.htm")
	public ModelAndView job() {
		return new ModelAndView("job");
	}
	
	

}

