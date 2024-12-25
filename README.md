# Real-Time-Streaming-with-Azure

## Project Overview
Welcome to the "Real-Time Streaming with Azure" repository. This project showcases a comprehensive end-to-end solution for real-time data streaming and analysis using Azure Stream Analytics, Azure Event Hubs and Azure Databricks with Key Vault. It provides a detailed guide on the setup, configuration, and implementation of a streaming data pipeline following the medallion architecture.


## Architecture
<p align="center">
  <img src="https://github.com/IbrahimKhalid11/Real-Time-Streaming-with-Azure/blob/master/Images/Solution%20Architecture.png" alt="Solution Architecture">
</p>

## Repository Contents
- `Solution Architecture.png`: High level solution architecture.
- `Real-time Data Processing with Azure Databricks.ipynb`: The Databricks notebook used for data processing at each layer of the medallion architecture.
- `Data Generator.py`: Generates sample data and JSON structures for simulating the streaming data flow.
- `Queries.sql`: SQL queries for processing and querying the streaming data.

## Prerequisites
- Active Azure subscription with access to Azure Stream Analytics, Azure Databricks and Event Hubs.
- Databricks Workspace with Unity Catalog Enabled.
- Azure Event Hubs Service.
- Azure Stream Analytics.
- Familiarity with Python, Spark, SQL, and basic data engineering concepts.
