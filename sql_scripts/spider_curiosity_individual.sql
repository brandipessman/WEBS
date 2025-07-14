SELECT pretest.recipient_id, iteration, pretest.question_id, question, answer_type, definition1, definition2, definition3, definition4, definition5,
pretest.answer AS pre_answer, posttest.answer AS post_answer, ele
FROM training.pretest
JOIN training.posttest
ON pretest.recipient_id = posttest.recipient_id AND pretest.question_id = posttest.question_id
JOIN training.questions
ON pretest.question_id = questions.question_id
JOIN training.participants
ON pretest.recipient_id = participants.recipient_id
WHERE pretest.answer IS NOT NULL AND posttest.answer IS NOT NULL
AND questions.question_type = 'Spider Curiosity';