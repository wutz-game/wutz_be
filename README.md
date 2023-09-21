# Wutz

_What's Wutz?_

Wutz is a daily social trivia game featuring clues from the Jeopardy! game show. [^1] This Repo is the Wutz backend API that builds games from questions and stores completed user games.
[^1]: _The Jeopardy! game show and all elements thereof, including but not limited to copyright and trademark thereto, are the property of Jeopardy Productions, Inc. This application is not affiliated with, sponsored by, or operated by Jeopardy Productions, Inc._
### Table of Contents

* [🔌 Wutz API Endpoints](#-wutz-api-endpoints)
* [🚀 Getting Started](#-getting-started)
* [🌐 APIs Consumed](#-apis-consumed)
* [👤 Authors](#-authors)

## 🔌 Wutz API Endpoints

### Get Daily Challenge

#### Request Endpoint

`GET` `/api/challenges`

#### Response

<details closed>
<summary>Successful Response Body</summary>

```json
{
  "data": {
    "type": "game",
    "id": 1,
    "date": "18/09/2023",
    "categories": [
      {
        "category": "first ladies",
        "category_emoji": null,
        "questions": [
          {
            "answer": "Abigail Adams",
            "question": "Born in Massachusetts, she was descended from the Quincy family on her mother's side",
            "points": 1
          },
          {
            "answer": "Mary Lincoln",
            "question": "While she was First Lady, her half brother Samuel was killed at the Battle of Shiloh",
            "points": 2
          },
          {
            "answer": "Grace Coolidge",
            "question": "She graduated from the University of Vermont in 1902",
            "points": 3
          }
        ]
      },
      {
        "category": "geography",
        "category_emoji": null,
        "questions": [
          {
            "answer": "Kazakhstan",
            "question": "Of the 14 countries that border Russia, this \"stan\" country shares the longest border with it, 4,750 miles",
            "points": 1
          },
          {
            "answer": "Italy",
            "question": "The northern end of this country's largest lake, Lake Garda in the Po Valley, once belonged to Austria",
            "points": 2
          },
          {
            "answer": "a steppe",
            "question": "A vast grassland from central Europe to Manchuria is called by this 1-syllable word from the Russian",
            "points": 3
          }
        ]
      },
      {
        "category": "sports",
        "category_emoji": null,
        "questions": [
          {
            "answer": "golf",
            "question": "Ben Crenshaw & Phil Mickelson are the only 3-time winners of this college sport's championship tournament",
            "points": 1
          },
          {
            "answer": "Emmitt Smith",
            "question": "In 1994 this Dallas Cowboy scored 22 touchdowns; in 1995 he topped that with 25",
            "points": 2
          },
          {
            "answer": "Carlton Fisk",
            "question": "Inducted into the Hall of Fame in 2000, this catcher hit a dramatic homer in Game 6 of the 1975 World Series",
            "points": 3
          }
        ]
      }
    ]
  }
}
```
</details>

### Post Your Completed Daily Challenge

#### Request Endpoint

`POST` `/api/user_games`


#### Post Format

<details closed>
<summary>Example POST Request Format</summary>

```json
{ 
  "data": { 
    "type": "user_games",
    "user_id": 12,
    "game_id": 1,
    "score": 6,
    "user_answers": [
      {
        "game_question_id": 1,
        "user_answer": "putting green eggs and ham",
        "result": "self_corrected"
      },
      {
        "game_question_id": 2,
        "user_answer": "the Hebrew National league",
        "result": "correct"
      },
      {
        "game_question_id": 3,
        "user_answer": "cheshire cat scan",
        "result": "self_corrected"
      },
      {
        "game_question_id": 4,
        "user_answer": "coors",
        "result": "correct"
      },
      {
        "game_question_id": 5,
        "user_answer": "",
        "result": "skipped"
      },
      {
        "game_question_id": 6,
        "user_answer": "jack daniels",
        "result": "incorrect"
      },
      {
        "game_question_id": 7,
        "user_answer": "a down town",
        "result": "self_corrected"
      },
      {
        "game_question_id": 8,
        "user_answer": "happy pappy",
        "result": "incorrect"
      },
      {
        "game_question_id": 9,
        "user_answer": "a low blow",
        "result": "self_corrected"
      }
    ]
  }
}
```
</details>

#### Response

<details closed>
<summary>Successful Response Body</summary>

```json
{
  "data"=>{
    "id"=>"8", 
    "type"=>"user_game", 
    "attributes"=>{
      "user_id"=>12, 
      "score"=>6, "created_at"=>"2023-09-20T20:27:59.247Z"
      }, 
    "relationships"=>{
      "game"=>{
        "data"=>{
          "id"=>"16", 
          "type"=>"game"}
      }
    }
  }
}
```
</details>


## 🚀 Getting Started

### Requirements

* Rails 7.0.X
* Ruby 3.2.x
* PostgresQL
* A ChatGPT API Key to generate Emojis

### Installing

<details closed>
<summary>Clone the repo to your local machine</summary>

```
You can also fork it if you would like to work on your own project
```
</details>

<details closed>
<summary>Install all requisite Gems:</summary>
    
```
bundle install
```
</details>

<details closed>
<summary>Create and seed your local Postgres database</summary>
    
```
rails db:{create,migrate,seed}
```
</details>

<details closed>
<summary>Run the Rake task to create the day's game</summary>
    
```
rails daily_game:create_daily_game
```
</details>

## 🌐 APIs Consumed

* [jService.io](https://jservice.io/)
* [ChatGPT](https://platform.openai.com/docs/guides/gpt)


## 👤 Authors

**Wutz** is a student project built in September, 2023 for the Backend Program of the [Turing School of Software and Design](https://turing.edu/).

* **Ethan Black** ❗ [Github]() | [LinkedIn]()
* **Chris Cullinane** ❗ ([Github](), [LinkedIn]())
* **Ian Lyell** ❗ ([Github](), [LinkedIn]())
* **Connor Richmond** ❗ ([Github](), [LinkedIn]())
* **Mike Wood** ❗ ([Github](), [LinkedIn]())

## Notice

All clues are pulled from [jService.io](https://jservice.io/). 
