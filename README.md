# DBS_Project_IP_Asset_Mangement_Portal
IP Asset Management Portal build on Ruby on Rails<br/>

* **Requirements**
  * mysql database
  * Rails Version 5.0.0.1

* **Installation and Running the portal** <br/> <br/>
  Open the Command Line Interface and do the following <br/>
  * git clone "https://github.com/SvrAdityaReddy/DBS_Project_IP_Asset_Mangement_Portal.git"
  * Change the password of mysql database in the file **database.yml** in the follwing location **IP_Asset_Management_Portal/config/**
  * bundle install
  * rake db:create
  * rake db:migrate
  * rake db:install
  * rails -s
  * Open http://localhost:3000/ in a browser