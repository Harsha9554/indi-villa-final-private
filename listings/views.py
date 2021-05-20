from django.shortcuts import get_object_or_404, render
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from .models import Listing
from agents.models import Agent
from django.views.generic import TemplateView
from django.http import JsonResponse, HttpResponse
from listings.choices import (
    city_choices,
    state_choices,
    category_choices,
    type_choices,
    bedroom_choices,
    bathroom_choices,
    garage_choices,
    current_status,
    buy_status,
)
from django.template.loader import render_to_string
import pandas as pd
import numpy as np


def index(request):
    if not request.method == "POST":
        listings = Listing.objects.order_by("-list_date")

        paginator = Paginator(listings, 5)
        page = request.GET.get("page")
        paged_listings = paginator.get_page(page)

        context = {
            "listings": paged_listings,
            "city_choices": city_choices,
            "state_choices": state_choices,
            "category_choices": category_choices,
            "type_choices": type_choices,
            "bedroom_choices": bedroom_choices,
            "bathroom_choices": bathroom_choices,
            "garage_choices": garage_choices,
        }

        return render(request, "listings/listings.html", context)
    else:
        query_listings = Listing.objects.order_by("-list_date")
        # state
        if "state" in request.POST:
            state = request.POST["state"]
            if state:
                query_listings = query_listings.filter(state=state)

        # city
        if "city" in request.POST:
            city = request.POST["city"]
            if city:
                query_listings = query_listings.filter(city=city)

        if "category" in request.POST:
            category = request.POST["category"]
            if category:
                query_listings = query_listings.filter(listing_category=category)

        if "l_type" in request.POST:
            l_type = request.POST["l_type"]
            if l_type:
                query_listings = query_listings.filter(listing_type=l_type)

        if "bedrooms" in request.POST:
            bedrooms = request.POST["bedrooms"]
            if bedrooms:
                query_listings = query_listings.filter(bedrooms=bedrooms)

        if "bathrooms" in request.POST:
            bathrooms = request.POST["bathrooms"]
            if bathrooms:
                query_listings = query_listings.filter(bathrooms=bathrooms)

        if "garage" in request.POST:
            garage = request.POST["garage"]
            if garage:
                query_listings = query_listings.filter(garage=garage)

        # if "current_status" in request.POST:
        #     current_status = request.POST["current_status"]
        #     if current_status:
        #         query_listings = query_listings.filter(listing_current_status=current_status)

        # if "buy_status" in request.POST:
        #     buy_status = request.POST["buy_status"]
        #     if buy_status:
        #         query_listings = query_listings.filter(listing_buy_status=buy_status)

        paginator = Paginator(query_listings, 5)
        page = request.GET.get("page")
        paged_listings = paginator.get_page(page)

        context = {
            "listings": paged_listings,
            "city_choices": city_choices,
            "state_choices": state_choices,
            "category_choices": category_choices,
            "type_choices": type_choices,
            "bedroom_choices": bedroom_choices,
            "bathroom_choices": bathroom_choices,
            "garage_choices": garage_choices,
        }

        return render(request, "listings/listings.html", context)


def listing(request, listing_id):
    listing = get_object_or_404(Listing, pk=listing_id)
    agent = get_object_or_404(Agent, name=listing.agent)

    context = {"listing": listing, "agent": agent}

    return render(request, "listings/listing.html", context)


def search(request):
    return render(request, "listings/search.html")


def commission(request):
    avg = 1
    std_dev = 0.1
    num_reps = 500
    num_simulations = 100

    pct_to_target = np.random.normal(avg, std_dev, num_reps).round(2)

    sales_target_values = [2500000, 5000000, 6000000, 7500000, 8000000, 10000000]
    sales_target_prob = [0.3, 0.3, 0.2, 0.1, 0.05, 0.05]
    sales_target = np.random.choice(sales_target_values, num_reps, p=sales_target_prob)

    df = pd.DataFrame(index=range(num_reps), data={"Pct_To_Target": pct_to_target, "Sales_Target": sales_target})

    df["Sales"] = df["Pct_To_Target"] * df["Sales_Target"]
    df

    def calc_commission_rate(x):
        """Return the commission rate based on the table:
        0-90% = 2%
        91-99% = 3%
        >= 100 = 4%
        """
        if x <= 0.90:
            return 0.02
        if x <= 0.99:
            return 0.03
        else:
            return 0.04

    df["Commission_Rate"] = df["Pct_To_Target"].apply(calc_commission_rate)
    df["Commission_Amount"] = df["Commission_Rate"] * df["Sales"]

    all_stats = []

    for i in range(num_simulations):

        sales_target = np.random.choice(sales_target_values, num_reps, p=sales_target_prob)
        pct_to_target = np.random.normal(avg, std_dev, num_reps).round(2)

        df = pd.DataFrame(index=range(num_reps), data={"Pct_To_Target": pct_to_target, "Sales_Target": sales_target})

        df["Sales"] = df["Pct_To_Target"] * df["Sales_Target"]

        df["Commission_Rate"] = df["Pct_To_Target"].apply(calc_commission_rate)
        df["Commission_Amount"] = df["Commission_Rate"] * df["Sales"]

        all_stats.append(
            [df["Sales"].sum().round(0), df["Commission_Amount"].sum().round(0), df["Sales_Target"].sum().round(0)]
        )

    results_df = pd.DataFrame.from_records(all_stats, columns=["Sales", "Commission_Amount", "Sales_Target"])

    results_df.describe().style.format("{:,}")

    final_mean = int(results_df["Commission_Amount"].mean()) - 80000000

    properties = [8, 6, 2]

    context = {"final_mean": final_mean, "properties": properties}

    return render(request, "listings/commission.html", context)


class ListingChartView(TemplateView):
    template_name = "listings/chart.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["qs"] = Listing.objects.all()
        # city
        city = [["Bengaluru", 4], ["Mangaluru", 1], ["Hyderabad", 3]]
        context["city"] = city
        # state
        state = [["Karnataka", 5], ["Telangana", 3]]
        context["state"] = state
        # category
        category = [["House", 1], ["Apartment", 4], ["Office", 2], ["Villa", 1]]
        context["category"] = category
        return context
