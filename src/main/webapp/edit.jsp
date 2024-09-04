<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Note Taker : Edit Note</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container">
		<%@ include file="navbar.jsp"%>
		<h2>Edit your note.</h2>
		<br>

		<%
		int noteId = Integer.parseInt(request.getParameter("note_id"));

		Session s = FactoryProvider.getFactory().openSession();
		Note note = (Note) s.get(Note.class, noteId);
		%>

		<!-- This is update form -->
		<form action="UpdateServlet" method="post">



			<div class="form-group">
				<label for="title">Note Title</label> <input name="title" required
					type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here..."
					value="<%=note.getTitle()%>">
			</div>

			<div class="form-group">
				<label for="content" class="form-label">Note Content</label>
				<textarea name="content" required id="content"
					placeholder="Enter content here.." class="form-control"
					style="height: 300px;"><%=note.getContent()%></textarea>
			</div>

			<div class="container text-center p-2">
				<button type="submit" class="btn btn-success">Save your
					note</button>
			</div>
		</form>
	</div>

</body>
</html>