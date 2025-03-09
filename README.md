Flower Inventory Management System
This is a simple Flower Inventory Management System built using ASP.NET Web Forms and SQL Server. The application allows users to manage a flower inventory by performing CRUD operations (Create, Read, Update, Delete) on flowers and categories.

Setup Instructions
Prerequisites
Visual Studio: Install Visual Studio (Community edition is free).

SQL Server: Install SQL Server (Express edition is free).

.NET Framework: Ensure you have the .NET Framework installed (included with Visual Studio).

Steps to Run the Project
Set Up the Database:

Open SQL Server Management Studio (SSMS).

Run the SQL script provided in the DatabaseScripts folder to create the FlowerShop database and seed it with sample data.

Update the Connection String:

Open the Web.config file in the project.

Update the connection string to match your SQL Server instance.

Open the Project in Visual Studio:

Open the FlowerInventorySystem.sln file in Visual Studio.

Build the solution (Build > Build Solution).

Run the application (Debug > Start Debugging or press F5).

Access the Application:

The application will open in your default web browser at http://localhost:port/.

Implementation Description
Features
Database:

The database consists of two tables: Category and Flower.

A one-to-many relationship exists between Category and Flower.

Back-End:

A FlowerService class handles all database operations (CRUD) using stored procedures.

Exception handling is implemented for database operations.

Front-End:

A GridView displays the list of flowers with Edit and Delete buttons.

A Bootstrap modal is used for adding new flowers.

A delete confirmation dialog (using a Bootstrap modal) ensures users confirm before deleting a flower.

Search and Sort:

Users can search for flowers by name and sort the GridView by name, type, price, or category.

Code Structure
Default.aspx: Contains the main UI (GridView, modal, buttons).

Default.aspx.vb: Contains the code-behind logic for handling events (e.g., button clicks, GridView events).

FlowerService.vb: Contains the service layer for interacting with the database.

Web.config: Contains the connection string and other configuration settings.

Challenges Faced
Empty .designer.vb File:

The .designer.vb file was not auto-generated, causing the BC30451: Name '<name>' is not declared error.

Solution: Manually declared the controls in the code-behind file or regenerated the .designer.vb file by converting the project to a Web Application.

Delete Confirmation:

Implementing a user-friendly delete confirmation dialog required integrating JavaScript and Bootstrap.

Solution: Used a Bootstrap modal for confirmation and a hidden field to store the FlowerId.

Search and Sort:

Implementing search and sort functionality required filtering and sorting the DataTable before binding it to the GridView.

Solution: Used LINQ-like queries to filter and sort the data.

Assumptions Made
Database:

The database is hosted locally on SQL Server.

The Category and Flower tables are pre-populated with sample data.

User Interface:

Users are familiar with basic web forms and know how to use modals and buttons.

No advanced validation is implemented for input fields (e.g., price must be a number).

Error Handling:

Basic exception handling is implemented, but no logging or advanced error recovery is included.

Technologies Used
Back-End
ASP.NET Web Forms: For building the web application.

VB.NET: For the server-side logic.

SQL Server: For the database.

ADO.NET: For database interactions.

Front-End
Bootstrap: For styling and responsive design.

JavaScript: For client-side interactions (e.g., delete confirmation modal).

Tools
Visual Studio: For development and debugging.

SQL Server Management Studio (SSMS): For database management.
