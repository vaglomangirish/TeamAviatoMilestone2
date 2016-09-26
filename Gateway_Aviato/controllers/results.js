exports.getResults = (req, res) => { 
  console.log('In getResults, req.session.forecastData: ' + JSON.stringify(req.session.forecastData));
  res.render('results', { 
      title: 'Results',
      results: req.session.forecastData
    });   


};
