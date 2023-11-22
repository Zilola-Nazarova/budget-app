# Hello and welcome to "Recipe App"

### In this project, I created **SmartPocket** app that keeps track of all your expences associated with catogories. 

It allows you to:
- create new transactions in order keep track of your expences
- update/delete existing transactions
- create new categories in order to classify your expences by categories
- see the calculated total amount of expences per category
- update/delete existing categories

### General requirements:
- there are no linter errors
- correct Gitflow is used
- work is documented in a professional way

### Project requirements:

The project is deployed and accessible online.

I followed the design guidelines from [SnapScan](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding?tracking_source=&) (Colors, Typography, Layout). I gave appropriate credit to the author the Aknowledgements section of [README](./Rea).

I created unit, request and integration tests for all the most important components the app.

User input is always validated to make sure that anyone with bad intentions cannot compromise the app.

Presentation:
a description of the project.
a demo of the project features.
you should also highlight some interesting piece of code or something you built that you are very proud of.

### Splash screen

A simple page with the name of the app, and links to the `sign up` and `log in` pages (built with Devise).


### Sign up and log in pages

You are able to register in the app with full name, email and password.
You can log into the app using email and password.
You can't access other pages unless you are logged in.

### Home page (categories page)

When you log in, you are presented with the categories page.
For each category, you can see their name, icon and the total amount of all the transactions that belongs to that category.
Whn you click on a category item, the application navigates to the transactions page for that category.
There is a button "add category" at the bottom that brings you to the page to create a new category.

### Transactions page

For a given category, the list of transactions is presented, ordered by the most recent.
At the bottom of the page you can see the total amount for the category.
There is a button "add transaction" at the bottom that brings you to the page to create a new transaction.
When you click on the "Back" button (<), you navigate to the home page.
**Additional features:**
- if category is empty (has no associated transactions), you will see 'Delete' button that will delete this category
- if you click on the category item, you will navigate to the page to edit this category
- if you click on the transaction item, you will navigate to the Transaction Details page, where you can edit/delete this transaction

### "Add a new category" page

You can fill out a form to create a new category, indicating their name and icon (both mandatory).
When you click "Save" button to create the new category, you are taken to the home page on success.
When you click on the "Back" button (<), you navigate to the home page.

### "Add a new transaction" page

You can fill out a form to create a new transaction with:
- name (mandatory)
- amount (mandatory)
- categories (mandatory at least one)
When you click "Save" button to create the new transaction, you are taken to the transactions page for that category.
When you click on the "Back" button (<), the user navigates to the transactions page for that category.

