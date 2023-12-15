I'm a system that used to sale winter clothes.
How to run me? In order to run this project, you need to have Visual Studio 2022 .net 7 or latter, in addition you need to have Microsoft SQL server for the DB- You can make the database from the code in method code first.
About me: 
This project Using .Net 7 Framework, in architecture of Web API.Net Core, With REST principals.
Server side was written by a C# language. Client side was written by HTML and JavaScript. DB of Microsoft SQL Server. ORM technology, of Entity Framework in method DB First.
The Layers model separated the code, and it's connects by Dependency Injection, in order to save on decoupling and flexibility.
I Used async await along all the process in order to add scalability.
Check the password strength with zxcvbn-core package.
You can enter to the swagger to follow the http requests.
Used in DTO models in order to cover from the client what he don't have to know and to avoid circular dependency. The mapping has doing by AutoMapper package.
In the project had use with configuration files for manage the environments.
In case of error or to get another information, you can follow with the logger- using by Nlog package, in the nlog.config file you can change the level and the destination address of the information.
The system using in two custom Middleware to inserting all the requests details to the DB and to handle errors in order to correct behavior with them.

