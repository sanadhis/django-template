from django.conf.urls import url
from api.services import echo
from commons.responses import default

urlpatterns = [
    url('echo', echo.main, name="default"),
    url(r'^', default.main, name='default'),
]