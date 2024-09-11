<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>원데이 클래스 수강신청</title>
    <script src="/js/jquery.js"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<style>
		img{
			width:600px;
		}
	</style>	
</head>
<body>
    <div id="app"> 
		<div><img :src="detail.filePath"></div>
		<div>{{detail.classNo}}</div>
		<div>{{detail.className}}</div>
		<div>모집 시작일 : {{detail.startDay}}</div>
		<div>모집 종료일 : {{detail.endDay}}</div>
		<div>수업일자 : {{detail.classDate}}</div>
		<div>수강료 : {{detail.price}}</div>
		<div class="onedayJoinForm">
			신청자 이름 : <input type="text" v-model="name">
		</div>
		<button @click="fnOnedayJoin()">수강신청</button>
    </div>
</body>
</html>
<script>
    const app = Vue.createApp({
            data() {
                return {
                   classNo : '${classNo}',
				   detail : {},
				   sessionId : '${sessionId}',
				   name : "",
				   count : ""
                };
            },
            methods: {
				fnDetail(classNo) {
					var self = this;
					var nparmap = {classNo:self.classNo};
					console.log(self.classNo);
					$.ajax({
					url : "oneday-detail.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data){
						self.detail = data.onedayDetail;
						console.log(data);	
					}
					
				})
				},
			   fnOnedayJoin(){
				var self = this;
					var nparmap = {classNo:self.classNo, userId:self.sessionId, name:self.name};
					$.ajax({
					url : "oneday-join.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data){
						self.detail = data.onedayDetail;
						console.log(data);	
					}
					
				})
			   }
            },
            mounted() {
				var self = this;
				self.fnDetail();
            }
        });
        app.mount('#app');
</script>