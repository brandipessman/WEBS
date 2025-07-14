SELECT posttest.recipient_id, posttest.question_id, question, answer_type, definition1, definition2, definition3, definition4, definition5, definition6, definition7, answer, ele, arachnid_research, arachnid_course
FROM training.posttest
JOIN training.questions
ON posttest.question_id = questions.question_id
JOIN training.participants
ON posttest.recipient_id = participants.recipient_id
WHERE posttest.question_id = 'post27';