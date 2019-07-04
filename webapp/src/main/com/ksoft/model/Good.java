package com.ksoft.model;

import com.ksoft.interfaces.*;

public class Good implements IGood	{
	private int categoryId;
	private int goodId;
	private int brandId;
	private String brandName;
	private int isNew;
	private String name;
	private float price;
	private float discountPrice;
	private int bonuses;
	private int imageId;
 
	
	
	public int getCategoryId(){
		return categoryId;
	}
	public int getGoodId(){
		return goodId;
	}
	public int getBrandId(){
		return brandId;
	}
	public String getBrandName(){
		return brandName;
	}
	public int getIsNew(){
		return isNew;
	}
	public String getName(){
		return name;
	}
	public float getPrice(){
		return price;
	}
	public float getDiscountPrice(){
		return discountPrice;
	}
	public int getBonuses(){
		return bonuses;
	}
	public int getImageId(){
		return imageId;
	}
	
	
	
	public void setCategoryId(int newCategoryId){
		categoryId = newCategoryId;
	}
	public void setGoodId(int newGoodId){
		goodId = newGoodId;
	}
	public void setBrandId(int newBrandId){
		brandId = newBrandId;
	}
	public void setBrandName(String newBrandName){
		brandName = newBrandName;
	}
	public void setIsNew(int newIsNew){
		isNew = newIsNew;
	}
	public void setName(String newName){
		name = newName;
	}
	public void setPrice(float newPrice){
		price = newPrice;
	}
	public void setDiscountPrice(float newDiscountPrice){
		discountPrice = newDiscountPrice;
	}
	public void setBonuses(int newBonuses){
		bonuses = newBonuses;
	}
	public void setImageId(int newImageId){
		imageId = newImageId;
	}
	

}