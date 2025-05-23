DROP TABLE IF EXISTS Ratings;
DROP TABLE IF EXISTS Meals;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Dishes;
DROP TABLE IF EXISTS Restaurants;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    userID INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    email TEXT,
    password TEXT NOT NULL
);

CREATE TABLE Restaurants (
    restaurantID INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    location TEXT NOT NULL
);

CREATE TABLE Dishes (
    dishID INTEGER PRIMARY KEY AUTOINCREMENT,
    restaurantID INTEGER NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    FOREIGN KEY (restaurantID) REFERENCES Restaurants(restaurantID) ON DELETE CASCADE
);

CREATE TABLE Orders (
    orderID INTEGER PRIMARY KEY AUTOINCREMENT,
    userID INTEGER NOT NULL,
    date TEXT DEFAULT CURRENT_DATE,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);

CREATE TABLE Meals (
    orderID INTEGER NOT NULL,
    dishID INTEGER NOT NULL,
    PRIMARY KEY (orderID, dishID),
    FOREIGN KEY (orderID) REFERENCES Orders(orderID) ON DELETE CASCADE,
    FOREIGN KEY (dishID) REFERENCES Dishes(dishID) ON DELETE CASCADE
);

CREATE TABLE Ratings (
    ratingID INTEGER PRIMARY KEY AUTOINCREMENT,
    userID INTEGER NOT NULL,
    restaurantID INTEGER NOT NULL,
    dishID INTEGER NOT NULL,
    comment TEXT,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE,
    FOREIGN KEY (restaurantID) REFERENCES Restaurants(restaurantID) ON DELETE CASCADE,
    FOREIGN KEY (dishID) REFERENCES Dishes(dishID) ON DELETE CASCADE
);
