from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from api.serializers.echo import EchoSerializer

import datetime

@api_view(['GET', 'POST', ])
def main(request):
    responsePayload = {}
    responsePayload['scheme'] = request.scheme
    responsePayload['body'] = request.body
    responsePayload['path'] = request.path
    responsePayload['method'] = request.method
    responsePayload['userAgent'] = request.META['HTTP_USER_AGENT']
    responsePayload['nowTime'] = datetime.datetime.now()
    responsePayload['requestorIP'] = request.META['REMOTE_ADDR']

    serializer = EchoSerializer(responsePayload, many=False)

    return Response(serializer.data)
