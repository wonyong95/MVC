<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="memo.app.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::메모 수정::</title>
<!-- memo.css참조--------------------------------------------- -->
<link rel="stylesheet" type="text/css" href="css/memo.css">
<!-- -------------------------------------------------------- -->
<script type="text/javascript">
	function check(){
		//window.document.mf.submit();
		if(mf.name.value==""){
			alert('작성자를 입력하세요');
			mf.name.focus();
			return;
		}
		if(mf.msg.value==""){
			alert('메모내용을 입력하세요');
			mf.msg.focus();
			return;
		}
		let len=mf.msg.value.length;
		if(len>100){
			alert('메모 내용은 100자까지만 가능해요');
			mf.msg.select();
			return;
		}
		
		mf.submit();
	}
</script>
</head>
<body>
<div id="wrap">
<!-- http://localhost:9090/MyWeb/memo/MemoAdd?name=sdfsdf&msg=sdfsdf
	http://localhost:9090/MyWeb/MemoAdd?name=aaa&msg=bbb
 -->
 <% 
 	Object obj=request.getAttribute("memo"); 
 	MemoVO vo=(MemoVO)obj;
 	if(vo==null){
 %>
 		<script>
 			alert('존재하지 않는 글입니다');
 			location.href='MemoList';//웹브라우저의 url을 변경해서 이동한다
 		</script> 	
 <%	
 		return;
 	}//if-----
 %>
 
	<form name="mf" action="MemoEdit" method="post">
		<!-- table로 화면과 같이 구성하세요 -->
		<table border="1">
			<tr>
				<th colspan="2"><h1>::한줄 메모장 글수정::</h1></th>
			</tr>
			<tr>
				<td width="20%">
					<b>글번호</b>
				</td>
				<td width="80%">
					<input type="text" name="no" value="<%=vo.getNo()%>"
					 placeholder="No" readonly style="width:40%">
				</td>				
			</tr>
			
			<tr>
				<td width="20%">
					<b>작성자</b>
				</td>
				<td width="80%">
					<input type="text" name="name" value="<%=vo.getName()%>"
					 placeholder="Name">
				</td>				
			</tr>
			
			<tr>
				<td width="20%">
					<b>메모 내용</b>
				</td>
				<td width="80%">
					<input type="text" name="msg"  value="<%=vo.getMsg()%>"
					 placeholder="Message">
				</td>				
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="check()">글 수정하기</button>
					<button type="reset">다시 쓰기</button>
				</td>
			</tr>
		</table>
	
	</form>
</div>
</body>
</html>