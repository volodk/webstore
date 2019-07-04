package com.ksoft.interfaces;

public interface IGood {

	public int getCategoryId();
	
	public int getGoodId();
	
	public int getBrandId();
	
	public String getBrandName();
	
	public int getIsNew();
	
	public String getName();
	
	public float getPrice();
	
	public float getDiscountPrice();
	
	public int getBonuses();
	
	public int getImageId();
	
	
	
	public void setCategoryId(int newCategoryId);
	
	public void setGoodId(int newGoodId);
	
	public void setBrandId(int newBrandId);
	
	public void setBrandName(String newBrandName);
	
	public void setIsNew(int newIsNew);
	
	public void setName(String newName);
	
	public void setPrice(float newPrice);
	
	public void setDiscountPrice(float newDiscountPrice);
	
	public void setBonuses(int newBonuses);
	
	public void setImageId(int newImageId);
		
}
