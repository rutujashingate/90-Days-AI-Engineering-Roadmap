# Day 5/90: APIs, HTTP & REST

Understanding how applications communicate with each other.

So far, most of what I’ve worked with has happened inside Python, pandas, SQL, or a notebook.

But real applications rarely work completely by themselves.

A frontend may need data from a backend.
A mobile app may need to save something to a server.
An application may need to connect to a payment service, database, search system, email service, or AI model.

For those different systems to work together, they need a way to communicate.

That is where APIs, HTTP, and REST come in.

## API

API stands for **Application Programming Interface**.

The simplest definition I’m keeping is:

> An API is a way for one software application to communicate with another.

Imagine we are building a simple task app:

**My Tasks**

- [ ] Learn APIs
- [ ] Practice Python
- [x] Learn SQL

The screen the user sees might be the frontend.

But the tasks themselves may be stored somewhere else, such as a backend server or database.

When the app opens, it needs to ask:

> Give me my tasks.

The frontend does not need to know exactly how the server stores the data.

It mainly needs to know:

- where to send the request
- what it wants the server to do
- what information to send
- how to authenticate
- what response to expect

That connection between the systems is the API.

## Client and Server

Most API communication involves a client and a server.

### Client

The client makes the request.

A client could be:

- browser
- mobile app
- frontend
- Python script
- AI agent

### Server

The server receives the request, performs some work, and sends a response.

This client/server model appears everywhere in software.

## HTTP

HTTP stands for **Hypertext Transfer Protocol**.

The full name sounds complicated, but the useful idea is simple:

> HTTP defines a common way for clients and servers to send requests and responses over the web.

For example:

```http
GET /tasks/42
```

means:

> Give me task 42.

The server might respond:

```json
{
  "id": 42,
  "title": "Learn APIs",
  "completed": false
}
```

An HTTP request usually contains things like:

- method
- endpoint
- parameters
- headers
- optional data

And the response usually contains:

- status code
- headers
- data

## REST

REST stands for **Representational State Transfer**.

Suppose task 42 exists on the server:

```text
Task 42

Title: Learn APIs
Completed: false
```

When our app asks for that task, the server might return:

```json
{
  "id": 42,
  "title": "Learn APIs",
  "completed": false
}
```

That JSON is a representation of the current state of the task.

So:

```text
Representational
→ the server sends a representation of something

State
→ its current data or condition

Transfer
→ that representation is transferred
  between client and server
```

That gives us the basic idea behind the name Representational State Transfer.

REST is a style for designing APIs in a predictable way.

Suppose our application manages:

- tasks
- users
- comments

These are called resources.

Instead of creating separate URLs like:

```text
/getTask
/createTask
/updateTask
/deleteTask
```

REST commonly keeps the resource in the URL:

```text
/tasks
/tasks/42
```

and uses the HTTP method to describe the action.

```text
GET /tasks/42
→ retrieve task 42

POST /tasks
→ create a task

PATCH /tasks/42
→ update part of task 42

DELETE /tasks/42
→ delete task 42
```

This separates two things clearly:

```text
URL
→ what resource are we talking about?

HTTP method
→ what do we want to do with it?
```

That makes APIs easier to understand and more predictable.

For example:

```http
GET /users/42
```

probably means:

> Give me user 42.

While:

```http
DELETE /users/42
```

probably means:

> Delete user 42.

One useful distinction:

```text
HTTP
→ the communication protocol

REST
→ a style for organizing an API
```

A simple way to remember it:

> HTTP is how the messages travel. REST is one way we organize the API.

## Endpoints

An endpoint is a specific location in an API where we send a request.

Suppose the API starts with:

```text
https://api.example.com
```

and tasks are available at:

```text
/tasks
```

Together:

```text
https://api.example.com/tasks
```

is an endpoint.

Another endpoint:

```text
https://api.example.com/tasks/42
```

could represent task 42.

Think:

> Endpoint = where should I send the request?

## HTTP Methods

Once we know where the request should go, we need to describe what we want the server to do.

The main methods to know are:

- GET
- POST
- PUT
- PATCH
- DELETE

### GET

