package org.sciencegateway.dataingestor.service;

import java.net.MalformedURLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.junit.Test;
import org.mockito.Mockito;
import static org.junit.Assert.assertEquals;
import org.sciencegateway.dataingestor.POJO.URLObjects;

public class URLConverterTest 
{
	@Test
	public void testGetURL() throws MalformedURLException, ParseException
	{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date mockDate = Mockito.mock(Date.class);
		mockDate = format.parse("1992-8-26");
		URLObjects mockURLObjects = Mockito.mock(URLObjects.class);
		Calendar mockCalendar = Mockito.mock(Calendar.class);
		Mockito.when(mockURLObjects.getDate()).thenReturn(mockDate);
		Mockito.when(mockCalendar.get(Calendar.YEAR)).thenReturn(1992);
		Mockito.when(mockCalendar.get(Calendar.MONTH)).thenReturn(8);
		Mockito.when(mockCalendar.get(Calendar.DAY_OF_MONTH)).thenReturn(26);
		Mockito.when(mockURLObjects.getStationName()).thenReturn("KLMN");
		Mockito.when(mockURLObjects.getTime()).thenReturn("172739");
		
		URLConverter urlConverter = new URLConverter();
		String url1 = urlConverter.getURL(mockURLObjects);
		assertEquals(url1,"https://noaa-nexrad-level2.s3.amazonaws.com/1992/8/26/KLMN/KLMN1992826_172739.gz");
	}
	
	@Test
	public void testGetURLV06() throws ParseException, MalformedURLException
	{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date mockDate = Mockito.mock(Date.class);
		mockDate = format.parse("2015-8-26");
		URLObjects mockURLObjects = Mockito.mock(URLObjects.class);
		Calendar mockCalendar = Mockito.mock(Calendar.class);
		Mockito.when(mockURLObjects.getDate()).thenReturn(mockDate);
		Mockito.when(mockCalendar.get(Calendar.YEAR)).thenReturn(2015);
		Mockito.when(mockCalendar.get(Calendar.MONTH)).thenReturn(8);
		Mockito.when(mockCalendar.get(Calendar.DAY_OF_MONTH)).thenReturn(26);
		Mockito.when(mockURLObjects.getStationName()).thenReturn("KLMN");
		Mockito.when(mockURLObjects.getTime()).thenReturn("172739");
		
		URLConverter urlConverter = new URLConverter();
		String url1 = urlConverter.getURL(mockURLObjects);
		assertEquals(url1,"https://noaa-nexrad-level2.s3.amazonaws.com/2015/8/26/KLMN/KLMN2015826_172739_V06.gz");
	}	
}