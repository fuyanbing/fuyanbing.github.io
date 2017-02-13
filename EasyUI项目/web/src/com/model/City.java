package com.model;

public class City {
	private int id ;
	private String name;
	private int pro_id;
	
	public City() {
		super();
	}
	public City(int id, String name, int pro_id) {
		super();
		this.id = id;
		this.name = name;
		this.pro_id = pro_id;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	
	
}
