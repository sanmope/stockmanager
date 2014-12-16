package com.terabyte.stockmanager.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.model.Job;
import com.terabyte.stockmanager.service.ClientService;
import com.terabyte.stockmanager.service.JobService;
import com.terabyte.stockmanager.service.ProductService;


@Controller
public class JobController {
	
	@Autowired
	private JobService jobService;
	
	@Autowired
	private ClientService clientService;
	
	@RequestMapping("/newJob.htm")
	public ModelAndView newProduct() {
		return new ModelAndView("newJob");
	}
	
	@RequestMapping(value="newJob", method=RequestMethod.POST)
	public ModelAndView newJob(Integer client,Job job, Errors errors){
		
		if (errors.hasErrors())
		{
			ModelAndView modelAndView = new ModelAndView("newJob");
			modelAndView.addObject("errors", errors);
			return modelAndView;
		}
		
		
		jobService.create(job,client);
		List<Job> jobList =  clientService.listJobsOfClient(clientService.getClientById(client));
		ModelAndView modelAndView = new ModelAndView("redirect:/jobByClient.htm");
		return modelAndView.addObject("jobList",jobList);
		
	}


}
