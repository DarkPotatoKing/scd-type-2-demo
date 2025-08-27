# SCD Type 2 Demo

This repository demonstrates **Slowly Changing Dimension (SCD) Type 2**, a common data warehousing technique for preserving the history of changing dimension data.

## 🔹 Key Idea
Instead of overwriting old values, SCD Type 2 creates a **new row for each change**, with effective dates (and optionally a flag).  
This allows flexible queries:
- Current record → `IsCurrent = 1`
- As-of-date queries → using `StartDate` / `EndDate`
- Full history → select all rows

## 📂 Files
- `scd2_demo.sql` → Pure SQL example (table creation, inserts, updates, queries).
- `SCD_Type_2_Demo.ipynb` → Python + SQLite demo notebook (works in Google Colab, shows tables step by step).

## ▶️ Try it Online
👉 [Open in Colab](https://colab.research.google.com/github/your-username/scd-type-2-demo/blob/main/SCD_Type_2_Demo.ipynb)  
*(Replace `your-username` with your actual GitHub username)*

## 📊 Example Use Case
Imagine tracking customer addresses:
- Type 1 (overwrite): you lose the old address.
- Type 2 (new row): you keep both Manila (old) and Cebu (new) with dates, so reports remain accurate historically.
