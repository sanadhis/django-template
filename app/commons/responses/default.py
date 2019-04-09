from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from commons.serializers.BasicResponse import BasicResponseSerializer

@api_view(['GET', 'POST', ])
def main(request):
    responsePayload = {}
    responsePayload['status'] = status.HTTP_404_NOT_FOUND
    responsePayload['message'] = "NOT FOUND"

    serializer = BasicResponseSerializer(responsePayload, many=False)

    return Response(serializer.data)
