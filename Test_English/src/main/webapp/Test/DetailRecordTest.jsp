<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.RecordTest" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List detail test</title>
        <link rel="stylesheet" href="./assets/css/reset.css">
        <link rel="stylesheet" href="./assets/css/nav.css">
        <link rel="stylesheet" href="./assets/css/codeTest.css">
        <link rel="stylesheet" href="./assets/css/modal.css">
        <script src="./assets/js/modal.js" defer></script>
</head>
<body>
    <% 
        ArrayList<RecordTest> recordTestsArray = (ArrayList<RecordTest>) request.getAttribute("RecordTestsArray"); 
        HttpSession ss = request.getSession();
        Integer user_id = (Integer) ss.getAttribute("user_id");
    %>
    <div id="navigation">
    	<div class = "center"><a class="<%= request.getParameter("mod3") != null ? "active" : "" %>" href="CRUD_vocabulary?mod3=1">Danh sách từ vựng</a>
        <a class="<%= request.getParameter("mod1") != null ? "active" : "" %>" href="CRUD_vocabulary?mod1=1">Thêm từ vựng</a>
        <a class="<%= request.getParameter("mod4") != null ? "active" : "" %>" href="#">Tìm kiếm từ vựng</a>
        <a class="<%= request.getParameter("mod5") != null ? "active" : "" %>" href="CR_test">Danh sách đề thi</a>
        
    	<a class="active" href="CR_recordTest?mod1=1">Lịch sử thi</a>
    	</div>    
    </div>
    
    
    <h3 class="txt">Lịch sử bài làm</h3>

<main>
    <table border="1" width="100%">
        <thead>
            <tr>
                <th>STT</th>
                <th>Test Name</th>
                <th>Question</th>
                <th>Correct Answer</th>
                <th>Student Answer</th>
                <th>Word Day</th>
            </tr>
        </thead>
        <tbody>
            <%int index = 1; for (RecordTest recordTest : recordTestsArray) { %>
                <tr>
                    <td><%= index++ %></td>
                    <td><%= recordTest.getNameTest() %></td>
                    <td><%= recordTest.getQuestion() %></td>
                    <td><%= recordTest.getCorrectAnswer() %></td>
                    <td><%= recordTest.getStudentAnswer() %></td>
                    <td><%= recordTest.getWordDay() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</main>
</body>
</html>