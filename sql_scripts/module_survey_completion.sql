WITH module_summary AS(
	SELECT
	  COALESCE(m1.recipient_id, m2.recipient_id, m3.recipient_id, m4.recipient_id) AS recipient_id,
	  p.iteration,
	  CASE WHEN m1.recipient_id IS NULL THEN 0 ELSE 1 END AS module1,
	  CASE WHEN m2.recipient_id IS NULL THEN 0 ELSE 1 END AS module2,
	  CASE WHEN m3.recipient_id IS NULL THEN 0 ELSE 1 END AS module3,
	  CASE WHEN m4.recipient_id IS NULL THEN 0 ELSE 1 END AS module4,
	  (CASE WHEN m1.recipient_id IS NULL THEN 0 ELSE 1 END +
	   CASE WHEN m2.recipient_id IS NULL THEN 0 ELSE 1 END +
	   CASE WHEN m3.recipient_id IS NULL THEN 0 ELSE 1 END +
	   CASE WHEN m4.recipient_id IS NULL THEN 0 ELSE 1 END) AS module_count
	FROM training.module1 m1
	FULL JOIN training.module2 m2 
	  ON m1.recipient_id = m2.recipient_id
	FULL JOIN training.module3 m3 
	  ON COALESCE(m1.recipient_id, m2.recipient_id) = m3.recipient_id
	FULL JOIN training.module4 m4 
	  ON COALESCE(m1.recipient_id, m2.recipient_id, m3.recipient_id) = m4.recipient_id
	-- Add the join to participants
	LEFT JOIN training.participants p 
	  ON COALESCE(m1.recipient_id, m2.recipient_id, m3.recipient_id, m4.recipient_id) = p.recipient_id
	GROUP BY 
	  COALESCE(m1.recipient_id, m2.recipient_id, m3.recipient_id, m4.recipient_id),
	  p.iteration,
	  m1.recipient_id, m2.recipient_id, m3.recipient_id, m4.recipient_id
	ORDER BY recipient_id
)

SELECT iteration, module_count, COUNT(*) AS n_participants
FROM module_summary
GROUP BY iteration, module_count
ORDER BY iteration, module_count;