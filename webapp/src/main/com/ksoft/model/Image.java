package com.ksoft.model;


public class Image	{
	private byte[] image;
	private int imgLen;
	
	
	
	public byte[] getImage(){
		return image;
	}
	public int getImgLen(){
		return imgLen;
	}
	
	
		
	public void setImage(byte[] newImage){
		image = newImage;
	}
	public void setImgLen(int newImgLen){
		imgLen = newImgLen;
	}
	
	
}