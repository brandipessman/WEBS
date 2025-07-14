SELECT posttest.recipient_id, 
  SUM(CASE 
    WHEN pretest.answer = 1 THEN 1 
    WHEN pretest.answer = 2 THEN 0 
    ELSE NULL 
  	END) AS pre_answer_composite,
  SUM(CASE 
    WHEN posttest.answer = 1 THEN 1 
    WHEN posttest.answer = 2 THEN 0 
    ELSE NULL 
  END) AS post_answer_composite,
  ele, arachnid_research, arachnid_course
FROM training.pretest
JOIN training.posttest 
	ON pretest.recipient_id = posttest.recipient_id
	AND pretest.question_id = posttest.question_id
JOIN training.questions
	ON questions.question_id = pretest.question_id
	AND questions.question_id = posttest.question_id
JOIN training.participants
	ON participants.recipient_id = posttest.recipient_id
	AND participants.recipient_id = pretest.recipient_id
WHERE pretest.answer IS NOT NULL 
	AND posttest.answer IS NOT NULL
	AND questions.question_type = 'Spider Phobia Questionaire'
GROUP BY posttest.recipient_id, ele, arachnid_research, arachnid_course
HAVING COUNT(DISTINCT posttest.question_id) = 15 
ORDER BY posttest.recipient_id;
