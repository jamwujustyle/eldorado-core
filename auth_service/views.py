import httpx
from django.http import JsonResponse
from drf_spectacular.utils import extend_schema


async def check_user(request):
    async with httpx.AsyncClient() as client:
        response = await client.get("http://auth-service:1000/health")
        return JsonResponse(response.json())
