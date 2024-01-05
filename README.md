# SQL-Analysis-Project
Greetings! In this engaging project, we embark on an exploration of international debt statistics using SQL. Let's delve into the intricacies of my code:

1. Laying the Foundation: Crafting Sample Data

We begin by establishing our virtual environment with the creation of the international_debt_table. Think of it as our canvas, ready to capture the nuances of global debt.
To infuse realism, we inject life into our canvas by populating it with sample data, offering a glimpse into plausible international debt scenarios.
2. Organizing the Workspace: Introducing Temporary Tables

Say hello to temp_debt_data, our backstage area. This temporary table is meticulously curated to hold only the essential columns required for our in-depth analysis.
3. The Essentials: Unveiling Fundamental Queries

Query 1: Casts a spotlight on the number of countries grappling with debt (num_countries_with_debt). It's our initial exploration into the global landscape.
Query 2: Summons the grand total of debt worldwide (total_debt_amount). It's about getting a panoramic view of the financial landscape.
Query 3: Identifies the heavyweight – the country with the loftiest debt and its precise amount (highest_debt_amount).
Query 4: Engages in a nuanced analysis, computing the average debt per country for distinct debt indicators (avg_debt_amount).
Query 5: Decodes the pulse of the market, revealing the most prevalent debt indicator (num_occurrences).
4. Elevating Complexity: Unleashing Advanced SQL Techniques

Query 6: Orchestrates a symphony using Common Table Expressions (CTEs) to track cumulative debt for each country.
Query 7: Raises the bar with SQL window functions, orchestrating a ranking of countries based on their debt (debt_rank).
Query 8: Dives into the temporal dimension, extracting data based on specific dates.
Query 9: Initiates a social discourse, uncovering countries with analogous debt levels through an intricate self-join.
Query 10: Infuses a touch of artistry, utilizing regular expressions to discern patterns within debt indicators.
Query 11: Celebrates diversity, employing set operators to identify distinctive debt indicators.
Query 12: Simplifies the narrative by creating a view, debt_summary_view, offering a streamlined perspective.
Query 13: Leverages the view to unveil the latest debt figures for each country.
Query 14: Demonstrates respect for privacy, truncating data by rounding debt amounts.
Query 15: Paints a vivid picture by labeling countries based on debt amounts using CASE statements.
5. Closing Act: Tidying Up the Stage

The curtains fall gracefully as we bid adieu to our temporary table, temp_debt_data. It served its purpose, and now it gracefully exits the scene.
