alert("loaded")
function hello(){
	alert("hello")	
}

$(document).ready(function(){
	$("#loginbtn").click(function(){
		var e=$("#email").val();
		var p=$("#pass").val();
		var r=$("#role").find('option:selected').val();
		if(e==""){
			alert("Please Enter Email");
			$("#email").focus().css("border-color","red");
		}else if(p==""){
			alert("Please Enter Password");
			$("#pass").focus().css("border-color","red");
		}else if(r=="Select Role"){
			alert("Please Select Role");
			$("#role").focus().css("border-color","red");
		}else if(r=="Student"){
			$.post("student",{
				opt:"1",
				email:e,
				pass:p,
			},function(){
				window.location.href="studenthomepage.jsp";
			});
		}else{
			$.post("recruiter",{
				opt:"1",
				email:e,
				pass:p,
			},function(){});
			
		}
	});
});
	
function addToCart(pid,action){
	
	let id=pid;
	let a=action;
	$.ajax({
		type:"GET",
		url:"cart",
		pid:id,
		a:a
	})
	
}