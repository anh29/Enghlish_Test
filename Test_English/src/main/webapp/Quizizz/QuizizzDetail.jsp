<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="models.bean.Quizizz" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết câu hỏi</title>
<style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #3498db; /* Blue color */
            color: #fff; /* White text */
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            height: 100vh;
            margin: 0;
            text-align: center;
        }

        h3 {
            color: #fff; /* White text */
            font-size: 24px; /* Larger font size */
            margin-top: 20px;
        }

        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 70%;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            color: #333; /* Black text */
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        td.line {
            border-bottom: none; /* Remove bottom border for Field cells */
            white-space: nowrap; /* Prevent line break in Field content */
            width: 25%; /* 1/4 of the table width */
        }

        td.detail {
            width: 75%; /* 3/4 of the table width */
        }

        a {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>
<h3>Chi tiết câu hỏi</h3>
<%
    Quizizz quizizz = (Quizizz) request.getAttribute("quizizz");
%>

    <%= quizizz.getQuizizzId() %> <br>
    Question: <%= quizizz.getQuestion() %>  <br>
    Answer A: <%= quizizz.getAnswerA() %> <br>
    Answer B: <%= quizizz.getAnswerB() %> <br>
    Answer C: <%= quizizz.getAnswerC() %> <br>
    Answer D: <%= quizizz.getAnswerD() %> <br>
    Correct Answer: <%= quizizz.getAnswer() %> <br>
    Explanation: <%= quizizz.getExplaination() %> <br>
    <br>
    <a href="javascript:history.back()">Back</a>
</body>
</html>
