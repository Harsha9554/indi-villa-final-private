from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="listings"),
    path("/<int:listing_id>", views.listing, name="listing"),
    path("/commission", views.commission, name="commission"),
    path("/chart", views.ListingChartView.as_view(), name="chart"),
]
