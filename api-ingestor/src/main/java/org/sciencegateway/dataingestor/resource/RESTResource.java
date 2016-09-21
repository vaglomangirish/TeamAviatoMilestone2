package org.sciencegateway.dataingestor.resource;

import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.sciencegateway.dataingestor.POJO.URLObjects;
import org.sciencegateway.dataingestor.service.URLConverter;

@Path("/diservice")
public class RESTResource 
{
	URLConverter urlConverter = new URLConverter();
	URLObjects urlObjects = new URLObjects();
	
	@GET
	@Path("/{station}/{date}/{time}")
	@Produces(MediaType.TEXT_PLAIN)
	public String generateURL(@PathParam("station") String station, @PathParam("date") String date, @PathParam("time") String time) throws ParseException, SQLException, IOException
	{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    Date convertedDate = format.parse(date);		
		urlObjects.setDate(convertedDate);
		urlObjects.setStationName(station);
		urlObjects.setTime(time);
		return urlConverter.getURL(urlObjects);
	}
	
	@GET
	@Path("/url")
	@Produces(MediaType.TEXT_PLAIN)
	public String url()
	{
		return "hello";
	}
	
}