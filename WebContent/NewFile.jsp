<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE>
<html lang = "ja">
<head>
<script>
function showPassword(){
document.getElementById("T3").value=document.getElementById("T1").value;
}
</script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="../../include/js/common.js"></script>


    <script>
    function disp() {
      if(window.confirm('�o�^���Ă�낵���ł��傤���H')){
    	  location.href = "AddUserServlet";
      }
    }
    </script>

</head>
<body >
<form >
<p>�p�X���[�h �F <input type="password" id="T1" size="20"></p>
<p><input type="button" id="T2" value="���Ȃ��̃p�X���[�h��" onClick="showPassword()"></p>
<p><input type="text" id="T3" size="20">�ł��B</p>
<p><input type="checkbox" id="T4" onClick="showPassword()">�p�X���[�h��\������</p>

<p><input type="button" value="�m�F" onClick="disp()"></p>




</form></body></html>