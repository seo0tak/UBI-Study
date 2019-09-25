<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소켓 서버</title>

<style>
/* CodeMirror */
* { -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;}
html,body { /* width:100%; height:100%; background: #21292e; overflow:hidden; margin: 0;  */}
body {  font-size: 12px; color:#000000; background-color: white; }/* 드래그했을 때의 색상 */
.CodeMirror {border-top: 1px solid #eee; border-bottom: 1px solid #eee; line-height: 1.3; height: 100%; }
.cm-matchhighlight {background-color: #376060; color: #ffffff !important;} /* 같은단어강조 */
.CodeMirror-matchingbracket { background-color: #cc0000; color: #000000 !important; } /* 괄호강조 */
/* CodeMirror */
#chat_box {
	border-radius:10px;
	border: 1px solid rgba(0,0,0,0.3) !important;
	width: 100%;
	height: 70%;
	border: 1px solid black;
	overflow: auto;
}

#msg {
	width: 83%;
}

#msg_process {
	position:relative;
	top:5px;
	width: 15%;
	height: 15%;
}

.log{
	color: gray;
	font-size: 70%;
	margin: 5px;
	text-align: center;
}
.CodeMirror{
	width:700px;
	border: 2px inset #dee;	
}
.chat{
	position:absolute;
	bottom:3%;
	right:22%;
	width:25%;
	height: 32%;
}
input{
	outline-color: #fa1 !important;
	outline-width: 2px !important;
	outline: invert !important;
	height: 30px;
	font-size: 20px;
}
input.img-button {
	background-image: url("<%=request.getContextPath()%>/resources/video-meet/images/chat_button.gif");
	border: none;
	cursor: pointer;
	background-size: cover;
}
@font-face{
		font-family: 'NIXGONFONTS';
		src: url("<%=request.getContextPath()%>/resources/video-meet/font/NIXGONFONTS M 2.0.ttf") format('truetype');
}
.console{
	position:absolute;
	bottom:5%;
	right:52%;
	width:25%;
	height: 30%;
}
#output{
	border-radius:10px;
	border: 1px solid rgba(0,0,0,0.3) !important;
	width: 100%;
	height: 90%;
	overflow: auto;
}
video{
	width:100%;
	border-radius: 15px;
	margin-bottom: 5%;
}
</style>
<link rel="stylesheet" href="https://codemirror.net/lib/codemirror.css">
<link rel="stylesheet" href="https://codemirror.net/addon/scroll/simplescrollbars.css"><!-- 스크롤바 -->
<link rel="stylesheet" href="https://codemirror.net/theme/bespin.css"><!-- theme -->
<link rel="stylesheet" href="https://codemirror.net/theme/dracula.css">
<link rel="stylesheet" href="https://codemirror.net/addon/hint/show-hint.css">
<script src="https://codemirror.net/addon/hint/show-hint.js"></script>
<script src="https://codemirror.net/lib/codemirror.js"></script><!-- 필수 -->
<script src="https://codemirror.net/addon/edit/matchbrackets.js"></script><!-- 괄호강조 -->
<script src="https://codemirror.net/keymap/sublime.js"></script><!-- 괄호강조 -->
<script src="https://codemirror.net/addon/search/match-highlighter.js"></script><!-- 같은단어 강조 -->
<script src="https://codemirror.net/mode/xml/xml.js"></script><!-- 필수 -->
<script src="https://codemirror.net/mode/javascript/javascript.js"></script><!-- 필수 -->
<script src="https://codemirror.net/mode/css/css.js"></script><!-- 필수 -->
<script src="https://codemirror.net/mode/htmlmixed/htmlmixed.js"></script><!-- 필수 -->
<script src="https://codemirror.net/mode/clike/clike.js"></script>
<script src="https://codemirror.net/addon/scroll/simplescrollbars.js"></script><!-- 스크롤바 -->
</head>
<body>
	<div class="chat" >
		<font style="font-family: NIXGONFONTS;font-size: 20px; color: rgba(0,0,0,0.5)">chat</font>
	<div id="chat_box" style="padding-top: 10px;padding-left: 10px"></div>
	<input type="text" id="msg">
	<input id="msg_process" type="button" class="img-button">
	</div>
	<textarea class="java_code" id='java-code' name='java_code' style="overflow: auto;margin: auto;"></textarea><br>
	
	<button onclick="openTextFile()">Open</button>
	<button id="code_process">Run</button>
	
	<div class="console">
		<font style="font-family: NIXGONFONTS;font-size: 20px; color: rgba(0,0,0,0.5)">result</font><br>
		<textarea id="output" name='output' readonly="readonly" style="resize: none;"></textarea>
	</div>
	<input id="txt-roomid">
	<button id="btn-open-or-join-room">연결
	</button>
	
	<div style="position: absolute;right:0;top:0;width: 20%;height: 20%;padding: 2%;">
		<div id="local-videos-container" >
		</div>
		<div id="remote-videos-container" >
		</div>
	</div>
	<script src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>
	<script src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>
	<script src="https://floating-cove-33208.herokuapp.com/socket.io/socket.io.js"></script>
	<script src="https://code.jquery.com/jquery-1.11.1.js"></script>
	<script>
	
		/* CodeMirror */
		var javaEditor = CodeMirror.fromTextArea(document.getElementById("java-code"), {
	        lineNumbers: true,
	        matchBrackets: true,
	        mode: "text/x-java"
	      }); 
		/* CodeMirror */
		
		$(document).ready(function() {
			$.ajax({
				type: 'POST',
				url: 'http://localhost:9090/ex/file.ubi',
				success:function(data) {
					//alert(data);
					javaEditor.setValue(data);
				}
			});
			
			var connection = new RTCMultiConnection();
			connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

			var socket = io("https://floating-cove-33208.herokuapp.com/");
			
			//msg에서 키를 누를떄
			$("#msg").keydown(function(key) {
				//해당하는 키가 엔터키(13) 일떄
				if (key.keyCode == 13) {
					//msg_process를 클릭해준다.
					msg_process.click();
				}
			});

			//msg_process를 클릭할 때
			$("#msg_process").click(function() {
				//소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
				socket.emit("send_msg", $("#msg").val());
				socket.emit("nick", "${nick}");
				//#msg에 벨류값을 비워준다.
				$("#msg").val("");
			});
			
			javaEditor.on('keyup', function () {
				socket.emit("send_code", javaEditor.getValue());
				//var coords = JSON.stringify(javaEditor.getCursor());
				var coords = javaEditor.getCursor();
				//alert(coords);
				socket.emit("coords", coords);
		    });
			
			//소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
			socket.on('send_msg', function(msg) {
				//div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
				$('<div></div>').text(msg).appendTo("#chat_box");
				$('#chat_box').scrollTop($('#chat_box').prop('scrollHeight'));
			});
			
			//소켓 서버로 부터 user_join를 통해 이벤트를 받을 경우 
			socket.on('user_join', function(name) {
				$('<div class="log"></div>').text(name+'님 입장!!').appendTo("#chat_box");
				$('#chat_box').scrollTop($('#chat_box').prop('scrollHeight'));
			});
			
			//소켓 서버로 부터 user_exit를 통해 이벤트를 받을 경우 
			socket.on('user_exit', function(name) {
				$('<div class="log"></div>').text(name+'님 나감!!').appendTo("#chat_box");
				$('#chat_box').scrollTop($('#chat_box').prop('scrollHeight'));
			});
			
			//소켓 서버로 부터 send_code를 통해 이벤트를 받을 경우 
			socket.on('send_code', function(code) {
				javaEditor.setValue(code);
				$('.java_code').scrollTop($('.java_code').prop('scrollHeight'));
			});
			
			//소켓 서버로 부터 coords를 통해 이벤트를 받는경우
			socket.on('coords', function(coords) {
				//alert(coords.line);
				//alert(coords.ch);
				javaEditor.focus();
				javaEditor.setCursor(coords.line,coords.ch);//커서위치 셋팅 커서 절대값
			});
			
			//소켓 서버로 부터 result를 통해 이벤 트를 받는경우
			socket.on('result', function(result) {
				$('#output').val(result);
			});
			
			
			
			var bitrates = 512;
			var resolutions = 'Ultra-HD';
			var videoConstraints = {};
			if (resolutions == 'HD') {
			    videoConstraints = {
			        width: {
			            ideal: 1280
			        },
			        height: {
			            ideal: 720
			        },
			        frameRate: 30
			    };
			}
			if (resolutions == 'Ultra-HD') {
			    videoConstraints = {
			        width: {
			            ideal: 1920
			        },
			        height: {
			            ideal: 1080
			        },
			        frameRate: 30
			    };
			}
			connection.mediaConstraints = {
			    video: videoConstraints,
			    audio: true
			};
			var CodecsHandler = connection.CodecsHandler;
			connection.processSdp = function(sdp) {
			    var codecs = 'vp8';
			    
			    if (codecs.length) {
			        sdp = CodecsHandler.preferCodec(sdp, codecs.toLowerCase());
			    }
			    if (resolutions == 'HD') {
			        sdp = CodecsHandler.setApplicationSpecificBandwidth(sdp, {
			            audio: 128,
			            video: bitrates,
			            screen: bitrates
			        });
			        sdp = CodecsHandler.setVideoBitrates(sdp, {
			            min: bitrates * 8 * 1024,
			            max: bitrates * 8 * 1024,
			        });
			    }
			    if (resolutions == 'Ultra-HD') {
			        sdp = CodecsHandler.setApplicationSpecificBandwidth(sdp, {
			            audio: 128,
			            video: bitrates,
			            screen: bitrates
			        });
			        sdp = CodecsHandler.setVideoBitrates(sdp, {
			            min: bitrates * 8 * 1024,
			            max: bitrates * 8 * 1024,
			        });
			    }
			    return sdp;
			};
			
			
			connection.session = {
				    audio: true,
				    video: true
				};
			
			connection.sdpConstraints.mandatory={
					OfferToReceiveAudio: true,
					OfferToReceiveVideo: true,
			};
			
			connection.onstream = function(event) {
				 //document.video_box.appendChild(event.mediaElement);
				var video = event.mediaElement;
				
				if(event.type == 'local'){
					localVideosContainer.appendChild(video);
				}
				
				if(event.type == 'remote'){
					remoteVideosContainer.appendChild(video);
				}
				
			}
			
			var roomid = document.getElementById('txt-roomid');
			roomid.value = connection.token();
			
			document.getElementById('btn-open-or-join-room').onclick = function() {
				this.disabled = true;
				connection.openOrJoin('your-room-id' || 'predefiend-roomid');
			}

				
				var localVideosContainer = document.getElementById('local-videos-container');
				var remoteVideosContainer = document.getElementById('remote-videos-container');
				
			
		});
		
		$("#code_process").click(function() {
			//javaEditor.select();//전체선택
			var code_value = javaEditor.getValue();
			var code_data = {"code":code_value};
				$.ajax({
					type: 'POST',
					url: 'http://localhost:9090/ex/compile.ubi',
					data: code_data,
					success:function(result) {
						$('#output').val(result);
					}
				});
			});
		
		function openTextFile() {
		    var input = document.createElement("input");
		 
		    input.type = "file";
		    input.accept = "text/plain"; // 확장자 .java일때
		 
		    input.onchange = function (event) {
		        processFile(event.target.files[0]);
		    };
		 	
		    input.click();
		}
		 
		function processFile(file) {
		    var reader = new FileReader();
		 
		    reader.onload = function () {
		    	javaEditor.setValue(reader.result);
		    };
		 
		    reader.readAsText(file, /* optional */ "UTF-8");
		}
		/* 캠 */
	
	</script>
</body>
</html>