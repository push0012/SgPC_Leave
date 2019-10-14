<template>
  <div class="wrapper">
    <div class="bodi">
 <div class="container containers">
	<div class="d-flex justify-content-center h-100">
		<div class="card cardx">
			<div class="card-header card-headerx">
				<h3>Sign In</h3>
				<div class="d-flex justify-content-end social_icon">
					<span>G</span>
          			<span>L</span>
          			<span>M</span>
          			<span>S</span>
				</div>
			</div>
			<div class="card-body">
				<form>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-user"></i></span>
						</div>
						<input type="email" class="form-control" v-model="email" placeholder="Username or Email">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-key"></i></span>
						</div>
						<input type="password" class="form-control" v-model="password" placeholder="password">
					</div>
					<div class="row align-items-center remember">
						<input type="checkbox">Remember Me
					</div>
					<div class="form-group">
						<button @click="login" class="btn float-right login_btn">
							Login
						</button>
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center">
					<a href="#">Forgot your password?</a>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</template>
<script>
  import Card from 'src/components/Cards/Card.vue'
  const axios = require('axios');
  export default {
    components: {
      Card
    },
    data () {
      return {
		  email:'',
		  password:''
      }
    },
    methods: {
      login () {
		  var data = {
			  client_id: 2,
			  client_secret: '0T5mVqn15v5hbW52XG5GeWh4G6CltWFyxbhc60Ge',
			  grant_type:'password', 
			  username: this.email,
			  password: this.password,
			  scope: '*',
		  }
		axios.post('http://127.0.0.1:8000/oauth/token', data              
            ).then((response) => {
			  console.log(response); 
            }).catch( error => { 
              console.log('error: ' + error); 
            });
      }
    }
  }
</script>
<style>


.bodi{
background-image: url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}

.containers{
height: 100%;
align-content: center;
}

.cardx{
height: 370px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}
.card-headerx{
  background-color: transparent !important;
}

.social_icon span{
font-size: 60px;
margin-left: 15px;
color: #FFC312;
}

.social_icon span:hover{
color: white;
cursor: pointer;
transform: rotateZ(-30deg);
}

.card-headerx h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}
</style>