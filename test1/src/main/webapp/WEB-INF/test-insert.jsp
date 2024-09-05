<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>테스트 샘플 파일</title>
</head>
<style>
	#app * {
		margin: 5px;
	}
</style>
<body>
	<div id="app">
		<div>제품명 : <input type="text" v-model="productName"></div>
		<div>제품가격 : <input type="text" v-model="productPrice"></div>
		<div><button type="button" @click="fnInsert">저장</button></div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				productName : "",
				productPrice : ""
            };
        },
        methods: {
            fnInsert(){
				var self = this;
				var nparmap = {productName : self.productName, productPrice : self.productPrice};
				$.ajax({
					url:"testInsert.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
					}
				});
            },
        },
        mounted() {
        }
    });
    app.mount('#app');
</script>
​