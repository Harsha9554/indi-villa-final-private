from django.shortcuts import redirect, render
from contacts.models import Contact
from django.contrib import messages
from django.core.mail import send_mail
from indivilla import settings


def contact(request):
    if request.method == "POST":
        listing_id = request.POST["listing_id"]
        listing = request.POST["listing"]
        name = request.POST["name"]
        email = request.POST["email"]
        phone = request.POST["phone"]
        message = request.POST["message"]
        user_id = request.POST["user_id"]
        agent_email = request.POST["agent_email"]

    if request.user.is_authenticated:
        user_id = request.user.id
        has_contacted = Contact.objects.all().filter(listing_id=listing_id, user_id=user_id)
        if has_contacted:
            messages.error(request, "You have already made an inquiry for this listing")
    contact = Contact(
        listing=listing, listing_id=listing_id, name=name, email=email, phone=phone, message=message, user_id=user_id
    )

    contact.save()
    print("CONTACT SAVED")

    # send_mail(
    #     "Property Listing Inquiry",
    #     "There has been an inquiry for " + listing + " .",
    #     "indivilla.545@gmail.com",
    #     [agent_email],
    #     fail_silently=False,
    # )
    # messages.success(request, "Your request has been submitted, a agent will get back to you soon")

    # return redirect("/listings/" + listing_id)
    return redirect("/accounts/dashboard")
