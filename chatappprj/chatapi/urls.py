from django.urls import path
from .views import RoomListCreateView, RoomRetrieveUpdateDestroyView, MessageListCreateView, MessageRetrieveUpdateDestroyView

urlpatterns = [
    path('rooms/', RoomListCreateView.as_view(), name='room_list_create'),
    path('rooms/<int:pk>/', RoomRetrieveUpdateDestroyView.as_view(), name='room_retrieve_update_destroy'),
    path('messages/', MessageListCreateView.as_view(), name='message_list_create'),
    path('messages/<int:pk>/', MessageRetrieveUpdateDestroyView.as_view(), name='message_retrieve_update_destroy'),
]