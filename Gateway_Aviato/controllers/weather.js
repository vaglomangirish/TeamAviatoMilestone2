var request = require('request');
var uuid = require('node-uuid');

exports.getWeather = (req, res) => {
  res.render('weather', {
    title: 'Weather'
  });
};

exports.postWeather = (req, res) => {
  req.assert('station', 'Station cannot be blank').notEmpty();
  req.assert('date', 'Date cannot be blank').isDate();
  req.assert('time', 'Please fill in time in the correct format').notEmpty();
  
  const errors = req.validationErrors();
  if (errors) {
    req.flash('errors', errors);
    return res.redirect('/weather');
  }

  var time = req.body.time.split(':').join('').concat('00');
  var requestSuccess = 0;
  var reqId = uuid.v1();
  request({ // Request to the Data Ingestor
    url: 'http://10.0.0.209:8080/dataingestor/v1/service/url',
    method: 'POST',
    headers: { 'Content-Type': 'application/json'},
    json: {
        userName: 'Amol Bhagwat',
        stationName: 'KIND',
        date: '2016-09-24',
        time: '111111',
        requestId: reqId
    }
  }, function(error, response, body){
    if(error) {
    	//console.log(error);
        //console.log(response.statusCode, body);
        requestSuccess = -1;
    }
    else if(response.statusCode != 200){
    	console.log('There was an error connecting to the Data Ingestor. Response: ' + response.statusCode);
        requestSuccess = 1;
    }
    else if (response.statusCode == 200){
    	console.log('Response from Data Ingestor is: ' + response.statusCode);
    	
    	//var the_object = response.body;
    	//console.log('The name is - ' + the_object.userName);
    	//console.log('The URL is - ' + the_object.url);

    	request({ // Request to the storm detector
    		url: 'http://10.0.0.97:5000/stormdetector/v1/service',
    		method: 'POST',
    		headers: { 'Content-Type': 'application/json' },
    		json: {
    			userName: 'Amol Bhagwat',
        		requestId: reqId
    		}
    	}, function(error, response, body){
    		if(error){
    			console.log('Generic error while connecting to the storm detector.');
    			//console.log(response.statusCode, body);
    			requestSuccess = -1;
    		}
    		else if(response.statusCode != 200){
    			console.log(response.statusCode + ' while connecting to the storm detector. ReqId is: ' + reqId);
    			requestSuccess = 2;
    		}
    		else if(response.statusCode == 200){
    			console.log('From storm detector: ' + body.trigger_response);

    			if(body.trigger_response == 'Yes'){
    				request({
    					url: 'http://10.0.0.97:8050/runforecast/v1/service',
    					method: 'POST',
    					headers: { 'Content-Type': 'application/json' },
    					json: {
    						userName: 'Amol Bhagwat',
    				   		requestId: reqId
    					}
    				}, function(error, response, body){
    					if(error){
    						console.log('Generic error while connecting to the forecaster.');
    						console.log(response.statusCode, body);
    						requestSuccess = -1;
    					}
    					else if(response.statusCode != 200){
    						console.log('Error while connecting to the run forecaster. ReqId is: ' + reqId);
    						requestSuccess = 3;
    					}
    					else if(response.statusCode == 200){
    						//console.log('Runforecast was successful');	
    					}
    					if(requestSuccess == 0){
    						req.flash('success', {msg: 'Storm detection was successful.'});
    						res.redirect('/weather');
    					}
    					else{
    						req.flash('error', {msg: 'Storm detection was not successful.'});
    						res.redirect('/weather');	
    					}
    				});
    			}
    			else{
    				req.flash('success', {msg: 'No storm is predicted.'});
    				res.redirect('/weather');
    			}
    			//if(requestSuccess != 0){
    			//	req.flash('error', {msg: 'An error occurred.'});
    			//	res.redirect('/weather');
    			//}
    		}
    	});
    }
  });

  


  //req.flash('success', { msg: '' });
  //res.redirect('/weather');
};