GET retrieves data.

```http
GET /tasks/42
```

means:

> Give me task 42.

Possible response:

```json
{
  "id": 42,
  "title": "Learn APIs",
  "completed": false
}
```

Use GET when reading information.

```text
GET → read
```

### POST

POST is commonly used to create something new or send data to be processed.

Suppose we want to create a task:

```http
POST /tasks
```

We send:

```json
{
  "title": "Practice APIs"
}
```

The server might return:

```json
{
  "id": 43,
  "title": "Practice APIs",
  "completed": false
}
```

```text
POST → create / process
```

### PATCH

PATCH changes part of an existing resource.

Suppose task 42 is:

```json
{
  "id": 42,
  "title": "Learn APIs",
  "completed": false
}
```

We only want to mark it completed:

```http
PATCH /tasks/42
```

```json
{
  "completed": true
}
```

```text
PATCH → update specific fields
```

### PUT

PUT is generally used to replace the full representation of a resource.

```http
PUT /tasks/42
```

```json
{
  "title": "Learn APIs properly",
  "completed": true
}
```

Simple distinction:

```text
PUT
→ replace/update the whole resource

PATCH
→ update only part of it
```

Exact behavior can vary between APIs, so documentation always matters.

### DELETE

DELETE removes a resource.

```http
DELETE /tasks/42
```

means:

> Delete task 42.

So:

```text
GET     → read
POST    → create/process
PUT     → replace
PATCH   → partially update
DELETE  → remove
```

## Path Parameters

Look at:

```text
/tasks/42
```

The `42` identifies which task we want.

The API may describe this route as:

```text
/tasks/{task_id}
```

where:

```text
task_id = 42
```

Use path parameters when identifying a particular resource.

Examples:

```text
/users/15
→ user 15

/orders/900
→ order 900

/conversations/32
→ conversation 32
```

Think:

> Path parameter = which one?

## Query Parameters

Suppose we don’t want one specific task.

We want:

> Give me unfinished tasks, but only return 10.

We might request:

```text
/tasks?completed=false&limit=10
```

The query parameters are:

```text
completed=false
limit=10
```

Everything begins after `?`.

Multiple query parameters are separated with `&`.

Query parameters are commonly used for:

- filtering
- search
- sorting
- limits
- pagination
- optional settings

For example:

```text
/products?category=books
```

or:

```text
/conversations?limit=20
```

The distinction:

```text
/tasks/42
→ WHICH task?

/tasks?limit=10
→ HOW should tasks be returned?
```

## JSON

Applications need a format for exchanging structured data.

One of the most common formats is JSON.

JSON stands for **JavaScript Object Notation**.

Example:

```json
{
  "id": 42,
  "title": "Learn APIs",
  "completed": false
}
```

If you know Python dictionaries, it looks familiar:

```python
task = {
    "id": 42,
    "title": "Learn APIs",
    "completed": False
}
```

JSON is commonly used for:

- request data
- response data

For example, a POST request might send:

```json
{
  "title": "Practice APIs"
}
```

and receive:

```json
{
  "id": 43,
  "title": "Practice APIs"
}
```

## Headers

Requests can contain headers.

Headers carry additional information about the request.

For example:

```http
Content-Type: application/json
```

means:

> The data I’m sending is JSON.

Another common header is:

```http
Authorization: Bearer YOUR_API_KEY
```

which can be used for authentication.

Headers are commonly used for things like:

- authentication
- content type
- response format
- request metadata

Think:

> Headers provide extra information about the request.

## API Keys

Many APIs need to know who is making the request.

One common method is an API key.

The key can be linked to:

- your account
- permissions
- usage
- rate limits
- billing

It may be sent in a header:

```http
Authorization: Bearer YOUR_API_KEY
```

API keys are secrets.

Don’t do this in code that will be uploaded publicly:

```python
api_key = "my-real-secret-key"
```

Instead, store the secret in an environment variable:

```python
import os

api_key = os.getenv("API_KEY")
```

And check that it exists:

```python
if not api_key:
    raise RuntimeError("API_KEY is missing")
```

A rule worth remembering:

