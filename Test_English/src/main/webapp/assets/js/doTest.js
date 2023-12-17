function updateStudentAnswer(questionId) {
            var userAnswerInput = document.querySelector('input[name="userAnswers_' + questionId + '"]:checked');
            var userAnswer = userAnswerInput ? userAnswerInput.value : 'null';
            document.getElementById('studentAnswer_' + questionId).value = userAnswer;
        }

        function checkAnswers(event) {
            var formData = new FormData(document.getElementById("quizForm"));
            var questionIds = document.querySelectorAll('input[name^="questionIds"]');
            var resultDiv = document.getElementById("result");
            var resultsHTML = "";

            questionIds.forEach(function (questionIdInput) {
                var questionId = questionIdInput.value;
                var userAnswer = formData.get('userAnswers_' + questionId);
                var correctAnswer = formData.get('questionAnswer_' + questionId);
                var explanation = formData.get('questionExp_' + questionId);
                
                formData.set('userAnswers_' + questionId, userAnswer || 'null');
                
                var result = (userAnswer === correctAnswer) ? 'Correct' : 'Incorrect';

                resultsHTML += '<div class="question-result">';
                resultsHTML += '<p class="' + (userAnswer === correctAnswer ? 'correct-answer' : 'incorrect-answer') + '">Question ' + questionId + ': ' + result + '</p>';
                resultsHTML += '<p>Correct Answer: <span class="correct-answer">' + correctAnswer + '</span></p>';
                if (explanation !== 'null') {
                    resultsHTML += '<p class="explanation">' + explanation + '</p>';
                }
                resultsHTML += '</div>';
            });

            document.getElementById("submitTestButton").style.display = "inline";
            document.getElementById("checkTestButton").style.display = "none";
            resultDiv.innerHTML = resultsHTML;
        }