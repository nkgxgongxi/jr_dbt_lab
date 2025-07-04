# JR Academy Data Engineer DBT Lab
This repo provides a simple demo on how we can leverage dbt to organize data ETL process.

# 🧭 Action Guide: Setting Up dbt with Snowflake

**Pre-requisite**  
You’ll need a prepared **Snowflake warehouse environment**.  
For the script to prepare such an environment, please refer [here](#).

---

## 1. Create a Python Virtual Environment

```bash
python -m venv dbt-airflow-lab
```
## 2. Activate the Environment and Install dbt Dependencies.
```bash
.\dbt-airflow-lab\Scripts\activate
pip install dbt-core dbt-snowflake
```
> 💡 Since we're using Snowflake as our demo platform, dbt-snowflake is required.

## 3. Initialize dbt Project. 
```bash
dbt init
```
You’ll be prompted with the following:
* Database: Choose 1 for Snowflake.
* Authentication method: Select 1 for password.
* Threads: Enter 1 for single-threaded execution.

## 4. Test Run the Project
```bash
dbt run
```

> ✅ You should now see one table and one view created in the public schema of your database — these are default test artifacts generated by dbt.

## 5. Clean Up the Default Models
* Delete the example folder under models/.
* Drop the corresponding table and view from the public schema in your Snowflake environment.

## 6. Prepare for ETL Development
We will now set up schemas and folder structure for a layered ELT workflow using dbt.

### Manual Steps in Snowflake:
Create the following schemas in your Snowflake database:
* bronze
* silver
* gold

### Directory Structure:
Create the following folder structure inside your dbt project:

models/

├── bronze/

├── silver/

└── gold/

## 7. Build Layered Models
We'll define models in each schema to organize data transformation:
* Bronze: Ingest raw data (e.g., from the public schema) and write to the bronze schema.
* Silver: Clean and enrich bronze data, outputting into the silver schema.
* Gold: Aggregate and transform silver data into business-ready tables in the gold schema.

Each model should use the appropriate +schema configuration in dbt_project.yml to ensure it lands in the correct Snowflake schema.