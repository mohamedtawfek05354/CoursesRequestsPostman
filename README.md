
# Postman API Testing Project

## Project Overview
This project is designed to automate API testing using **Postman** and **Newman**. It interacts with a course management API, and the data is served from a **json-server** mock database (`db.json`). The project includes creating, retrieving, updating, and deleting course records. Reports are generated in CSV and HTML formats using **Newman**.

## Prerequisites
Before you begin, ensure you have met the following requirements:
- **Postman**: Installed for creating and testing API requests.
- **Node.js** and **npm**: Installed on your system.
- **Newman**: Installed globally via npm for running the Postman collection from the command line:
  ```bash
  npm install -g newman
  ```
- **json-server**: For hosting the mock API locally. Install it using:
  ```bash
  npm install -g json-server
  ```

## Files Included
1. **Postman Project.json**: The Postman collection containing various API requests.
2. **Locally.postman_environment.json**: Postman environment file with base URL and variables.
3. **db.json**: JSON file used by `json-server` to mock the API data.
4. **PostmanTest.bat**: A batch file to automate running the Newman command.

## Steps to Set Up

### 1. Start `json-server`
To start the `json-server`, run the following command in your terminal:
```bash
json-server --watch ./db.json --port 3000
```
This will serve the API on `http://localhost:3000` by default.

### 2. Import Environment File
Import the **Locally.postman_environment.json** file into Postman. Ensure that the `url` variable is set to the running `json-server` address (e.g., `http://localhost:3000`).

### 3. Run the Postman Collection with Newman
To run the Postman collection via Newman and generate reports, use the following command:
```bash
newman run "./Postman Project.json" -e "./Locally.postman_environment.json" -r cli,htmlextra,csv --report-htmlextra-export "./PostmanTest.html" --report-csv-export "./PostmanTest.csv"
```
This command will:
- Run the Postman requests defined in the collection.
- Generate CLI output.
- Export HTML and CSV reports to `PostmanTest.html` and `PostmanTest.csv`, respectively.

### 4. Running with Batch File
You can also run the batch file provided in the project folder. Execute the batch file by double-clicking it or running it from the command line:
```bash
RunProjectPostman.bat
```

## Postman Collection Details
The Postman collection consists of the following requests:

### 1. Post Course
- **Method**: `POST`
- **Endpoint**: `{{url}}/courses/`
- **Request Body**:
  ```json
  {
      "title": "Appuim Course",
      "Description": "Learn Appuim with RestAssured and Postman"
  }
  ```
- **Description**: This request creates a new course and sets the course ID in the environment variable `Course`.

### 2. GetRequest
- **Method**: `GET`
- **Endpoint**: `{{url}}/courses/{{Course}}`
- **Tests**: Verifies that the status code is `200` and checks if the course title matches "Appuim Course".

### 3. UpdateUpdate
- **Method**: `PUT`
- **Endpoint**: `{{url}}/courses/{{Course}}`
- **Request Body**:
  ```json
  {
      "title": "Java for Testers",
      "Description": "Introduction to Java for QA"
  }
  ```
- **Description**: Updates an existing course with a new title and description.

### 4. DeleteCourse
- **Method**: `DELETE`
- **Endpoint**: `{{url}}/courses/{{Course}}`
- **Description**: Deletes the course specified by the `Course` variable.

### 5. GetAllCourses
- **Method**: `GET`
- **Endpoint**: `{{url}}/courses`
- **Description**: Fetches all available courses from the mock server.

## Environment Variables
- **url**: The base URL for the API (`http://localhost:3000`).
- **Course**: Variable storing the course ID created during the **Post Course** request.

## Reports
- **CLI Report**: Displayed in the terminal during the Newman run.
- **HTML Report**: Saved as `PostmanTest.html` in the working directory.
- **CSV Report**: Saved as `PostmanTest.csv` in the working directory.

## Troubleshooting
- Ensure that the **json-server** is running on the specified port (default: `3000`).
- Verify that the environment file points to the correct base URL (`http://localhost:3000`).
- Modify the batch file paths if needed to reflect your project’s folder structure.

## Conclusion
This project serves as a template for automating API testing using Postman and Newman, providing a clear structure for managing API requests and generating reports. You can extend this project by adding more endpoints, enhancing tests, or integrating with CI/CD pipelines for continuous testing.

