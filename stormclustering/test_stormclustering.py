from unittest import TestCase


class TestPerformclustering(TestCase):
    def test_performclstering(self):
        from stormclustering import performclustering
        self.assertTrue(type(performclustering('<xmldata>')) == dict)

