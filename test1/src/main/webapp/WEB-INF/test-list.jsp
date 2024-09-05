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
		<div><input type="text" v-model="productNo" placeholder="1~15 입력(pk값)"><button type="button" @click="fnGetList">검색</button></div>
		<template v-if="productView">
			<div>제품번호 : {{productInfo.productNo}}</div>
			<div>제품명 : {{productInfo.productName}}</div>
			<div>
				제품가격 : 
				<template v-if="!priceView">{{productInfo.productPrice}}</template>			
				<template v-else><input type="text" v-model="price"><button type="button" @click="fnUpdate">저장</button></template>			
			</div>
			<div><button type="button" @click="priceView = !priceView">수정</button><button type="button" @click="fnRemove">삭제</button></div>
		</template>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				productNo : "",
				productInfo : {},
				productView : false,
				priceView : false,
				price : ""
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {productNo : self.productNo};
				$.ajax({
					url:"test.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(data.result== "success"){
							self.productView = true;
							self.productInfo = data.product;
							self.price = self.productInfo.productPrice;
						} else {
							alert("조회 실패");
							self.productView = false;
						}
					}
				});
            },
			fnRemove(){
				var self = this;
				var nparmap = {productNo : self.productNo};
				$.ajax({
					url:"testRemove.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(data.result == 'success'){
							self.productView = false;
						} else {
							self.productView = true;
						}
						alert(data.message);
					
					}
				});
			},
			fnUpdate(){
				var self = this;
				var nparmap = {productNo : self.productNo, productPrice : self.price};
				$.ajax({
					url:"testUpdate.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(data.result == 'success'){
							self.priceView = false;
							self.fnGetList();
						} else {
							self.priceView = true;
						}
						alert(data.message);
					
					}
				});
			}
        },
        mounted() {
        }
    });
    app.mount('#app');
</script>
​