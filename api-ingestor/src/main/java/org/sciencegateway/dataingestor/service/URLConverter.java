package org.sciencegateway.dataingestor.service;

import java.net.MalformedURLException;
import java.util.Calendar;

import org.sciencegateway.dataingestor.POJO.URLObjects;

public class URLConverter 
{
	
	public String getURL(URLObjects urlObjects) throws MalformedURLException
	{
		String filename;
		Calendar calender = Calendar.getInstance();
		calender.setTime(urlObjects.getDate());
		int year = calender.get(Calendar.YEAR);
		int month = calender.get(Calendar.MONTH)+1;
		int day = calender.get(Calendar.DAY_OF_MONTH);	
		if (year >= 2015)
			filename = urlObjects.getStationName()+year+month+day+"_"+urlObjects.getTime()+"_V06.gz";
		else
			filename = urlObjects.getStationName()+year+month+day+"_"+urlObjects.getTime()+".gz";	
		String url = "https://noaa-nexrad-level2.s3.amazonaws.com/"+year+"/"+month+"/"+day+"/"+urlObjects.getStationName()+"/"+filename;
		return url;
	}
}

