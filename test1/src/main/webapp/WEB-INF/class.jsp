<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>view 기본 세팅 파일</title>
</head>
<style>
	img{
		width:300px;
	}
</style>
<body>
	
	<div id="app">
		<div v-for = "item in list">
			<div>{{item.className}}</div> 
			<div>{{item.classDate}}</div> 
			<div>{{item.price}}</div> 
			<img :src="item.filePath">
		</div>
		<button @click="fnJoin"></button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				classNo : "",
				list : []
            };
        },
        methods: {
			fnGetList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "class-list.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data){
						self.list = data.classList;
						console.log(data);	
					}
					
				})
			},
			fnJoin(){
				var self = this;
				var nparmap = {classNo : self.classNo};
				$.ajax({
					url : "class-join.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data){
						console.log(data);	
					}
					
				})
			}
			
        },
        mounted() {
			var self = this;
			self.fnGetList();
        }
    });
	//0910
    app.mount('#app');
</script>