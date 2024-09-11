<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="/js/jquery.js"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<title>원데이 클래스 소개</title>
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
			<div><a href="#" @click="fnChange(item.classNo)"><img :src="item.filePath"></a></div>
		</div>
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
					url : "oneday-list.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data){
						self.list = data.onedayList;
						console.log(data);	
					}
					
				})
			},
			fnChange(classNo){
				console.log(classNo);
				$.pageChange("oneday-join.do", {classNo:classNo})
			}
			
        },
        mounted() {
			var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>