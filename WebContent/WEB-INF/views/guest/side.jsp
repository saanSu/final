<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="sidebar-sticky">
	<ul class="nav flex-column">
		<li class="nav-item"><a class="nav-link ${(empty uri || uri=='index') ? 'active':'' }" href="${pageContext.servletContext.contextPath }/"> <span
				data-feather="home"></span> Index <span class="sr-only">(current)</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="#"> <span
				data-feather="file"></span> Message
		</a></li>
		<li class="nav-item"><a class="nav-link" href="#"> <span
				data-feather="shopping-cart"></span> Board
		</a></li>
		<li class="nav-item"><a class="nav-link" href="#"> <span
				data-feather="users"></span> Members
		</a></li>
		<li class="nav-item"><a class="nav-link ${ uri=='chat' ? 'active':'' }" 
			href="${pageContext.servletContext.contextPath }/chat/room.do"> <span
				data-feather="users"></span> Chat
		</a></li>
	</ul> 
	<h6
		class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
		<span>Setting</span> <a
			class="d-flex align-items-center text-muted" href="#"> <span
			data-feather="plus-circle"></span>
		</a>
	</h6>
	<ul class="nav flex-column mb-2">
		<li class="nav-item"><a class="nav-link ${ uri=='modify' ? 'active':'' }" href="${pageContext.servletContext.contextPath }/private/modify.do"> <span
				data-feather="file-text"></span> Change Profile
		</a></li>
		<li class="nav-item"><a class="nav-link" href="#"> <span
				data-feather="file-text"></span> - </a></li>
	</ul>
	<hr/>
	<h6
		class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
		<span>Saved reports</span> <a
			class="d-flex align-items-center text-muted" href="#"> <span
			data-feather="plus-circle"></span>
		</a>
	</h6>
	<div id="alert" style="font-size: .75em">
	
	</div>
	
	<script>
		var ws = new WebSocket("ws://"+location.host+"${pageContext.servletContext.contextPath}/alert.do");
		ws.onmessage = function(evt) {
			console.log(evt.data);
			var obj = JSON.parse(evt.data);
			switch(obj.mode) {
			case "login":
				loginAlertHandle(obj);
				break;
			case "duplicate":
				duplicateAlertHandle(obj);
				break;
			case "newtalk":
				newtalkAlertHandle(obj);	
			}
		};
				
		var newtalkAlertHandle = function(obj) {
			var html = "<div class=\"alert alert-warning alert-dismissible fade show px-3 mt-4 mb-1\" role=\"alert\">";
			html += "<strong>【채팅방】</strong><br/>새로운 채팅이 있습니다.";
			html += "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
			html += "<span aria-hidden=\"true\">&times;</span>";
			html += "</button>";
			html += "</div>";
			document.getElementById("alert").innerHTML += html;
		}
		
		var loginAlertHandle = function(obj) {
			var html = "<div class=\"alert alert-warning alert-dismissible fade show px-3 mt-4 mb-1\" role=\"alert\">";
			html += "<strong>【로그인】</strong><br/>" + obj.actor.NAME+"(" + obj.actor.DNAME+"/"+ obj.actor.PNAME+")";
			html += "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
			html += "<span aria-hidden=\"true\">&times;</span>";
			html += "</button>";
			html += "</div>";
			document.getElementById("alert").innerHTML += html;
		}
		var duplicateAlertHandle = function(obj) {
			var html = "<div class=\"alert alert-danger px-3 mt-4 mb-1 \" role=\"alert\">";
			html += "<strong>【중복로그인】</strong><br/>다른기기에서 로그인되었습니다.<br/>재로그인해주십시요.";
			html += "</div>";
			document.getElementById("alert").innerHTML += html;
			document.getElementById("alert").id="";
		}
		
	</script>
</div>
