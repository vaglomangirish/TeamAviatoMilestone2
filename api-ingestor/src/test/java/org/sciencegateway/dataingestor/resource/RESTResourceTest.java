package org.sciencegateway.dataingestor.resource;

import static org.junit.Assert.assertEquals;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.mockito.Mockito;
import org.sciencegateway.dataingestor.POJO.URLObjects;
import org.sciencegateway.dataingestor.service.URLConverter;

public class RESTResourceTest 
{

//	@Test
//	public void testGenerateURL() throws ParseException, SQLException, IOException
//	{
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		Date mockDate = Mockito.mock(Date.class);
//		mockDate = format.parse("1992-8-26");
//		URLObjects mockURLObjects = Mockito.mock(URLObjects.class);
//		mockURLObjects.setDate(mockDate);
//		mockURLObjects.setStationName("KLMN");
//		mockURLObjects.setTime("172739");
//		URLConverter mockURLConverter = Mockito.mock(URLConverter.class);
//		Mockito.when(mockURLConverter.getURL(mockURLObjects)).thenReturn("https://noaa-nexrad-level2.s3.amazonaws.com/1992/8/26/KLMN/KLMN1992826_172739.gz");
//		
//		RESTResource restResource = new RESTResource();
//		String url = restResource.generateURL("KLMN", "1992-8-26", "172739");
//		assertEquals(url,"https://noaa-nexrad-level2.s3.amazonaws.com/1992/8/26/KLMN/KLMN1992826_172739.gz");
//	}
	
}
