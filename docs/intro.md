# Introduction to code

The code follows the MVVM (Model-View-View Model) Architecture. For the understanding of code please refre to MVVM architecture. The code can be classifed as three categories :-

- [Models](./models.md)
- [View Models](./view-models.md)
- [Views](./views.md)

Refer to their corresponding docs for further info on the respective.

The idea of the app was to create a interface for the users to register their car and get services as per need. The app provides a shortest route and best path to the destiantion taking the charging stations into account. The car should be shown a path where the car can reach the destinaton in the shortest time even if the SOC is low. If the SOC is low the car should be diverted to an appropriate charging sation so the time taken will be least.

There are some other functionalities which are implemented here. The brief is given below:

- common: This folder contains the code to intercat with the shared prefrences, navigation between pages and the routing between pages; containing the diffrent routes for diffrent screens.

- components: This contains the resusable UI components used over a page

- theme: This contains the theme details such as the colors used in the app, etc.

- utilities: This folder was supposed to handle all utilities of the app which will be used yet not prominent enough

- The other files such as firestore_options, app_providers sre used to initialise the app and its initial state and connections with the database
