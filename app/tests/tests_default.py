from django.test import TestCase, Client

class BasicTestCase(TestCase):
    # def setUp(self):

    def test_basic_response(self):
        c = Client()
        response = c.get('/')
        self.assertEqual(response.status_code, 200)
