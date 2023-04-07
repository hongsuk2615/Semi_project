package com.khtime.book.model.vo;

import java.sql.Date;

public class Book {
	private int bookNo;
	private int seller;
	private String bookName;
	private int price;
	private String author;
	private String publisher;
	private String isNoted;
	private int condition;
	private String isDirect;
	private String location;
	private String isSoldout;
	private String status; 
	private String publicationDate;
	private Date enrollDate;
	private String apiImg;
	
	private String titleImg;
	
	public Book() {
		super();
	}
	
	public String getTitleImg() {
		return titleImg;
	}
	
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	
	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public int getSeller() {
		return seller;
	}

	public void setSeller(int seller) {
		this.seller = seller;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getIsNoted() {
		return isNoted;
	}

	public void setIsNoted(String isNoted) {
		this.isNoted = isNoted;
	}

	public int getCondition() {
		return condition;
	}

	public void setCondition(int condition) {
		this.condition = condition;
	}

	public String getIsDirect() {
		return isDirect;
	}

	public void setIsDirect(String isDirect) {
		this.isDirect = isDirect;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getIsSoldout() {
		return isSoldout;
	}

	public void setIsSoldout(String isSoldout) {
		this.isSoldout = isSoldout;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getPublicationDate() {
		return publicationDate;
	}

	public void setPublicationDate(String publicationDate) {
		this.publicationDate = publicationDate;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	
	public String getApiImg() {
		return apiImg;
	}

	public void setApiImg(String apiImg) {
		this.apiImg = apiImg;
	}

	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", seller=" + seller + ", bookName=" + bookName + ", price=" + price
				+ ", author=" + author + ", publisher=" + publisher + ", isNoted=" + isNoted + ", condition="
				+ condition + ", isDirect=" + isDirect + ", location=" + location + ", isSoldout=" + isSoldout
				+ ", status=" + status + ", publicationDate=" + publicationDate + ", enrollDate=" + enrollDate
				+ ", apiImg=" + apiImg + ", titleImg=" + titleImg + "]";
	}
	
	
}
