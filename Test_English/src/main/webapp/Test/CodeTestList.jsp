<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.CodeTest" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CodeTest List</title>
        <link rel="stylesheet" href="./assets/css/reset.css">
        <link rel="stylesheet" href="./assets/css/nav.css">
        <link rel="stylesheet" href="./assets/css/codeTest.css">
        <link rel="stylesheet" href="./assets/css/modal.css">
        <script src="./assets/js/modal.js" defer></script>
</head>
<body>
    <% 
        ArrayList<CodeTest> CodeTestsArray = (ArrayList<CodeTest>) request.getAttribute("CodeTestsArray"); 
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
    
    
    <h3 class="txt"><a href="CR_recordTest">Ket qua bai lam</a></h3>
    <main>
        <form action="" method="post">
            <table>
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>De Thi</th>
	                    <% if (user_id != null && user_id == 1) { %>
					        <th>Detail</th>
					    <% } %>
                        <th>Test</th>
                    </tr>
                </thead>
                <tbody>
                    <% int index = 1; for (CodeTest codeTest : CodeTestsArray) { %>
                        <tr>
                            <td><%= index++ %></td>
                            <td><%= codeTest.getName() %></td>
                         <% if (user_id != null && user_id == 1) { %>
					        <td><a href="CR_test?mod2=1&&ID_test=<%= codeTest.getId() %>">...</a></td>
					    <% } %>
                            <td><a href="CR_test?mod3=1&&ID_test=<%= codeTest.getId() %>">Do test</a></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </form>
    </main>
	<a href="javascript:history.back() " style="font-size: 26px; color: #0066cc;  margin-left:120px">Back</a>
    <% if (user_id != null && user_id == 1) { %>
		<a href="CR_test?mod1=1" style="font-size: 26px; color: #0066cc; margin-left:120px">Thêm đề thi</a>
    <% } %>
    
    
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
