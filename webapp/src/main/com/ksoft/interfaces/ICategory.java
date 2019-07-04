package com.ksoft.interfaces;

public interface ICategory {
	
	public int getCategoryId();
	
	public int getCategoryPosition();
	
	public String getCategoryName();
	
	public int getIdParentCategory();
	
	public String getParentCategoryName();
	
	
	public void setCategoryId(int newCategoryId);
	
	public void setCategoryPosition(int newCategoryPosition);
	
	public void setCategoryName(String newCategoryName);
	
	public void setIdParentCategory(int newIdParentCategory);
	
	public void setParentCategoryName(String newParentCategoryName);


}
