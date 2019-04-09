from rest_framework import serializers

class BasicResponseSerializer(serializers.Serializer):
    status = serializers.IntegerField()
    message = serializers.CharField()
