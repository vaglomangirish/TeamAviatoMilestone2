from configparser import ConfigParser

import requests
from flask import Flask
from flask import Response
from flask import json
from flask import request
import random
app = Flask(__name__)

@app.route('/forecasttrigger/v1/service/trigger',methods=['POST'])
def trigger_forecast():
    request_data = request.get_json()
    userName = request_data['userName']
    requestId = request_data['requestId']
    cluster = request_data['data']

    trigger_response=random.choice(["Yes","No"])

    # ---------------------------------------------------------
    # connect to registry
    config = ConfigParser()
    config.read('config.ini')
    host1 = config.get('registryConfig', 'ipaddress1')
    port1 = config.get('registryConfig', 'port1')

    url1 = "http://" + host1 + ":" + port1 + "/registry/v1/service/log"
    print(url1)
    log1 = {'userName': userName, 'requestId': requestId, 'serviceName': 'Forecast Trigger', 'description': 'success'}
    headers1 = {'Content-type': 'application/json'}

    r1 = requests.post(url1, data=json.dumps(log1, ensure_ascii=False), headers=headers1)
    print("registry response", r1.content)
    # ---------------------------------------------------------


    return json.dumps({'trigger_response':trigger_response})

if __name__ == '__main__':
    app.run(port=32000)