from django.test import TestCase, Client

class EchoServiceTestCase(TestCase):
    # def setUp(self):

    def test_service(self):
        c = Client(HTTP_USER_AGENT='Mozilla/5.0')
        response = c.post('/api/echo')
        response_body = response.json()
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response_body['scheme'], "http")
        self.assertEqual(response_body['method'], "POST")
        self.assertEqual(response_body['userAgent'], "Mozilla/5.0")
