from unittest import TestCase
import httplib2
import sys
import codecs
sys.stdout = codecs.getwriter('utf8')(sys.stdout)
sys.stderr = codecs.getwriter('utf8')(sys.stderr)

print ("Running Endpoint Tester....\n")
address = "http://120.0.0.1:5000"

#TEST ONE -- sending KML
class TestSendkml(TestCase):
    def test_http(self):
        print("Test 1: check get request status code......")
        url = address + '/'
        h = httplib2.Http()
        resp, result = h.request(url, 'GET')
        self.assertTrue(resp['status']=='200')