> Never commit API keys to GitHub.

## HTTP Status Codes

When a server responds to a request, it usually includes an HTTP status code that tells us what happened.

Some important ones to know are:

| Status code | Meaning |
| --- | --- |
| 200 OK | The request succeeded |
| 201 Created | A new resource was created successfully |
| 400 Bad Request | Something is wrong with the request or data we sent |
| 401 Unauthorized | Authentication is missing or the API key/token is invalid |
| 403 Forbidden | The server knows who we are, but we are not allowed to do this |
| 404 Not Found | The requested resource does not exist |
| 429 Too Many Requests | We sent too many requests and hit a rate limit |
| 500 Internal Server Error | Something went wrong on the server |
| 503 Service Unavailable | The server is temporarily unavailable |

A simple way to remember the groups:

```text
2xx → success

4xx → problem with the request/client

5xx → problem on the server
```

There can also be network errors where no HTTP status code is returned at all, such as no internet connection, a timeout, or the server being unreachable.

## Calling an API with Python

A common Python library for making HTTP requests is `requests`.

Install it:

```bash
pip install requests
```

Then:

```python
import requests

response = requests.get("https://api.example.com/tasks/42")
print(response.status_code)
print(response.json())
```

What’s happening?

```text
requests.get(...)
       ↓
HTTP GET request
       ↓
server
       ↓
HTTP response
       ↓
response.json()
```

## Query Parameters in Python

Instead of manually writing:

```text
/tasks?completed=false&limit=10
```

we can do:

```python
params = {"completed": "false", "limit": 10}
response = requests.get("https://api.example.com/tasks", params=params)
```

The library builds the URL for us.

## Sending JSON with Python

Creating a task:

```python
new_task = {"title": "Practice APIs"}
response = requests.post("https://api.example.com/tasks", json=new_task)
```

`requests` takes the Python dictionary and sends it as JSON.

## Authentication in Python

We can send an API key through a header:

```python
import os
import requests

api_key = os.getenv("API_KEY")
headers = {"Authorization": f"Bearer {api_key}"}
response = requests.get("https://api.example.com/tasks", headers=headers)
```

## SDK

SDK stands for **Software Development Kit**.

The easiest way to think about it is:

> The SDK is basically pre-written code provided for you that already knows how to make the API requests.

Usually, the company that owns the API provides the SDK.

For example, if a service has an API, it may also provide a Python SDK so you don’t have to manually build every HTTP request yourself.

A real example is OpenAI: OpenAI provides an API, and it also provides an SDK that gives you ready-made Python methods for calling that API.

### Without an SDK

You might write:

```python
requests.post(
    "https://api.example.com/tasks",
    headers={...},
    json={...}
)
```

You have to handle things like:

- endpoint
- HTTP method
- authentication
- headers
- JSON
- response parsing

### With an SDK

The service may provide something simpler like:

```python
client.tasks.create(title="Practice APIs")
```

```text
Raw HTTP
→ you write the API request yourself

SDK
→ pre-written helper code makes the API request for you
```

The important thing to remember:

> API = the service you communicate with.
>
> SDK = the code provided to make communicating with that API easier.

## Putting It Together

Suppose we send:

```http
GET /tasks/42?include=comments
```

with:

```http
Authorization: Bearer API_KEY
```

We can now understand every piece:

```text
GET
→ retrieve data

/tasks
→ resource

42
→ path parameter
→ which task?

include=comments
→ query parameter
→ an optional request setting

Authorization
→ header
→ authentication
```

The server might respond:

```text
200 OK
```

with:

```json
{
  "id": 42,
  "title": "Learn APIs",
  "completed": false,
  "comments": []
}
```

So an HTTP request can contain:

```text
method
+
endpoint
+
path parameters
+
query parameters
+
headers
+
optional JSON
```

And the response commonly contains:

```text
status code
+
headers
+
JSON/data
```

## Practice — Don’t Just Read

Try writing a small Python script that:

- sends a GET request
- prints the status code
- reads the JSON response
- adds query parameters
- sends a POST request with JSON
- handles a 404
- loads an API key from an environment variable

Happy learning:)
