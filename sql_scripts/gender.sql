SELECT recipient_id, definition1, definition2, definition3, definition4, question, answer
FROM training.posttest
JOIN training.questions
ON posttest.question_id = questions.question_id
WHERE posttest.question_id = 'prepost41';