package org.sciencegateway.dataingestor.service;

import java.net.MalformedURLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.sciencegateway.dataingestor.POJO.URLObjects;

public class URLConverter 
{
	
	public URLObjects getURL(URLObjects urlObjects) throws MalformedURLException, ParseException
	{
		String filename;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    Date date = format.parse(urlObjects.getDate());
		Calendar calender = Calendar.getInstance();
		calender.setTime(date);
		int year = calender.get(Calendar.YEAR);
		int month = calender.get(Calendar.MONTH)+1;
		int day = calender.get(Calendar.DAY_OF_MONTH);	
		if (year >= 2015)
			filename = urlObjects.getStationName()+year+month+day+"_"+urlObjects.getTime()+"_V06.gz";
		else
			filename = urlObjects.getStationName()+year+month+day+"_"+urlObjects.getTime()+".gz";	
		urlObjects.setFilename(filename);
		String url = "https://noaa-nexrad-level2.s3.amazonaws.com/"+year+"/"+month+"/"+day+"/"+urlObjects.getStationName()+"/"+urlObjects.getFilename();
		urlObjects.setUrl(url);
		return urlObjects;
	}
}

