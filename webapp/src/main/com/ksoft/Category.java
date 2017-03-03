package com.ksoft;

public class Category	{
	private int categoryId;
	private int categoryPosition;
	private String categoryName;
	private int idParentCategory;
	private String parentCategoryName;
	
	
	
	public int getCategoryId(){
		return categoryId;
	}
	public int getCategoryPosition(){
		return categoryPosition;
	}
	public String getCategoryName(){
		return categoryName;
	}
	public int getIdParentCategory(){
		return idParentCategory;
	}
	public String getParentCategoryName(){
		return parentCategoryName;
	}
	
	
	
	
	public void setCategoryId(int newCategoryId){
		categoryId = newCategoryId;
	}
	public void setCategoryPosition(int newCategoryPosition){
		categoryPosition = newCategoryPosition;
	}
	public void setCategoryName(String newCategoryName){
		categoryName = newCategoryName;
	}
	public void setIdParentCategory(int newIdParentCategory){
		idParentCategory = newIdParentCategory;
	}
	public void setParentCategoryName(String newParentCategoryName){
		parentCategoryName = newParentCategoryName;
	}
		
}