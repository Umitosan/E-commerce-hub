# _E-Commerce hub template_

#### By _**Dominic Brown**_
#### (Independent project @ Epicodus - 7/14/17)

## Description

This web-app is intended to be an E-Commerce template on which to build a professional store-front of your liking.

## User stories

* As a user, I want to add products to my cart while on the home page.
* As a user, I want to view a product's details while staying on the same page.
* As a user, I want the product's details to include at least a name, description, image, and price.
* As a user, while viewing my car, I want to remove items from the cart by clicking a button and I should see my cart total price update in real-time.

## Refactoring plan

* Generally: Use AJAX to keep the user experience  as seamless as possible
* Ensure that users can't order a negative number of items.
* Add flash messages for signing up, signing in and signing out.
* Add product validations.
* Add password validations to ensure a user's password is sufficiently complex.
* Add Stripe so users can pay when finalizing orders.
* Fix the row height for products, to prevent unevenness.
* Add Paperclip for product image upload.

* Add admin functionality (perhaps use Devise authentication instead)
* Allow other than whole dollar amounts for admin product creation (i.e. 3.99).
* Add product update and delete functionality for admins.
* Add admin flash messages for adding, updating and deleting products.
* Add admin links to navbar so admins can easily add, update and delete products.
* Add integration testing for AJAX functionality.

## Prerequisites

* [Git](https://git-scm.com/)
* [Ruby](https://www.ruby-lang.org/en/)
* [Rails](http://rubyonrails.org/)
* [postgreSQL](https://www.postgresql.org/)
* [bundler](http://bundler.io/)

## Setup

(using OSX terminal, or Gitbash on Windows: run the following commands)
* $`git clone `
* $`cd `
* $`bundle install`
* $`rake db:setup`

### Run

Start postgres if you don't already have it configured as a service by running this in a separate terminal window
* $`postgres`
Start the server
* $`rails s`
In your browser navigate to:
* `localhost:3000`

## Known Bugs
_N/A_

## Technologies Used
 * Rails
 * Ruby
 * postgreSQL
 * CSS
 * Bootstrap
 * HTML

 ### License
 *This software is licensed under the MIT license*
 Copyright © 2017 **Dominic Brown**
