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
👉 [Open in Colab](https://colab.research.google.com/drive/1_lli546ZV3KPNwMrN8YYLspRIxEGvGPT?usp=sharing)  

---

## 📊 Types of Slowly Changing Dimensions (SCD)

There are several standard strategies for handling changes in dimension data:

| **Type** | **Approach** | **Keeps History?** | **Usage** |
|----------|--------------|--------------------|-----------|
| **0** | Retain original value (never update) | ❌ No | Rare, used for immutable fields (e.g., Birthdate) |
| **1** | Overwrite old value | ❌ No | Common, used when history isn’t needed (e.g., Phone number) |
| **2** | Add new row with dates/flag | ✅ Full history | Very common ✅ (e.g., Customer address, Employee department) |
| **3** | Add new column (previous value) | ✅ Limited | Less common, only keeps current + 1 previous value |
| **4** | Current table + separate history table | ✅ Full history | Rare, used for performance or archiving |
| **6** | Hybrid (1+2+3 combined) | ✅ Full + Limited | Niche, used in enterprise warehouses |

👉 In practice:
- **Type 1 & Type 2** are by far the most common.  
- **Type 2** is the simplest way to keep full history.  

---

## 📊 Example Use Case
Imagine tracking customer addresses:
- Type 1 (overwrite): you lose the old address.  
- Type 2 (new row): you keep both Manila (old) and Cebu (new) with dates, so reports remain accurate historically.  
