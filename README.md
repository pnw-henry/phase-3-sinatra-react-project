# Vamonos

Vamonos is a React Web Application focousing on travel and its related topics, such as hotels and check-in information. In the "My Trips" section of the app, users can find trip details, add missing hotel information if necessary, or delete trips from their list. In the "New Trip" section, users can add new trips to their account. Users must first log in or create an account to use the app.

## Installation

No API key required. 

* Fork and clone the Github [repository](https://github.com/pnw-henry/phase-3-sinatra-react-project) into a local machine. This contains the Ruby portion of the app. The frontend can be found here [repository](https://github.com/pnw-henry/vamonos-frontend).
* Navigate to the directory created by using Finder (Mac), Explorer (Windows) or a command line interface:
	On Mac, open the terminal app, cd into the vamonos-frontend directory, type npm start. This will start the react server hosting the app components and files.
	Navigate to the cloned phase-3-sinatra-react-project and bundle exec rake server. This will start the backend for Vamonos.
	

## Usage

Vamonos is divided into three sections: Home, My Trips, and New Trip.

The Home section contains simple login and create account inputs. If the user is signed in and if there's trip information, an upcoming trip will be displayed. My Trips contains a list of trips; each trip contains hotel information, cost, check-in and check-out dates. New Trip has a form that can be used to submit a new trips to the server.

## Roadmap

* Implement the ability to sort results.
* Update the Home page to be more visually pleasing and interactive.
* Add more detailed trip information, such as an image related to the destination using the Google Places API.

## Contributing

Pulls requests are welcome.

## License

GPL-3.0