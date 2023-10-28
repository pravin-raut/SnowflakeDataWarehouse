# Snowflake Data Warehouse Project

## Overview
This repository contains the scripts, documentation, and resources for building a comprehensive data warehouse using Snowflake. It demonstrates an end-to-end solution from data ingestion from an OLTP system, through staging and transformation in Snowflake, to serving the data for BI and analytics purposes.

## Architecture
The project is structured around a modern data warehouse design, using Snowflake as the central warehousing solution. The architecture follows a staged approach:

1. **Ingestion from OLTP System**: Data is ingested from an OLTP system, encompassing sales, customers, products, payment methods, and store locations.

2. **Staging in Snowflake**: Data is then staged in Snowflake, retaining the structure and schema of the source OLTP system.

3. **Core Layer**: Data is transformed and integrated into a core layer, addressing any data quality issues and preparing for analytical processing.

4. **Data Warehouse Schema**: The core layer feeds into a dimensional model, suitable for fast, efficient querying and analysis.

5. **BI and Analytics**: Finally, data is made available for BI tools and analytics platforms, enabling business intelligence, reporting, and decision-making.

## Project Files
- `OLTP_Export_Scripts`: Scripts to export data from the OLTP system.
- `Staging_Scripts`: SQL scripts for staging the data in Snowflake.
- `Transformation_Scripts`: SQL for transforming data into the core layer and data warehouse schema.
- `BI_Setup`: Documentation and scripts for setting up BI tools and dashboards.

## Usage
Each folder contains specific instructions on how to use the scripts and set up the respective components of the data warehouse.

## Contributing
Contributions to the Snowflake Data Warehouse project are welcome! Please read through our contributing guidelines for more information on making pull requests.

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
