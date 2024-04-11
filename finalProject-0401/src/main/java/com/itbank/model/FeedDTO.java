package com.itbank.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FeedDTO {

	private int idx;
	private String title;
	private String writer;
	private String maintext;
	private String image;
	private String category;
	private String choice;
	private Date write_date;
	private String originalFileName;
	private String storedFileName;
	private int likeStatus;
	private int heart_count;
	
	private List<MultipartFile> upload;
	
	
	public int getLikeStatus() {
		return likeStatus;
	}
	public void setLikeStatus(int likeStatus) {
		this.likeStatus = likeStatus;
	}
	public int getHeart_count() {
		return heart_count;
	}
	public void setHeart_count(int heart_count) {
		this.heart_count = heart_count;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMaintext() {
		return maintext;
	}
	public void setMaintext(String maintext) {
		this.maintext = maintext;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getChoice() {
		return choice;
	}
	public void setChoice(String choice) {
		this.choice = choice;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
	
	
}
