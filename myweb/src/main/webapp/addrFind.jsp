<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
//250226 
function autoWrite(){
   //1.사용자값 회수
   var fulladdr = document.fm.address.value;
   //2. 값 분리 //1에서부터 6이 되기 직전까지 (1~5까지)
   var zip=fulladdr.substring(0,6);
   //var addr=fulladdr.substring(8,fulladdr.length); //8에서 마지막까지 가져올 수도 있고 마지막만 가져올렴 8만 써도 됨?
   var addr=fulladdr.substring(8);
   //3. 본 페이지를 연 부모페이지 전달 openerdms 나를 열었던 브라우저를 가리키게 됨 
   opener.document.join.zip.value=zip;
   //화면으로부터 join이라는 form태그에 zip이라는 입력태그에 zip을 넣겠다
   opener.document.join.addr1.value=addr;
   //나를 열었던 opener에게 화면으로부터 join이라는 폼태그가 있는데 입력태그의 value값으로 addr넣을게
   
   window.self.close();
}
</script>

</head>
<body>
<form name="fm">
<fieldset>
   <legend>주소검색</legend>
   <label>주소</label>
   <input type="text" name="address" size="35"><br>
   <input type="button" value="주소확인" onclick="autoWrite()"> 
</fieldset>
</form>
</body>
</html>