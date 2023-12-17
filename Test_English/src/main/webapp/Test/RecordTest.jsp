
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.RecordTest" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CodeTest List</title>
        <link rel="stylesheet" href="./assets/css/reset.css">
        <link rel="stylesheet" href="./assets/css/nav.css">
        <link rel="stylesheet" href="./assets/css/recordTest.css">
        <link rel="stylesheet" href="./assets/css/modal.css">
        <script src="./assets/js/modal.js" defer></script>
        <script src="./assets/js/recordTest.js" defer></script>
</head>
<body>
    <% 
        ArrayList<RecordTest> RecordTestsArray = (ArrayList<RecordTest>) request.getAttribute("RecordTestsArray"); 
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

	<div class="result-container" id="result-container">
	    <% int index = 1; for (RecordTest recordTest : RecordTestsArray) { %>
	        <div class="result-item">
	            <div class="cont">
	                <h4>STT <%= index++ %></h4>
	                <div class="content">
	                    <p>Thời gian: <%= recordTest.getWordDay() %></p>
	                    <p><strong>Đề: <%= recordTest.getNameTest() %></strong></p>
	                </div>
	            </div>
	            <a href="CR_recordTest?day=<%= recordTest.getWordDay() %>">Xem chi tiết</a>
	        </div>
	    <% } %>
	</div>

<div class="pagination">
    <button onclick="prevPage()">Previous</button>
    <button onclick="nextPage()">Next</button>
</div>



	<!-- Modal -->
	<div id="searchModal" class="modal">
	  <div class="modal-content">
	    <span class="close" onclick="closeModal()">&times;</span>
	    <form name="form1" action="CRUD_vocabulary?mod4=1" id="searchForm" method="post" onsubmit="submitSearch()">
	      <label for="searchInput">Nhập từ cần tìm:</label>
	      <input type="text" id="infor" name="infor" required>
	      <input type="submit" value="Find">
	    </form>
	  </div>
	</div>

</body>
</html>
