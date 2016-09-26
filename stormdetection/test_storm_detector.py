from unittest import TestCase

class TestSendkml(TestCase):

    '''def test_sendkml(self):
        from stormdetector import sendkml
        self.assertTrue(type(sendkml())==str)
        #self.fail()'''

    def test_getkml(self):
        from stormdetector import getkmlfile
        self.assertTrue(type(getkmlfile(12,12,12,'stationA','stationA.txt'))==str)

    '''def test_connection(self):
        from stormdetector import app
        connect=app.test_client(self)
        response=connect.get("/stormdetector/v1/service/noaa-nexrad-level2.s3.amazonaws.com/03/12/12/ST/abc.txt")
        self.assertEqual(response.status_code, 200)'''



