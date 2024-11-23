# Azure End-to-End Data Pipeline Project

## Project Overview

This project demonstrates the implementation of an end-to-end data pipeline on Azure. The pipeline processes raw healthcare data from a source, performs data transformations, and loads it into storage and analytics systems. The final results are visualized using Power BI.

### Key Technologies:
- **Azure Data Lake Storage (ADLS Gen2)** - For storing raw and processed data.
- **Azure Data Factory (ADF)** - For orchestrating data ingestion, transformations, and movement.
- **Azure Databricks** - For cleaning and transforming data.
- **Azure Synapse Analytics** - For advanced analytics and SQL-based transformations.
- **Power BI** - For creating visualizations from processed data.
- **Azure Key Vault** - For securely storing credentials and sensitive data.

## Workflow Overview

1. **Raw Data Storage**:
   - Raw healthcare data is stored in **Azure Data Lake Storage (ADLS Gen2)** in a separate storage account.

2. **Data Ingestion**:
   - **Azure Data Factory** is used to ingest the raw data into the staging layer. Data is processed with basic transformations such as joining, column removal, and hashing.

3. **Data Cleaning**:
   - Data is cleaned using **Azure Databricks**.

4. **Staged and Cleaned Data Storage**:
   - After cleaning, the data is stored in **ADLS Gen2** for further analysis.

5. **Analytics with Synapse**:
   - **Azure Synapse Analytics** is used to perform advanced analytics and create SQL-based views. These views aggregate, join, and transform the data into views for visualization.

6. **Visualization with Power BI**:
   - Power BI connects to the **Synapse Analytics** views to generate meaningful insights and visualizations.

7. **Security**:
   - Credentials are securely stored and managed in **Azure Key Vault**.

## Architecture Diagram

![Architecture Diagram](https://github.com/jacobjoe/azure-end-to-end-data-engineering/blob/main/Images/Azure%20Project%20Overview.jpg)

## Prerequisites

- **Azure Subscription**: An active Azure subscription.
- **Azure Data Lake Storage Gen2**: For storing raw and processed data.
- **Azure Data Factory**: To orchestrate data pipelines.
- **Azure Databricks**: For cleaning and transforming data.
- **Azure Synapse Analytics**: For running analytics queries.
- **Power BI**: For visualizing the data.
- **Azure Key Vault**: For storing credentials securely.

## Steps to Set Up

### 1. Set Up Azure Resources
- Create **Azure Data Lake Storage Gen2** accounts for raw and processed data.
- Set up **Azure Data Factory** for orchestrating the data pipelines.
- Deploy **Azure Databricks** workspaces for data cleaning and transformation.
- Set up **Azure Synapse Analytics** for SQL-based data analytics.
- Create an **Azure Key Vault** for securely managing credentials.

### 2. Configure Azure Data Factory
- Create linked services in **Azure Data Factory** to connect to your **Data Lake**, **Databricks**, and **Key Vault** resources.
- Define **datasets** for the raw, and staged data.
- Create **Data Flows** and **pipeline** to handle data ingestion, hashing, joining and loading.

### 3. Data Cleaning in Azure Databricks
- Develop **Databricks notebooks** for cleaning the data (removing unwanted columns, handling missing data, duplication removal, etc.).

### 4. Transform and Store Data in Synapse
- Use **Serverless SQL Pool** in **Synapse** to aggregate and transform the processed data into views.

### 5. Visualize Data in Power BI
- Connect **Power BI** to the Synapse SQL views to create interactive reports and dashboards.


## Security Considerations
- Credentials (Databricks Access Token & Synapse SQL Password) are stored securely in **Azure Key Vault**.
