# Sprint 2.1: MySQL Databases Structure

## Description

This project was created for academic purposes as part of the IT Academy Java & Spring specialization. The goal of this task is to design, implement, and query relational databases using MySQL.
The project covers four distinct business scenarios, progressing from basic relational models to advanced database features such as Triggers, Views, and Stored/Virtual columns.

## Technologies

- MySQL (Relational Database Management System)
- SQL (DDL, DML, and DQL)
Project Structure
The project is organized by business domains, each containing its schema definition (script_*.sql), data insertion (insert_*.sql), and sample queries (*_queries.sql).


## Project Structure
```
TascaS2.01/
└── Level 1
      └── Exercise 1
              └── Optics/
                    ├── optics_script.sql
                    ├── insert_optics.sql
                    └── optics_queries.sql
      └── Exercise 2
              └── Pizzeria/
                    ├── script_pizzeria.sql
                    ├── insert_pizzeria.sql
                    └── pizzeria_queries.sql
└── Level 2
      └── YouTube/
          ├── script_youtube.sql
          └── insert_youtube.sql
└── Level 3
      └── Spotify/
          ├── script_spotify.sql
          └── insert_spotify.sql
```

## Installation and Usage: 🚀 Running with Docker

This project uses **Docker Compose** to manage a MySQL database in an isolated and persistent environment.

### 📋 Prerequisites

*   [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running.
*   An SQL client (Recommended: [DataGrip](https://www.jetbrains.com/datagrip/) or MySQL Workbench).

### 🛠️ Setup and Installation

1. **Launch the container:**
    Open a terminal in the project folder and run:

    ```bash
    docker-compose up -d
    ```
    *This command will pull the MySQL image, create a persistent volume for your data, and expose the service on port 3307.*

3.  **Verify status:**
    You can check if the container is running correctly with:
    ```bash
    docker ps
    ```

### 🔌 Database Connection

To connect from **DataGrip** or any other SQL client, use the following parameters:

*   **Host:** `localhost`
*   **Port:** `3307` (mapped internally to 3306 to avoid local conflicts)
*   **User:** `root`
*   **Password:** The one defined in `PASSWORD_ROOT` in the `.env` file.
*   **Database:** The one defined as `DB_NAME` in the `.env` file.

### 💾 Data Persistence
The container uses a **Docker Volume** named `isalvama-mysql-volume`. This ensures that even if you stop or delete the container, your tables and data will remain saved on your local machine.

### 🛑 Managing the Service

*   **Stop containers:** `docker-compose stop`
*   **Remove containers (keeping data):** `docker-compose down`
*   **Remove containers AND delete all data:** `docker-compose down -v`

## Database Scenarios

1. **Optics (Cul d'Ampolla)**

A management system for an optics store.
- Relational Model: Connects suppliers with specific brands and glasses.
- Key Features:
  - Use of **ENUM** for frame types (floating, plastic, metallic).
  - Customer recommendation system (self-referencing foreign key).
  - Sales tracking linking employees, customers, and unique items.

2. **Pizzeria**

A delivery and store management system with geographic data.
- **Geographic Hierarchy**: Country -> Province -> Town.
- **Advanced Features** (Triggers):
  - `update_command_total_price`: Automatically calculates and updates the total order price when products are added.
  - `set_default_shipping_arrival_date`: Sets an estimated arrival time (40 minutes after registration).
  - `set_shipping_delivery_price`: Applies dynamic shipping costs based on the total order value (free for orders over €15).

3. **YouTube**

A simplified clone of the video platform's backend.
- **Logic**: Handles users, channels, video uploads, and interaction history.
- **Key Features**:
  - Interaction tracking for Likes/Dislikes on both videos and comments.
  - Subscription system between users and channels.
  - Playlist management with incorporation dates for each video.

4. **Spotify**

A music streaming service model focusing on subscriptions and social features.

- **Subscription Logic**: Differentiates between Free and Premium users using a MySQL View (view_user_status_subscription).
- **Data Integrity**:
  - Simulates subtype relationships for payment methods (Credit Card vs. PayPal).
  - Uses STORED columns to automatically calculate subscription renewal dates.
  - Uses VIRTUAL columns to determine if a playlist is active based on its removal date.
- **Automation (Triggers)**:
Automatically updates the number_of_songs counter in a playlist when songs are added or removed.

## Concepts Covered
- **DDL (Data Definition Language)**: Creating databases, tables, and relationships using FOREIGN KEY.
- **DML (Data Manipulation Language)**: Efficient data insertion and management.
- **DQL (Data Query Language)**: Complex JOIN operations, SUM, COUNT, and DATE_SUB functions.
- **Database Automation**: Implementation of BEFORE/AFTER INSERT and DELETE triggers.
- **Data Consistency**: Using SET FOREIGN_KEY_CHECKS to manage script execution safely.
- **Virtual/Stored Columns**: Optimizing data retrieval through calculated fields.
