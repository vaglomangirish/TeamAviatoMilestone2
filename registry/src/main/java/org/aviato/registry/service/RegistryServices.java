package org.aviato.registry.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.aviato.registry.POJO.RegistryPOJO;
import org.json.JSONArray;
import org.json.JSONObject;


public class RegistryServices {
	
	/*Function to create a connection to the database*/
	public Connection makeConnection()
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");		
			String url = "jdbc:mysql://localhost:3306/registry";
			String user = "root";
			String password = "root";
					
			Connection connection = DriverManager.getConnection(url, user, password);
			if(connection.isValid(0)){
				System.out.println("Connection established.");
			}
			return connection;
		}
		catch (Exception exception){
			exception.printStackTrace();
			return null;
		}
	}	
	
	
	/* Function to retrieve log data from the database */ 
	public JSONArray getUserLog(Connection connection, RegistryPOJO log) throws Exception{
		System.out.println("Retrieving Logs.");
		Statement statement = connection.createStatement();		
		ResultSet resultSet = statement.executeQuery("select * from logservice where username = '"+log.getUserName()+"' order by timestamp desc");		
		JSONArray resultJson = convertToJSON(resultSet);
		return resultJson;
	}	
		
	/*Function to add log data to the database*/
	public void addLogToRegistry(Connection connection, RegistryPOJO log) throws SQLException
	{
		System.out.println("Logging to registry.");
		String timeStamp = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss.SSS").format(Calendar.getInstance().getTime());
		
		String query = "insert into logservice(requestId, username, timestamp, servicename, description) values (?,?,?,?,?)";		
		PreparedStatement preparedStatement = connection.prepareStatement(query);
		
		preparedStatement.setString(1, log.getRequestId());
		preparedStatement.setString(2, log.getUserName());
		preparedStatement.setString(3, timeStamp);
		preparedStatement.setString(4, log.getServiceName());
		preparedStatement.setString(5, log.getDescription());
		
		preparedStatement.execute();
	}	
	
	/*Function to close the database connection*/
	public void closeConnection(Connection connection) throws SQLException{
		connection.close();	
	}		
	
	/*Function to convert query resultset to json format
	 * 
	 * Function code courtesy of - http://biercoff.blogspot.com/2013/11/nice-and-simple-converter-of-java.html
	 * 
	 * */
	public JSONArray convertToJSON(ResultSet resultSet) throws Exception {
		JSONArray jsonArray = new JSONArray();
	    while (resultSet.next()) {
	    	int total_rows = resultSet.getMetaData().getColumnCount();
	        JSONObject jsonObject = new JSONObject();
	        for (int i = 0; i < total_rows; i++) 
	        {
	        	jsonObject.put(resultSet.getMetaData().getColumnLabel(i + 1).toLowerCase(), resultSet.getObject(i + 1));	                
	        }
	    jsonArray.put(jsonObject);
	    }
	    return jsonArray;
    }	 
}




