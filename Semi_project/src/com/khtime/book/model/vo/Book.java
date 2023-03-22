package com.khtime.book.model.vo;

public class Book {
	private int bookNo;
	private int seller;
	private String bookName;
	private int price;
	private String author;
	private String publisher;
	private String isNoted;
	private int conditon;
	private String isDirect;
	private String location;
	private String isSoldout;
	private String status;
	
	public Book() {
		super();
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

	public int getConditon() {
		return conditon;
	}

	public void setConditon(int conditon) {
		this.conditon = conditon;
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

	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", seller=" + seller + ", bookName=" + bookName + ", price=" + price
				+ ", author=" + author + ", publisher=" + publisher + ", isNoted=" + isNoted + ", conditon=" + conditon
				+ ", isDirect=" + isDirect + ", location=" + location + ", isSoldout=" + isSoldout + ", status="
				+ status + "]";
	}
	
	
	
	
}
