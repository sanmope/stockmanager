package com.terabyte.stockmanager.web;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.terabyte.stockmanager.model.Person;

@Controller
public class PersonController {

	@Autowired
	private SessionFactory sessionFactory;

	@RequestMapping(value="/addPerson.htm", method=RequestMethod.POST)
	public ModelAndView addPerson(Person person, Errors errors)
	{
		if (errors.hasErrors())
		{
			ModelAndView modelAndView = new ModelAndView("addPerson");
			modelAndView.addObject("errors", errors);
			return modelAndView;
		}
		
		sessionFactory.getCurrentSession().save(person);	
		return new ModelAndView("redirect:/allPersons.htm");
	}

	@RequestMapping(value="/addPerson.htm")
	public String addPerson()
	{
		return "addPerson";
	}

	
	
	@RequestMapping("/allPersons.htm")
	public ModelAndView allPersons()
	{
		List<Person> persons = sessionFactory.getCurrentSession().
			createQuery("FROM Person").list();
		
		ModelAndView modelAndView = new ModelAndView("allPersons");
		modelAndView.addObject("persons", persons);
		return modelAndView;
	}
	
	
	
	@RequestMapping(value="/editPerson.htm", method=RequestMethod.GET)
	public ModelAndView editPerson()
	{
		List<Person> persons = sessionFactory.getCurrentSession().
				createQuery("FROM Person").list();
			
			ModelAndView modelAndView = new ModelAndView("editPerson");
			modelAndView.addObject("person", persons.get(0));
			return modelAndView;
	}
	
	@RequestMapping(value="/editPerson.htm", method=RequestMethod.POST)
	public ModelAndView editPerson(Person person, Errors errors)
	{
		if (errors.hasErrors())
		{
			ModelAndView modelAndView = new ModelAndView("editPerson");
			modelAndView.addObject("errors", errors);
			return modelAndView;
		}
		sessionFactory.getCurrentSession().update(person);	
		return new ModelAndView("redirect:/allPersons.htm");
	}

}
