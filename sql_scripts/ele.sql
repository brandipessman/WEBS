SELECT 
  participants.recipient_id,
  MAX(CASE 
    WHEN posttest.question_id IS NULL THEN NULL 
    WHEN posttest.answer = 1 THEN 1 
    WHEN posttest.answer IS NULL THEN 0 
    ELSE NULL 
  END) AS answer
FROM training.participants
LEFT JOIN training.posttest
  ON participants.recipient_id = posttest.recipient_id
LEFT JOIN training.questions
  ON posttest.question_id = questions.question_id
WHERE questions.question_id = 'participation5' OR questions.question_id IS NULL
GROUP BY participants.recipient_id
ORDER BY participants.recipient_id;
