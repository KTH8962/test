<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
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
			<a href="class-join.jsp"><img :src="item.filePath"></a>
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
					url : "class-list.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data){
						self.list = data.classList;
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