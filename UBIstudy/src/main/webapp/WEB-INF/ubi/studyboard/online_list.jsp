<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/sweetalert/css/sweetalert2.min.css">
<script src="<%=request.getContextPath() %>/resources/sweetalert/js/sweetalert2.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/jstree/themes/default/style.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/jstree/jstree.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소켓 서버</title>

<style>
/* CodeMirror */
* { -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;}
html,body { /* width:100%; height:100%; background: #21292e; overflow:hidden; margin: 0;  */}
body {  font-size: 12px; color:#000000; background-color: white; }/* 드래그했을 때의 색상 */
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
	top:10px;
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
	margin-top:2%;
	width:57%;
	border: 2px inset #dee;	
	font-size:25px;
	height: 100%;
}
.chat{
	position:absolute;
	bottom:3%;
	left:32%;
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
	left:2%;
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
div.CodeMirror-cursorsVisible {
	visibility: visible !important;
}

/* 버튼  */
/* toggle this class */

.color-bg-start {
  background-color: salmon;
}


/* toggle class bg-animate-color */

.bg-animate-color {
  animation: random-bg .5s linear infinite;
}


/* add animation to bg color  */

@keyframes random-bg {
  from {
    filter: hue-rotate(0);
  }
  to {
    filter: hue-rotate(360deg);
  }
}

.fun-btn {
  /* change bg color to get different hues    */
  background-color: salmon;
  color: white;
  padding: 1em 2em;
  border: none;
  transition: all .3s ease;
  border-radius: 5px;
  letter-spacing: 2px;
  text-transform: uppercase;
  outline: none;
  align-self: center;
  cursor: pointer;
  font-weight: bold;
}

.fun-btn:hover {
  animation: random-bg .5s linear infinite, grow 1300ms ease infinite;
}

.start-fun {
  background-color: #fff !important;
  /* change color of button text when fun is started   */
  color: salmon !important;
}

/* pulsating effect on button */
@keyframes grow {
  0% {
    transform: scale(1);
  }
  14% {
    transform: scale(1.3);
  }
  28% {
    transform: scale(1);
  }
  42% {
    transform: scale(1.3);
  }
  70% {
    transform: scale(1);
  }
}
.demo { overflow:auto; border:1px solid silver; min-height:50%; }

.jstree-node {
    font-size: 13pt;
}

.page {
  position:absolute;
  top:1%;
  left:50%;
  display: flex;
  justify-content: center;
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
	<button onclick="openTextFile()">Open</button>
	
	<div class="page">
 		<button class="fun-btn" id="code_process">RUN</button>
	</div>
	
	<div id="frmt" class="demo" style="position: absolute;right: 21%;top:9%;width: 20%;"></div>
	
	<div class="chat">
		<font style="font-family: NIXGONFONTS;font-size: 20px; color: rgba(0,0,0,0.5)">chat</font>
	<div id="chat_box" style="padding-top: 10px;padding-left: 10px"></div>
	<input type="text" id="msg">
	<input id="msg_process" type="button" class="img-button">
	</div>
	<div>
		<textarea class="java_code" id='java-code' name='java_code'></textarea><br>
	</div>
	
	
	
		
		
	<div class="console">
		<font style="font-family: NIXGONFONTS;font-size: 20px; color: rgba(0,0,0,0.5)">result</font><br>
		<textarea id="output" name='output' readonly="readonly" style="resize: none;"></textarea>
	</div>
	<input type="hidden" id="txt-roomid">
	
	<div style="position: absolute;right:0;top:0;width: 20%;height: 20%;padding: 2%;">
		<div id="local-videos-container" >
		</div>
		<div id="remote-videos-container" >
		</div>
	</div>
	<script src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>
	<script src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>
	<script src="https://floating-cove-33208.herokuapp.com/socket.io/socket.io.js"></script>
	
	<script>
		/* CodeMirror */
		var javaEditor = CodeMirror.fromTextArea(document.getElementById("java-code"), {
	        lineNumbers: true,
	        matchBrackets: true,
	        mode: "text/x-java",
	        autofocus : true
	      }); 
		/* CodeMirror */
		
		//그냥 참조할려고 예제로 넣어둔 파일트리
			$('#frmt').jstree({
				'core' : {
					'data' : [
						{
							"text" : "Root node",
							"state" : { "opened" : true },
							"children" : [
								{
									"text" : "Child node 1",
									"state" : { "selected" : true },
									"icon" : "jstree-file"
								},
								{ "text" : "Child node 2", "state" : { "disabled" : true } }
							]
						}
					]
				}
			});
				
		
		
		/* 	 다시 봐야할 트리 함수 건들지 말기
			$('#frmt').jstree({
				'core' : {
					'data' : {
						"url" : "http://localhost:9090/ex/jStree.ubi",
					}
				}
			}); 
		*/
		
		$(document).ready(function() {
			
			$('.fun-btn').on('click', function(event) {
				  $(this).toggleClass('start-fun');
				  var $page = $('.page');
				  $page.toggleClass('color-bg-start')
				    .toggleClass('bg-animate-color');

				  $(this).hasClass('start-fun') ?
				    $(this).text('stop the fun') :
				    $(this).text('start the fun');

			});
			
			//javaEditor.setSize(860,400);
			$.ajax({
				type: 'POST',
				url: 'http://localhost:9090/ex/file.ubi',
				success:function(data) {
					//alert(data);
					javaEditor.setValue(data);
				}
			});
			
			/* function toggleClass(elem, theClass, newState) {
			      var matchRegExp = new RegExp('(?:^|\\s)' + theClass + '(?!\\S)', 'g');
			      var add=(arguments.length>2 ? newState : (elem.className.match(matchRegExp) == null));
			      elem.className=elem.className.replace(matchRegExp, ''); // clear all
			      if (add) elem.className += ' ' + theClass;
			      }
			      
			      function cmToggleCursorsClass(cm, theClass, newState) {
			         toggleClass(cm.getWrapperElement().getElementsByClassName('CodeMirror-cursors')[0], theClass, newState);
			      }
		      javaEditor.on('blur', javaEditor => { cmToggleCursorsClass(javaEditor, 'CodeMirror-cursorsVisible', true); });
		      javaEditor.on('focus', javaEditor => { cmToggleCursorsClass(javaEditor, 'CodeMirror-cursorsVisible', false); });
			 */
			/* webSocket */
			var connection = new RTCMultiConnection();
			connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
			//connection.socketURL = 'https://floating-cove-33208.herokuapp.com/';

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
			            ideal: 640
			        },
			        height: {
			            ideal: 480
			        },
			        frameRate: 20
			    };
			}
			if (resolutions == 'Ultra-HD') {
			    videoConstraints = {
			        width: {
			            ideal: 640
			        },
			        height: {
			            ideal: 480
			        },
			        frameRate: 20
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
			roomid.value = "UBISTUDY";
			
			window.onload = function() {
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
		
	</script>
</body>
</html>