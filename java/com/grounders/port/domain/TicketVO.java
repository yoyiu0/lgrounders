package com.grounders.port.domain;

import java.util.Date;

public class TicketVO {
	
	private String ticketNo;
	private String id;
	private String seat1;
	private String seat2;
	private String seat3;
	private Integer gameNo;
	private String state;
	private int cancel;
	private int price;
	private int count;
	private Date buyDate;
	

	public Date getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTicketNo() {
		return ticketNo;
	}
	public void setTicketNo(String ticketNo) {
		this.ticketNo = ticketNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSeat1() {
		return seat1;
	}
	public void setSeat1(String seat1) {
		this.seat1 = seat1;
	}
	public String getSeat2() {
		return seat2;
	}
	public void setSeat2(String seat2) {
		this.seat2 = seat2;
	}
	public String getSeat3() {
		return seat3;
	}
	public void setSeat3(String seat3) {
		this.seat3 = seat3;
	}
	public Integer getGameNo() {
		return gameNo;
	}
	public void setGameNo(Integer gameNo) {
		this.gameNo = gameNo;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getCancel() {
		return cancel;
	}
	public void setCancel(int cancel) {
		this.cancel = cancel;
	}
	
	private String gameName;
	private String stadium;
	private Date startDate;
	private Date gameDate;
	private int age;
	
	public String getGameName() {
		return gameName;
	}
	public void setGameName(String gameName) {
		this.gameName = gameName;
	}
	public String getStadium() {
		return stadium;
	}
	public void setStadium(String stadium) {
		this.stadium = stadium;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getGameDate() {
		return gameDate;
	}
	public void setGameDate(Date gameDate) {
		this.gameDate = gameDate;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
}
