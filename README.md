# Wutz!

Wutz is a daily social trivia game using an API scrapping Jeopardy Productions trivia. [^1]
[^1]: This is not associated with jeopardy productions, inc.

## Developed Using

* Rails 7.0.X
* API https://jservice.io/

# JService.io API Documentation

JService.io is an API that provides trivia questions and answers from the popular TV game show "Jeopardy." This documentation will guide you through the available endpoints and how to use them to access trivia data.

### /api/clues
- `/value(int)` the value of the clue in dollars
- `/category(int)` the id of the category you want to return
- `/min_date(date)` earliest date to show, based on original air date
- `/max_date(date)` latest date to show, based on original air date
- `/offset(int)` offsets the returned clues. Useful in pagination
### /api/random
- `/count(int)` amount of clues to return, limited to 100 at a time
### /api/final
- `/count(int)` amount of clues to return, limited to 100 at a time
### /api/categories
- `/count(int)` amount of categories to return, limited to 100 at a time
- `/offset(int)` offsets the starting id of categories returned. Useful in pagination
### /api/category
- `/id(int)` Required the ID of the category to return

## Base URL

The base URL for all API endpoints is `https://jservice.io/api`.

## Endpoints

### 1. Get Random Clues

- **Endpoint:** `/random`
- **Method:** GET
- **Description:** Retrieve a random set of trivia clues.
- **Parameters:**
  - `/count(int)` (optional): The number of random clues to retrieve (limited to 100 at a time).
- **Example Request:** `/random?count=5`
- **Example Response:**
```json
[
{
    "id": 1,
    "answer": "This is the capital of France.",
    "question": "What is Paris?"
},
// More clues...
]
```
### 2. Get Clues by Category

- **Endpoint:** `/category`
- **Method:** GET
- **Description:** Retrieve trivia clues based on a specific category.
- **Parameters:**
  - `/id(int)` (required): The ID of the category to retrieve clues from.
- **Example Request:** `/category?id=10`
- **Example Response:**
```json
[
{
    "id": 101,
    "answer": "This country is known as the Land of the Rising Sun.",
    "question": "What is Japan?"
},
// More clues...
]
```
  
  ### 3. Get Categories

- **Endpoint:** `/categories`
- **Method:** GET
- **Description:** Retrieve a list of trivia categories.
- **Parameters:**
  - `/count(int)` (optional): The number of categories to retrieve (limited to 100 at a time).
  - `/offset(int)` (optional): Offset the starting ID of categories returned (useful for pagination).
- **Example Request:** `/categories?count=10&offset=20`
- **Example Response:**
```json
[
{
    "id": 21,
    "title": "World Capitals"
},
// More categories...
]
```
  
  ### 4. Get Clues by Value and Category

- **Endpoint:** `/clues`
- **Method:** GET
- **Description:** Retrieve trivia clues based on value and category.
- **Parameters:**
  - `/value(int)` (optional): The value of the clue in dollars.
  - `/category(int)` (optional): The ID of the category to retrieve clues from.
  - `/min_date(date)` (optional): The earliest date to show clues based on the original air date.
  - `/max_date(date)` (optional): The latest date to show clues based on the original air date.
  - `/offset(int)` (optional): Offset the returned clues (useful for pagination).
- **Example Request:** `/clues?value=200&category=10&min_date=2022-01-01&max_date=2022-12-31&offset=0`
- **Example Response:**
```json
[
{
    "id": 1001,
    "answer": "This is the longest river in the world.",
    "question": "What is the Nile River?"
},
// More clues...
]
```

### 5. Get Final Jeopardy Clues

- **Endpoint:** `/final`
- **Method:** GET
- **Description:** Retrieve a set number of Final Jeopardy clues.
- **Parameters:**
  - `/count(int)` (optional): The number of Final Jeopardy clues to retrieve (limited to 100 at a time).
- **Example Request:** `/final?count=3`
- **Example Response:**
```json
[
{
    "id": 10001,
    "answer": "This is the largest planet in our solar system.",
    "question": "What is Jupiter?"
},
// More Final Jeopardy clues...
]
```




## Question Acquisition

`get_url("api/clues?value=#{point_value}&category=#{category}&min_date=#{@min_date}&max_date=#{@max_date}")`

Using the endpoint `/api/clues` we can query `values` and `category` to recieve all questions between Jan 1 200 - Jan 1 2023.

(using testing data for now) 
```
clues = JApiService.new.get_clues("67, "100")
or /api/clues?category=67&value=100
```
This grabs all questions from the "First Ladies" category with a value of 100 points.

This expects the query to have a `:value :category_id :answer :question :airdate `
