SELECT 
    CONCAT('Project ', project.id) AS name, 
    (
        SELECT SUM(worker.salary * DATEDIFF(MONTH, project.start_date, project.finish_date)) 
        FROM worker 
        WHERE worker.id = project_worker.worker_id
    ) AS price
FROM project_worker 
LEFT JOIN project ON project.id = project_worker.project_id 
ORDER BY price DESC