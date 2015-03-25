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
	
	
	@RequestMapping(value="/newJob", method=RequestMethod.POST)
	public ModelAndView newJob(Client client,Job job, Errors errors){
		if (errors.hasErrors())	{

		}
		
		ModelAndView modelAndView = new ModelAndView("Job");
		modelAndView.addObject("errors", errors);
		return modelAndView;

	}
	
	@RequestMapping(value="/listJobByClient", method=RequestMethod.GET)
	public ModelAndView listJob(Long id){
		
		Client client = clientService.getClientById(id);
/*		Job job = jobService.listJobsByClient(client).get(1);
		job.setFechaPresupuestado(Calendar.getInstance());
		jobService.update(job);*/
		List<Job> jobList = jobService.listJobsByClient(client);
		ModelAndView modelAndView = new ModelAndView("job");
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

