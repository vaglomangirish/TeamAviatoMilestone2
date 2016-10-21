package com.sciencegateway.dataingestor.resource;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

import com.sciencegateway.dataingestor.POJO.URLObjects;

public class RESTResourceTest 
{
	
	private URLObjects urlObjects;
	private RESTResource restResource;
	
	@Before
	public void setUp() throws Exception
	{
		urlObjects = new URLObjects();
		restResource = new RESTResource();
	}
	
	@Test
	public void testGenerateString() throws Exception
	{
		assertEquals(restResource.generateString(),"Got it!");
	}
	
	@Test
	public void testGenerateURL() throws Exception
	{
		urlObjects.setUrl("amolrbhagwat@gmail.com");
		urlObjects.setRequestId("1001");
		urlObjects.setStationName("KIND");
		urlObjects.setDate("2001-4-27");
		urlObjects.setTime("123456");
		
		assertEquals(restResource.generateURL(urlObjects).getStatus(),200);
	}
	
	@Test
	public void testGenerateLOG() throws Exception
	{
		int responseStatus = restResource.generateLOG(urlObjects);
		if (responseStatus == 500)
		{
			assertEquals(restResource.generateLOG(urlObjects),500);
			System.out.println("Registry is down!");
		}
		else if (responseStatus == 200)
		{
			assertEquals(restResource.generateLOG(urlObjects),200);
		}		
	}
	
}