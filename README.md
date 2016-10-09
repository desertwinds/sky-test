# README

This application is done for the guys at Sky as part of an unattended test.

The page can be found up and running at https://sheltered-earth-30288.herokuapp.com/

# Sky test

This was developed with:

* Ruby ~> 2.3.0
* Ruby on Rails ~> 5.0
* Bootstrap ~> 4.0.0.alpha4
* vueJs ~> 1.0.28

# Database

No use of databases was needed for this app. The bill displayed on this test is acquired from a web service provided by Sky at 

```
http://safe-plains-5453.herokuapp.com/bill.json
```
# Tests

RSpec was used to test this app. To run the tests all you need to do is 

```
bundle exec rspec spec/
```
