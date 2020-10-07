# ProjecTrack

ProjecTrack is an application to create, edit, view and delete various projects you have to do.  It was originally made to keep track of "honey-do" projects at home, but it can be use to track projects anywhere!

## Installation

Download or clone this repo

cd (change directory) into the ProjecTrack directory

And then execute the following command:
```bash
$ bundle install
```
Followed by:
```bash
rake db:migrate
```

You will be given an address (like: localhost:9393)


## Usage

Start the server using:
```bash
shotgun
```
Then head to your localhost address provided upon server start-up.
You can create a user, create a project, and manage those all from the web interface.  The information is stored in a SQLite database for retrieval. 

Start tracking your projects with ProjecTrack!!

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
This gem is available under the terms of the [MIT](https://choosealicense.com/licenses/mit/) license.