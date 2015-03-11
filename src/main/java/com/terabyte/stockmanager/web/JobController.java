package com.terabyte.stockmanager.web;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.terabyte.stockmanager.model.Client;
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
	
	@RequestMapping("/newJob.htm")
	public ModelAndView newJob() {
		return new ModelAndView("newJob");
	}
	
	@RequestMapping(value="newJob", method=RequestMethod.POST)
	public ModelAndView newJob(Integer client,Job job, Errors errors){
		if (errors.hasErrors())	{
			
		ModelAndView modelAndView = new ModelAndView("Job");
		modelAndView.addObject("errors", errors);
		return modelAndView;
		}
	List<Job> jobList = clientService.listJobsOfClient(clientService.getClientById((long) 1));
	ModelAndView modelAndView = new ModelAndView("redirect:/jobByClient.htm");
	return modelAndView.addObject("jobList",jobList);
	}
	

	@RequestMapping("/job.htm")
	public ModelAndView job() {
		return new ModelAndView("job");
	}
	
	

}

