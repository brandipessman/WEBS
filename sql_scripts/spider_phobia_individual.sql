SELECT posttest.recipient_id, questions.question_id, question,
  CASE 
    WHEN pretest.answer = 1 THEN 1 
    WHEN pretest.answer = 2 THEN 0 
    ELSE NULL 
  	END AS pre_answer,
  CASE 
    WHEN posttest.answer = 1 THEN 1 
    WHEN posttest.answer = 2 THEN 0 
    ELSE NULL 
  END AS post_answer
FROM training.pretest
JOIN training.posttest 
	ON pretest.recipient_id = posttest.recipient_id
	AND pretest.question_id = posttest.question_id
JOIN training.questions
	ON questions.question_id = pretest.question_id
	AND questions.question_id = posttest.question_id
WHERE pretest.answer IS NOT NULL 
	AND posttest.answer IS NOT NULL
	AND questions.question_type = 'Spider Phobia Questionaire';
