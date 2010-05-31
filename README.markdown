# ketchupstatus
Displays status of your shared ketchup resources.

## Background
In our office Monday is chicken/fries/burger day. And we always have a bottle
of ketchup which we share. However before buying burgers in the supermarket
next door, we always forget to check if we have enough ketchup left.

So I quickly threw together a simple sinatra app to set and check the
status.

## API
There are some rather simple API endpoints:

Update your ketchup:

    POST /ketchup/$yourketchup/$token/$value

Status of your ketchup:

    GET /ketchup/$yourketchup

Create new ketchup:

    POST /ketchup/$desiredname

## Beware
You only get the token once and there is no way to recover it at the moment.

## Thanks
[Kevin](http://twitter.com/thesndwichmn) for quickly creating pics and
design on a Friday evening.
