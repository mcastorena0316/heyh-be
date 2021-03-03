# Backend API HOMIE

<div align="center">

  <h1 color= "rgb(243, 190, 44)" font-size= "40"> Homie API </h1>
</div>

## Table of Contents

* [About the Project](#about-the-project)
* [The Back-End API](#the-back-end-api)
  * [How To Use it](#how-to-use-it)
  * [Authentication](#authentication)
  * [Endpoints](#endpoints)
* [Tecnologies used](#tecnologies-used)
* [Author](#author)


<!-- ABOUT THE PROJECT -->
## About The Project

The objective of this project was to create an API to retrieve information on the current properties of HOMIE 
Live version of the project: [Live version](https://backend-homie-api.herokuapp.com/)


<!-- THE BACKEND API -->
## The Back End API

The back-end for this project consists of a REST API that manages HOMIE's database. This database is integrated by the next tables:

1. User Table: For storing email, name, and encrypted password

2. Property Table: Includes the following parameters of a property:
* Name
* Description
* Rental Price
* Status
* Tenant Name
* Tenant Email
* Tenant Phone
* Tenant Availability


<!-- HOW TO USE IT -->
### How to use it

You can always use the [live version](https://backend-homie-api.herokuapp.com/) or install it locally using these steps:


#### Clone my repository

`$ git clone https://github.com/mcastorena0316/heyh-be.git`

#### Go to my project's folder

`$ cd heyh-be`

#### Get the dependencies needed

`$ bundle install`

#### Create and migrate the tables
`$ rails db:create`
`$ rails db:migrate`
`$ rails db:seed`

#### Start the server
`$ rails server`


<!-- Authentication -->
### Authentication

For retrieve, create, delete and update propierty's data, you need to login as a user, which will give you an JWT token to use in the Request's headers.

<!-- EndPoints -->
### Endpoints

Base URL: https://backend-homie-api.herokuapp.com/
Base URL Local: http://localhost:3000/


*/properties*

* **GET** - to receive an object with all the propierties, it accepts filter for status and max rental price
* **POST** - to create a new property - with parameters:
  * name
  * description
  * rental_price
  * status
  * tenant_name
  * tenant_email
  * tenant_phone
  * tenant_availability


*/properties/:id*

* **PUT** - to edit a property
* **GET** - to receive a specific property's data
* **DELETE** - to delete a property


*/users*

* **POST** - to create a user  - with parameters:
  * email
  * name
  * password
  this service will also return a JWT token to use as request headers to retrieves property's data

*/retrieve_token*
* **GET** - to receive a users information, including JWT token



<!-- TECNOLOGIES USED -->
## Tecnologies used

* Ruby on Rails
* Heroku
* Postgresql
* Rspec
* bcrypt

<!--AUTHOR -->
## Author
<table style="width:100%">
  <tr>
    <td>
      <div align="center">
        <a href="[./docs/img/photo.png](https://github.com/mcastorena0316)" target="_blank" rel="author">
          <img src="https://avatars0.githubusercontent.com/u/52794673?s=460&v=4" style="border-radius: 50%; min-width: 100px;" alt="meli castorena's Photo" width="200px">
        </a>
        <h2>
          <a href="https://mcastorena0316.github.io/portfolio/" target="_blank" rel="author">
              Melissa Castorena
          </a>
        </h2>
      </div>
    </td>
    <td>
      <div align="center">
       <a href="mcastorena0316@gmail.com" target="_blank" rel="author">
          <img src="https://img.icons8.com/color/48/000000/message-squared.png" style="border-radius: 10%" alt="My GitHub" height="45px">
          <h3>
              Email me to 
              <a href="mailto:mcastorena0316@gmail.com">
                  mcastorena0316@gmail.com
              </a>
          </h3>
        </a>
        <a href="https://www.linkedin.com/in/melissa-castorena/">
          <img src="https://img.icons8.com/color/48/000000/linkedin.png" alt="My Linkedin" height="45px">
          <h3>
              Connect to my Linkedin
          </h3>
        </a>
      </div>
    </td>
  </tr>
</table>

