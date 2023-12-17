<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.Quizizz" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        textarea {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            box-sizing: border-box;
        }

        .btn {
            margin-top: 20px;
        }

        input[type="submit"], input[type="reset"] {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #45a049;
        }

        #warning {
            color: red;
        }
    </style>
</head>
<%
    ArrayList<Quizizz> quizizzsArray = (ArrayList<Quizizz>) request.getAttribute("quizizzsArray");
%>
<body>
    <form action="CR_test?mod1=1" method="post" name="f1" onsubmit="return checkForm()">
        <table border="1" width="100%">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Question</th>
                    <th>AnswerA</th>
                    <th>AnswerB</th>
                    <th>AnswerC</th>
                    <th>AnswerD</th>
                    <th>Answer</th>
                    <th>Select</th> <!-- Cột thêm checkbox -->
                </tr>
            </thead>
            <tbody>
                <% int index = 1; for (Quizizz quizizz : quizizzsArray) { %>
                    <tr>                        
                        <td><%= index++ %></td>
                        <td><%= quizizz.getQuestion() %></td>
                        <td><%= quizizz.getAnswerA() %></td>
                        <td><%= quizizz.getAnswerB() %></td>
                        <td><%= quizizz.getAnswerC() %></td>
                        <td><%= quizizz.getAnswerD() %></td>
                        <td><%= quizizz.getAnswer() %></td>
                        <td><input type="checkbox" name="selectedQuestions" value="<%= quizizz.getQuizizzId() %>"></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <br>
        <label for="name_test">Tên đề thi:</label>
        <textarea name="name_test" id="name_test" required></textarea>
        <br>
        <div class="btn">
            <input type="submit" value="OK">
            <input type="reset" value="Reset">
        </div>
    </form>
    <span id="warning" style="display: none; color: red;"></span>
	<a href="javascript:history.back()">Back</a>
    <script>
        function checkForm() {
            var nameTestInput = document.forms.f1.name_test.value;
            var selectedQuestionsInputs = document.getElementsByName("selectedQuestions");
            var warningInfo = document.getElementById("warning");

            if (nameTestInput === "") {
                warningInfo.innerText = "Vui lòng nhập tên đề thi";
                warningInfo.style.display = "block";
                return false;
            }

            // Kiểm tra xem có ít nhất một câu hỏi được chọn không
            var atLeastOneQuestionSelected = false;
            for (var i = 0; i < selectedQuestionsInputs.length; i++) {
                if (selectedQuestionsInputs[i].checked) {
                    atLeastOneQuestionSelected = true;
                    break;
                }
            }

            if (!atLeastOneQuestionSelected) {
                warningInfo.innerText = "Vui lòng chọn ít nhất một câu hỏi";
                warningInfo.style.display = "block";
                return false;
            }

            warningInfo.style.display = "none";
            return true;
        }
    </script>
</body>
</html>
