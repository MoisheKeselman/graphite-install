# Installing Graphite

Run the scripts from 1 to 5. 

In the end, there will be a Whisper Database, the Graphite Webapp (available at `<ip-address>:80`) and some thing called Carbon

The Web app itself is running in a systemd service (see inside files) and the nginx redirecting to it is also running in systemd. 

# Adding data to database

`while true; do sudo echo "carbon.agents.graphite-tutorial.creates 2 `date +%s`" | nc localhost 2003 -q 30; echo hi ; done`

will post data to the `carbon.agents.graphite-turoial.creates` database every 30 seconds (`-q 30`) 

You can create new databases by simply sending a number to a new database. [See more methods](https://graphite.readthedocs.io/en/latest/feeding-carbon.html)

NOTE: Databases are in tree structures with `.` as separators 

# Using the dashboard

1. Go to `<ip-address>:80`

1. Open the folder system under `Tree` in `Metric` to get to your database

1. Click `Graph Options` and edit whatever you want. Edit how far back you see the data by clicking the clock icon on the top

# Uninstall

You should be able to uninstall everything by uninstalling the `pip` packages that are installed in the first script.

