== Powwow

Powwow, still in development, is an app for requesting to meet a friend or colleague in a simple, streamlined process. Users select a contact, and suggest a date, time and location.

It uses several technologies:

* JavaScript, jQuery and AJAX make Powwow almost entirely a single page app.

* The Twilio API sends text message alerts when adding contacts and confirming meetings.

* Google Maps APIs geocode invitation addresses and display maps of meeting and potential meeting locations.

Powwow's styling is only configured for mobile devices, and is optimized for iPhone 5.

### To launch app

Locally: fork and clone app. From terminal, in app's directory, run:

    bundle install
    rails s

In web browser, visit:

    http://localhost:3000/

Online: visit [powwowmeet.herokuapp.com](http://powwowmeet.herokuapp.com/users/sign_in) (__NOTE:__ you must have an account to use the app)