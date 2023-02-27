# recreation.gov-Reservation-help
I was struggling with booking on recreation.gov and wanted to ensure I could click as soon as the reservations were released.  This is the solution I used to get a booking.

The problem I ran into with trying to book popular campground sites was that as soon as reservations were released, they would be gone in a second.  At first, I thought bots were doing this, and that may be some of the case, however, based on the YouTube post by campnab, I do not believe bots are the problem.  There could be individuals using bots but the structure and policies in force with recreation.gov would make things difficult to be profitable.  The main case that convinced me is that I could not find "scalped" campsites for sale anywhere.  If they are harvesting these like Ticketmaster allows, where is the secondary market?  


The below is a write-up of what worked for me.  This is not a guarantee of any type of result, but more for my memory and something I can return to if I need to do this (or something similar) again.  


The pseudo-code of how this process works- 
  Find campsites you want to book on recreation.gov
  Setup a 3x3 (or whatever size) fancyZones window grid on your computer.
  Build an autohotkey Script to click for you
  The morning of release (after 0500 et) - login to recreation.gov in a browser.  Open a bunch of new browser windows and navigate to the campsite you want to book.  Snap each campsite reservation window with the dates entered to a zone in FancyZones.
  Run the script a few mins before 1000 et, wait, cross fingers.  If successful, you should have one or more windows that say you have 15 minutes to complete your reservation.


Prep-work - 
1. Be able to plan 6 months out for recreation.gov bookings.  (if less than 6 months search github for recreation.gov and find a solution to constantly check for openings as they happen often.  Or use a service like campNab to do it for you).
2. Install MS PowerToys and specifically FancyZones.  (or some other desktop window manager for snapping)
3. Install AutoHotkey.
4. Find campsites that you want to book on recreation.gov.  Make a list with the URLs for the specific sites you want.
5. Find out when those sites are going to be released for booking. The calendar in the specific campsite will have a note as to when they will be released for booking.  Usually sites in the same campground are all the same, but there could be differences between locations.  Currently Recreation.gov releases them 6 months prior.  I am unsure how they manage differences in days per month so there may be some advantages there into which I did not dig.
6. Setup your FancyZones to accommodate each campsite you want to attempt to book in a new browser window.  Example:If you want to try for 9 sites (or 1 site 9 times, etc.), setup fancyZones for a 3x3 grid.
7. Prep your Autohotkey script.  See section on AutoHotKey below and the autohotkey script in this repo.
8. Ensure your computer's time sync - At least load time.gov and see what they claim your device offset is.  Ideally - look into how to use ntpd or w32tm to compare your system clock with the NIST/ntp Pool servers.  A time drift of even a few seconds could mean the difference in getting the reservation or not.  The recreation.gov should be very close to the NIST/ntp pool servers as it is a gov site and *should* be PCI compliant, which means GPS time sync is likely also used to get very close to actual time.  Also note if you are in a WinDomain, your computer will be bound to the domain controllers for time.  If you are the admin of the domain and your time is off on your workstation, fix it at the domain level by using a solid NTP source on your DCs and/or GPS device to sync time (trust me, you want to fix the time to avoid uncommon problems ASAP).  If you do not control the domain servers and the time is off, you should probably stop here and use a personal computer as many IT folk will be hostile to your suggestion of fixing their domain's time sync (speaking from exp).


The morning of the campsite release - 
1. Campsites get released at 10am et.  Plan accordingly in your TZ to be done with all the needed work before this time because the sites go quick.
2. Login to recreation.gov in a browser.
3. Open new browser windows for each campsite you want to try to book.
4. Snap each browser to a fancyZones square (drag and hold left shift and it should show the zone)
5. Open each campsite in its own browser window.  
6. Ensure your desired dates are loaded into the campsite windows and you should have a button that says Add to Cart showing.
7. Run your script that is programmed to click on the Add to Cart button at the correct time.  
8. At 1000 et, the script should execute, and you will hopefully have some campsites in your cart to choose from.
9. Book the site you or release and ones you added to the cart successfully and try again tomorrow.


AutoHotKey Script notes - 
- The script in this repo is basically what I used to make this work.  It will be a good starting point.  
- The main things to change are the time the script will take action (0900 for my example because I am central time) and the click locations.
- To find the click locations - AutoHotkey install a tool called Window Spy.  Run it.  Click Follow Mouse at the tip and note the coords you want to click on after the "Screen" value.
- Setup your fancyZones squares and load up a campsite reservation to the point where “add to cart” is visible.  This could be any site that is available because this is just to get the coords of the buttons and test at this point.  
- Adjust the AHK script to handle the click locations of each button you want to click by looking at the window spy tool when hovering the button.  See the script for my example.  I am on a mid-sized gaming monitor so your coords will likely be different for standard monitors or ultra wide or different resolutions, etc.  
- Test the script by setting the time to a few mins into the future from now (HHMM format), saving the script, then right-click and run script.  This should click all the “add to cart” buttons.  Some sites will say you have pending reservations and other should show you a 15 minute timer to complete the reservation.  


Comments about this process - 
1. If you are trying to 9 campsites (or whatever number), make sure you are ok with getting any of them.  You are not committed to them until you review and checkout, but you may get the 5th in your list of 9 and no others.  There are a ton of factors that we attempted to limit with the prep work, but the internet is a funny place and not always predictable.  Plus you may be attempting to run this same process against others using it also.
2. If you are trying to get 1 site specifically and you do not need a fallback site, you could set the process up with as many of the same site on screen at 1000et as you want.  This would help your chances of getting this one site by sending a bunch of requests in rapid order and hopefully you will beat-out someone with the same goal.  Not a sure thing, but likely betters the odds for you.
3. Is this legal? - yeah.  This process does not do anything a user cannot do.  It uses the front-end website in the way it was designed to be used, quickly and precisely.
4. Will this always work?  - probably not, but it is better than the stress caused by not getting a reservation.




Future ideas -
1. There may be an API that can automate some of this for you also.  I found various GitHub scripts to check if a site was open, but not to book.  I believe campnab also uses the API back-end to check for sites.  
