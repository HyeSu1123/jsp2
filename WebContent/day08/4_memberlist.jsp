<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 함수 fn은 태그가 아니고 el과 함께 사용한다. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회/수정</title> <!-- jsp1에 있던 파일 -->
<link rel="stylesheet" href="0_hrdkorea.css">
<style type="text/css">
	td{
		border: 1px solid gray;
	}
</style>
</head>
<body>

				
<div class="wrap_container">
  <header>
        <h3 class="header-item">쇼핑몰 회원관리 ver1.0</h3>
    </header>
    <nav class="haeder-nav">
        <ul class="container">
          	<li><a href="">회원등록</a></li>
            <li><a href="">회원목록조회/수정</a></li>
            <li><a href="">회원매출조회</a></li>
            <li><a href="">홈으로.</a></li>
        </ul>
    </nav>
	 <section>
            <h2 style="text-align: center;" class="section"><strong>회원목록조회/수정</strong></h2>
            <div>
            <!-- action url을 현재 url과 같게 했습니다. -->
			<form action="memberSearch.jsp">
				<select name="column" id="column">
					<option value="name">이름</option>
					<option value="address">주소</option>
					<option value="grade">고객등급</option>
					<option value="city">거주지역</option>
				</select>
				
				<!-- 아래 find는 2개중에 하나만 하면에 표시 -->				
				<span id="content">
					<input name="find" placeholder="검색할 내용 입력" value="${find }">
				</span>
				<span id="grade">
					<select name="find" id="grades">
					<!-- 사용자 선택하는 텍스트와 db테이블에 저장된 값이 다르다. -->
						<option value="A">VIP</option>
						<option value="B">일반</option>
						<option value="C">직원</option>
					</select>
				</span>
				<button>검색</button>
				<button type="button" onclick="location.href='memberList.jsp'">전체보기</button>
			</form>            
            </div>
            <table style="width: 90%;margin: auto;text-align: center;"> 
                <tr style="text-align: center;">    
                    <th>번호</th>       
                    <th>이름</th>
                    <th>연락처</th>
                    <th>주소</th>
                    <th>가입일자</th>
                    <th>고객등급</th>
                    <th>거주지역</th>
                </tr>
        <!-- el은 getAttribute와 출력 -->
			<c:forEach var="member" items="${list }">
				<tr>
					<td><a style="color:blue;" href="#">
					${member.custNo }</a></td>
					<td>${member.custName }</td>
					<td>${member.phone }</td>
					<td>${member.address }</td>
					<td>${member.joinDate }</td>
					<!-- 조건연산형식 :  조건? 참 실행명령문 : 거짓 실행 명령문 -->
					<td>${member.grade == 'A'? 'VIP': (member.grade == 'B'? '일반':'직원') }
					<c:if test="${member.grade =='A' }">VIP</c:if>
					<c:if test="${member.grade =='B' }">일반</c:if>
					<c:if test="${member.grade =='C' }">직원</c:if>
					</td>
					<td>${member.city }</td>
				</tr>
			</c:forEach>
					
<!-- list의 데이터가 없을 때 list애트리뷰트가 null X,size가 0(jstl의 length함수로 검사 -->
<c:if test="${fn:length(list) == 0 }">
	            <tr>
              		<td colspan="7">조회 결과가 없습니다.</td>
              	</tr>
</c:if>             	
            </table>
        </section>
    <footer>
        <p>HRDKOREA Copyrightⓒ2016 All rights reserved. Human Resources Development Service of Korea</p>
    </footer>
    </div>
    
    <script type="text/javascript">
	    //const sel2 = document.getElementById('sel');	//1개 요소만 가져온다.
	    //selector(. , # ,태그이름, > )를 이용해서 여러개 요소 가져온다.
    const sel = document.querySelectorAll("#column>option"); // > 자식요소
		//    console.log(sel);
		//    let status = 1;
    sel.forEach(function(item)=>{
    	if(item.value == '${column}'){
    		item.selected='selected';
    			//column 애트리뷰트값과 일치하는 option항목일때이다.
    	}
    	
    });
    doucment.querySelectoryAll("#grades>option").forEach(function(item){
    	if(item.value == '${find}'){
    		item.selectd='selected';
    			//grade를 선택한 것에 따라 일치하는 option을 표시한다.
    	}
    });
    //화면표시 변경
    const grade = document.getElementById('grade');	//select
    	//grade.style.display = 'none';	//안보이게 하는 방법
    const content = document.getElementById('content');	//input
    if('${column}'=='grade'){
    	grade.style.display = 'inline-block';
    	content.style.display = 'none';
    }else{
    	content.style.display = 'inline-block';
		grade.style.display = 'none';
    }
    //검색 컬럼 선택 sel이 변경될때
    document.getElementById('column').addEventListener("change",changeView);
    function changeView(){
    	//form요소 가져오기 -select
    	const col = document.forms[0].column.value;
    	if(col == 'grade'){
    		grade.style.display = 'inline-block';
    		content.style.display = 'none';
    	}else{
    		content.style.display = 'inline-block';
    		grade.style.display = 'none';
    		//form요소 가져오기 -input요소 find
    		document.forms[0].elements[1].value="";
    	}
    }
    
    </script>
</body>
</html>