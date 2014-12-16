package com.terabyte.stockmanager.service;

import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.model.Job;


public interface JobService {

	void create(Job job, Integer clientid);

}
