from rest_framework import serializers

class EchoSerializer(serializers.Serializer):
    scheme = serializers.CharField()
    body = serializers.CharField()
    path = serializers.CharField()
    method = serializers.CharField()
    userAgent = serializers.CharField()
    nowTime = serializers.DateTimeField()
    requestorIP = serializers.IPAddressField()
    