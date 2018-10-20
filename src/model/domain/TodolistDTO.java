package model.domain;

public class TodolistDTO {
	
	private int id;
	private String title;
	private int day;
	
	
	public TodolistDTO(String string, String string2, String string3) {
		// TODO Auto-generated constructor stub
	}
	
	public TodolistDTO() {};
	public TodolistDTO(int id,  String title, int day) {
		super();
		this.id=id;
		this.title=title;
		this.day=day;
	
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}
	
	
	
	
	
	
	
	

}
