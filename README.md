# Snowflake Data Warehouse Project

## Overview
This repository contains the scripts, documentation, and resources for building a comprehensive data warehouse using Snowflake. It demonstrates an end-to-end solution from data ingestion from an OLTP system, through staging and transformation in Snowflake, to serving the data for BI and analytics purposes.

## Features Explored
In this project, we explore various Snowflake features and capabilities, including:
1. **SnowPipe**: Automated data loading into Snowflake using SnowPipe.
2. **Various Table Types**: Utilizing different table types such as transient, temporary, and permanent for efficient data management.
3. **Views**: Implementation of both standard and secure views to control data access and security.
4. **Time Travel**: Leveraging Snowflake's Time Travel feature for accessing historical data and simplifying data recovery.
5. **Swapping**: Using the Swap feature to atomically replace tables.
6. **Tasks**: Automating workflows and data processing using Snowflake Tasks.
7. **Zero-Copy Cloning**: Efficiently cloning databases, schemas, and tables without duplicating data.
8. **Materialized Views**: Improving performance of aggregated queries using Materialized Views.
9. **Streams**: Capturing changes to data in tables using Snowflake Streams for real-time processing and analytics.
10. **Fail-safe and Data Retention Policies**: Understanding and implementing data protection and retention policies in Snowflake.

## Low-Level Design

![Snowflake-2023-10-28-052040](https://github.com/pravin-raut/SnowflakeDataWarehouse/assets/65663124/e1f70fc2-b0e5-415b-8640-0cb228b77156)

## Architecture

The project is structured around a modern data warehouse design, using Snowflake as the central warehousing solution. The architecture follows a staged approach:

1. **Ingestion from OLTP System**: Data is ingested from an OLTP system to an object store, encompassing sales, customers, products, payment methods, and store locations.

2. **Staging in Snowflake**: Data is then staged in Snowflake, retaining the structure and schema of the source OLTP system.

3. **Core Layer**: Data is transformed and integrated into a core layer, addressing any data quality issues and preparing for analytical processing.

4. **Data Warehouse Schema**: The core layer feeds into a dimensional model, suitable for fast, efficient querying and analysis.

5. **BI and Analytics**: Finally, data is made available for BI tools and analytics platforms, enabling business intelligence, reporting, and decision-making.

## Project Files
- `OLTP_Export_Scripts`: Scripts to export data from the OLTP system.
- `Staging_Scripts`: SQL scripts for staging the data in Snowflake.
- `Transformation_Scripts`: SQL for transforming data into the core layer and data warehouse schema.
- `BI_Setup`: Documentation and scripts for setting up BI tools and dashboards.
- `Feature_Implementation`: Detailed examples and scripts showcasing the implementation of Snowflake features such as SnowPipe, Tasks, Streams, Time Travel, etc.

## Installation and Setup
Instructions for setting up the Snowflake environment, including creating databases, schemas, and necessary integrations.

## Usage
Guidelines on how to use the scripts and implement the features in your own Snowflake environment.

## Contributing
Information on how to contribute to this project, including coding standards, pull requests, and issue reporting.

---

Feel free to add or modify any sections as needed to match your project's scope and details.
