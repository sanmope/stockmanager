package com.terabyte.stockmanager.model;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Calendar;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Job {

	@Id @GeneratedValue
	private long id;
	@ManyToOne
	private Client client;
	@ManyToOne
	private Device device;
	@OneToMany
	@JoinColumn(name="job_id")
	private List<ProductItem> productItems;
	@OneToMany(cascade = {CascadeType.ALL} )
	@JoinColumn(name="job_id")
	private List<JobDetail> jobDetails;
	private String description;
	private Boolean presupuestado;
	private Boolean reparado;
	private Boolean entregado;
	private Calendar fechaEntregado;
	private Calendar fechaReparado;
	private Calendar fechaPresupuestado;
	private Calendar fechaOrdenTrabajo;

	public Calendar getFechaOrdenTrabajo() {
		return fechaOrdenTrabajo;
	}

	public void setFechaOrdenTrabajo(Calendar fechaOrdenTrabajo) {
		this.fechaOrdenTrabajo = fechaOrdenTrabajo;
	}

	public Calendar getFechaEntregado() {
		return fechaEntregado;
	}

	public void setFechaEntregado(Calendar fechaEntregado) {
		this.fechaEntregado = fechaEntregado;
	}

	public Calendar getFechaReparado() {
		return fechaReparado;
	}

	public void setFechaReparado(Calendar fechaReparado) {
		this.fechaReparado = fechaReparado;
	}

	public Calendar getFechaPresupuestado() {
		return fechaPresupuestado;
	}

	public void setFechaPresupuestado(Calendar fechaPresupuestado) {
		this.fechaPresupuestado = fechaPresupuestado;
	}

	
	
	public Boolean getPresupuestado() {
		return presupuestado;
	}

	public void setPresupuestado(Boolean presupuestado) {
		this.presupuestado = presupuestado;
	}

	public Boolean getReparado() {
		return reparado;
	}

	public void setReparado(Boolean reparado) {
		this.reparado = reparado;
	}

	public Boolean getEntregado() {
		return entregado;
	}

	public void setEntregado(Boolean entregado) {
		this.entregado = entregado;
	}


	

	public void setId(long id) {
		this.id = id;
	}

	public long getId() {
		return id;
	}
	
	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Device getDevice() {
		return device;
	}

	public void setDevice(Device device) {
		this.device = device;
	}

	public List<ProductItem> getProductItems() {
		return productItems;
	}

	public void setProductItems(List<ProductItem> productItems) {
		this.productItems = productItems;
	}

	public List<JobDetail> getJobDetails() {
		return jobDetails;
	}

	public void setJobDetails(List<JobDetail> jobDetails) {
		this.jobDetails = jobDetails;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}

