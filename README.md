# Home Test API (Karate + Maven)
API tests for the demo application using **Karate + Maven**.

## Prerequisites
- GitHub account
- Docker
- Java 21
- Maven 3.9+

## Setup
1. Clone this repository:

git clone https://github.com/Kup87/home-test-API.git
cd home-test-API

2. Pull and run the demo API:

docker pull automaticbytes/demo-app
docker run -p 3100:3100 automaticbytes/demo-app

3. Verify the API is up:
   
- Go to http://localhost:3100/api
- You should see a message saying **"up"**

## Running the tests

1. Run with Maven:

mvn test

2. Open the Karate HTML report:

target/karate-reports/karate-summary.html