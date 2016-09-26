package org.sciencegateway.dataingestor.resource;

import java.net.MalformedURLException;
import java.text.ParseException;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import org.glassfish.jersey.client.ClientConfig;
import org.json.JSONObject;
import org.sciencegateway.dataingestor.POJO.URLObjects;
import org.sciencegateway.dataingestor.service.URLConverter;

@Path("/service")
public class RESTResource 
{
	URLConverter urlConverter = new URLConverter();
	URLObjects urlObjects = new URLObjects();

	@POST
	@Path("/url")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response generateURL(URLObjects urlObjects)	
	{
		System.out.println("Receiving data from UI...");		
		System.out.println(urlObjects);
		System.out.println("Sending URL to Storm Detector...");
		try 
		{
			urlObjects = urlConverter.getURL(urlObjects);
			System.out.println(urlObjects);
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("requestId", urlObjects.getRequestId());
			jsonObject.put("userName", urlObjects.getUserName());
			jsonObject.put("url", urlObjects.getUrl());	
			System.out.println(jsonObject.toString());
			generateLOG(urlObjects);
			return Response.ok(jsonObject.toString(), MediaType.APPLICATION_JSON).build();
		} 
		catch (MalformedURLException | ParseException exception)
		{
			exception.printStackTrace();
			return Response.status(Status.BAD_REQUEST).entity(exception.getMessage()).build();
		}				
	}
	
	public void generateLOG(URLObjects urlObjects)
	{
		System.out.println("Sending LOG to Registry...");
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("requestId", urlObjects.getRequestId());
		jsonObject.put("userName", urlObjects.getUserName());
		jsonObject.put("serviceName", "Data Ingestor");
		jsonObject.put("description", urlObjects.getUrl());
		System.out.println(jsonObject.toString());
		ClientConfig clientConfigR = new ClientConfig();
		Client clientR = ClientBuilder.newClient(clientConfigR);
		WebTarget targetR = clientR.target("http://10.0.0.117:8080/registry/v1/service/log");
		System.out.println(targetR.toString());
		Response responseToR = targetR.request().post(Entity.entity(jsonObject.toString(), "application/json"),Response.class);
		System.out.println(responseToR.toString());
		responseToR.close();
	}
	
}