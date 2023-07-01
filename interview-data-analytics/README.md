# Interview Data Analytics

This repository contains a wide set of files related to technical assessments taken in the past. More specifically, it focuses on an array of topics and use cases in data analytics such as data extractions, manipulations, and analysis using SQL and Python.

## Getting Started 

To get started, clone this repository to your local machine or download the individual query files that you're interested in. Each query file is self-contained and can be executed independently using your preferred database management tool or IDE environment.

## Contents

The repository is organized by company (**anonymized** by company `industry-size-letter`, where letter continues per industry) and files contained within folder inlcude problem statement, solution, and rationale. For example:

* media-startup-A
* media-startup-B
* health-large-A
* ecommerce-medium-A
* media-large-C

Feel free to explore the directories and files to find the queries that suit your needs.

## Running Queries

To run a query, open the corresponding query file in your SQL database management tool (e.g., MySQL Workbench, PostgreSQL pgAdmin, or SQLite CLI) and execute the query against your target database. Make sure you have the necessary database connections set up and the required privileges to execute the queries. 

Alternatively, you can trial cloud data warehouse environments like Snowflake or Databricks, and proceed with adding the corresponding DDL/DML code and executing the query.

To run a Python, interface with your database within an IDE (e.g. IDLE, PyCharm, Spyder) and interact with data assets in your script. Alternatively, some modern tools offer Python capabilities which make interfacing with data easier.

## Contributing
If you have SQL queries that you'd like to contribute to this repository, please follow these guidelines:

1. Fork the repository.
2. Create a new branch for your queries: `git checkout -b feature/new-queries`
3. Add your query files to the relevant directory.
4. Commit your changes: `git commit -am 'Add new queries'`.
5. Push the branch to your forked repository: `git push origin feature/new-queries`.
6. Submit a pull request to the main repository.

Please ensure that your queries are well-documented and include any necessary explanations or context.

## Future Ideas
* Create replicable modern data stack for others to quickstart faster