package com.terabyte.stockmanager.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class JobDetail {
	
	@Id @GeneratedValue
	private long id;
	private Job job;
	String description;
	Date date;
	
	
	public JobDetail (String description,Job job){
		this.description = description;
		this.date = new Date();
		this.job = job;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public Job getJob() {
		return job;
	}


	public void setJob(Job job) {
		this.job = job;
	}
	
	
}
