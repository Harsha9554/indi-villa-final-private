from django.urls import reverse, resolve


class TestUrls:
    def test_listing_url(self):
        path = reverse("listing", kwargs={"listing_id": 1})
        assert resolve(path).view_name == "listing"
