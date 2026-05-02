### Superstore-sales-analysis
Analyzed retail sales data to uncover profit drivers and inefficiencies using Python, SQL, and Power BI. Identified loss-making categories, discount impact on margins, and regional trends, delivering actionable insights through an interactive dashboard.


## 📌 Business Problem  
Retail sales data showed strong revenue but inconsistent profitability.  
The goal was to identify profit leakage by analyzing product-level margins, discount impact, and regional inefficiencies affecting overall performance.

---

## 🎯 Objective  
- Identify loss-making categories and sub-categories  
- Analyze the impact of discounts on profitability  
- Evaluate regional and segment-wise performance  
- Build a dashboard to track key KPIs  

---

## 🛠 Tools & Workflow  

### 🔹 Python  
- Cleaned and preprocessed ~10,000+ records  
- Handled missing values and standardized formats  
- Performed EDA to identify trends, correlations, and anomalies  

### 🔹 SQL  
- Used joins and aggregations to compute revenue, profit, and margins  
- Identified sub-categories contributing to ~70% of total losses  
- Segmented data across regions and categories using filtering logic  

### 🔹 Power BI  
- Built an interactive dashboard with KPIs:
  - Total Sales: ~₹2M+  
  - Profit: ~₹280K  
  - Profit Margin: ~14%  
- Enabled drill-down analysis across category → sub-category → product  
- Visualized trends, discount impact, and regional performance  

---

## 📈 Key Insights  
- Top 3 loss-making sub-categories contributed to ~65–70% of total losses  
- Discounts above 20% frequently resulted in negative profit margins  
- West region generated highest sales but lower profit margins (~12%)  
- Corporate segment contributed ~45% of revenue with lower profitability  

---

## ⚠️ Challenges & Solutions  

**Data Quality Issues**  
- Resolved missing values and inconsistencies using Python  

**Profitability Analysis Complexity**  
- Used SQL aggregations and filtering to isolate negative-margin products  

**Dashboard Design**  
- Created multiple views (Overview, Product, Customer, Geography) for better clarity  

---

## 🚀 Business Impact  
- Identified ~30% of products contributing to majority of losses  
- Highlighted discount thresholds impacting profitability  
- Improved visibility into regional and category performance  
- Enabled data-driven decisions for pricing and inventory  

---
## 📂 Project Structure  
- `data/` → raw and cleaned datasets  
- `notebooks/` → data cleaning & EDA  
- `sql/` → analytical queries  
- `dashboard/` → Power BI dashboard  

---


## 📸 Dashboard Preview

### Executive Overview
![Overview](Images/Executive_Overview.png)

### Customer Analysis
![Customer](Images/Customer_Analysis.png)

### Product Insights
![Product](Images/Product_Analysis.png)

### Geography Analysis
![Geography](Images/Geographical_Analysis.png)

### Operations Analysis
![Operations](Images/Operations_Analysis.png)
