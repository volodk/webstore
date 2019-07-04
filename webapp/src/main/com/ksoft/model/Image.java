package com.ksoft.model;

import com.ksoft.interfaces.*;

public class Image implements IImage {
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