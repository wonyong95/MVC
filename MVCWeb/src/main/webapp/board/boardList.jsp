<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
   #boardWrap{
      width:95%;
      margin: 1em auto;
   }
   #boardList>li{
      list-style-type:none;
      border-bottom:1px solid #ddd;
      height:40px;
      line-height:40px;
      float:left;
      width:15%;
   }
   #boardList>li:nth-child(5n){
      width:10%;
   }
   #boardList>li:nth-child(5n+1){
      width:10%;
   }
   #boardList>li:nth-child(5n+2){
      width:50%;
      /* 제목이 오버플로우 될 경우 말줄임표 출력  */
      white-space:nowrap;
      overflow:hidden;
      text-overflow:ellipsis;
   }
   a:link,a:visited,a:hover{
      text-decoration:none;
   }
   .pageWrap{
      position:relative;
   }
   .paging{
      list-style-type:none;
      position:absolute;
      top:50%;
      left:50%;
      transform: tanslate(-50%,-50%);
   }
   .paging>li{
      float:left;
      padding: 5px;
      text-align:center;
      border:1px solid #ddd;
      border-radius:3px;
      width:2em;
      margin:1px;
   }
   .paging>li.current{
      background-color:navy;
   }
   .paging>li.current a{
      color:white;
   }
   span.cpage{
      color:red;
      font-weight:bold;
   }
</style>
    
    <div class="container">
       <h1>Board List</h1>
       <br>
       <p>
       <a href="user/boardForm.do">글쓰기</a> | <a href="boardList.do">글목록</a>
       </p>
       
       <%-- ${requsetScope.boardArr}  --%>
       <div id="boardWrap">
          <ul id="boardList">
             <li>글번호</li>
             <li>제목</li>
             <li>작성자</li>
             <li>등록일</li>
             <li>조회수</li>
             <!-- ------------------------- -->
             <c:if test="${boardArr==null || empty boardArr}">
                <li style='width:100%'>
                   데이터가 없습니다.
                </li>
             </c:if>
             <c:if test="${boardArr!=null && not empty boardArr}"> 
                <c:forEach var="vo" items="${boardArr}">
                   <!--forEach태그의 속성들
                     var : 변수명을 지정한다
                     items : 자료구조(ArrayList, Map...)
                     begin : 시작값
                     end : 끝값
                     step: 증가치
                     varStatus: 반복문의 상태정보를 담아줄 변수명을 지정
                        - count: 반복문 횟수 1~
                        - index : 인덱스번호 0~
                    -->
                   <li>${vo.num}</li>
                   <li>
                      <a href="boardView.do?num=${vo.num}">${vo.subject}</a>
                      
                      <!-- 첨부파일 이미지 출력 -->
                      <c:if test="${vo.filesize>0}">
                      <span class='attach'></span>
                      <img src = 'images/attach.png' style="width:16px" >
                      </c:if>
                   </li>
                   <li>${vo.userid}</li>
                   <li>
                      <fmt:formatDate value="${vo.wdate}" pattern="yy-MM-dd"/>
                   </li>
                   <li>${vo.readnum}</li>
                </c:forEach>
             </c:if>
             <!-- ------------------------- -->
          </ul>
          <div style="clear:both"></div>
          <br><br>
          <div class="pageWrap">
             <ul class="paging">
                <li><a href="boardList.do?cpage=${cpage-1}">◀</a></li>
                
                <!-- <li class='current'><a>1</a></li> -->
                <c:forEach var="i" begin="1" end ="${pageCount}"> 
                	<c:if test="${cpage eq i}">
                		<li class='current'><a href="boardList.do?cpage=${i}">${i}</a></li>  
                    </c:if>
                   <c:if test="${cpage ne i}">
                   		<li><a href="boardList.do?cpage=${i}">${i}</a></li>
                   </c:if>
                </c:forEach>
                
                <li><a href="boardList.do?cpage=${cpage+1}">▶</a></li>
             </ul>
          </div>
          <br><br>
          <div>
             총 게시글 수: ${totalCount}개,  현재 <span class='cpage'>${cpage}</span> / 총  ${pageCount} pages
          </div>          
       </div>
    </div>
<jsp:include page="/foot.jsp"/>    