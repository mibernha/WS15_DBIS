(
SELECT TABLE_NAME FROM USER_TABLES
)
UNION ALL
(
SELECT VIEW_NAME FROM USER_VIEWS
);