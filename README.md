# Superstore SQL Analysis

SQL practice project on the Sample Superstore retail dataset (9,994 orders), written in MySQL.

## Tools
MySQL 8, MySQL Workbench, Git, VS Code

## Skills demonstrated
- Filtering: WHERE, IN, BETWEEN, NOT BETWEEN, LIKE
- Sorting and limiting: ORDER BY, LIMIT
- Aggregation: COUNT, SUM, AVG, MAX, MIN
- GROUP BY and HAVING
- JOINs: INNER, LEFT, RIGHT, and finding unmatched rows with LEFT JOIN + IS NULL

## Key findings
- Technology is the category with the highest total sales.
- California is the top state by total profit.
- Standard Class is the most used ship mode, with 5,968 orders.
- Binders have the highest average discount (about 37%), followed by Machines (31%) and Tables (26%).

## Files
- `queries/01_filtering.sql`: filtering and sorting
- `queries/02_group_by_having.sql`: aggregation, GROUP BY, HAVING
- `queries/03_joins.sql`: JOINs
- `screenshots/`: sample query results

## Lessons learned
- WHERE filters rows before grouping; HAVING filters groups after aggregation.
- "Highest total" means SUM, then ORDER BY DESC, not MAX.
- For a join, first decide which table must keep all its rows.

## Next steps
Self joins, subqueries and CTEs, window functions.