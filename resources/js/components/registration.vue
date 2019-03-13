<template>
    <div class="registration _mt63">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-6">
                    <div class="registration_main _box_shadow">
                        <h3 class="_title2">User Sign up</h3>
                        <form>
                            <div class="row">
                                    <!-- items -->
                                <div class="col-12 col-md-6">
                                    <div class="login_input_group">
                                        <p class="regi_title"> First Name</p>
                                        <input :class="(errorData.firstName.length)? 'content_input_int_e' : 'content_input_int'" type="text" v-model="formData.firstName">
                                        
                                    </div>
                                </div>
                                    <!-- items -->
                                     <!-- items -->
                                <div class="col-12 col-md-6">
                                    <div class="login_input_group">
                                        <p class="regi_title">Last Name</p>
                                        <input :class="(errorData.lastName.length)? 'content_input_int_e' : 'content_input_int'"  type="text" v-model="formData.lastName">
                                        
                                    </div>
                                </div>
                                    <!-- items -->
                                     <!-- items -->
                                 <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <p class="regi_title">Email</p>
                                        <input :class="(errorData.email.length)? 'content_input_int_e' : 'content_input_int'"  type="text" v-model="formData.email">
                                      
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 justify content center">
                                    <div class="login_input_group">
                                        <p class="regi_title" >Position</p>
                                        <select  v-model="formData.position" >
                                          <option class="optoin_select" value="manager">Mangers</option>
                                          <option class="optoin_select" value="super">Supervisor</option>
                                          <option class="optoin_select" value="valet">Valet</option>
                                        </select>
                                    </div>
                                </div>
                                    <!-- items -->
                                     <!-- items -->
                                <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <p class="regi_title">Password</p>
                                        <input :class="(errorData.password.length)? 'content_input_int_e' : 'content_input_int'"  type="password" v-model="formData.password">
                                    </div>
                                </div>
                                <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <p class="regi_title">Confirm Password</p>
                                        <input class="content_input_int" type="password" v-model="formData.password_confirmation">
                                        
                                    </div>
                                </div>
                                <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <button class="_btn _bg" type="button" @click="registation" >SIGN UP</button>
                                    </div>
                                </div>
                                    <!-- button -->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            formData:{
                firstName:'',
                lastName:'',
                position:'',
                email:'',
                password:'',
                password_confirmation:'',

            },
            errorData:{
                firstName:[],
                lastName:[],
                email:[],
                password:[],
            }
        }
    },
    methods:{
        async registation(){
            if(this.formData.firstName=='' || this.formData.lastName=='' || this.formData.position=='' || this.formData.email=='' || this.formData.password=='' || this.formData.password_confirmation=='' ){
                this.i("All frields are required!");
                return;
            }
            if(this.password != this.password_confirmation){
                this.i("The password confirmation does not match.");
                return;
            }

            const res = await this.callApi('post',"registration",this.formData)
            if(res.status===201){
                this.s("registration Successfull!");
                this.login(res.data);

            }
            else if(res.status===422){
                if(res.data.errors.email){
                    this.errorData.email = res.data.errors.email 
                    for(let e of res.data.errors.email  )
                        this.e(e);
                }  
                if(res.data.errors.password)
                {
                    this.errorData.password = res.data.errors.password 
                    for(let e of res.data.errors.password  )
                        this.e(e);
                }  
                  
                if(res.data.errors.firstName)
                {
                    this.errorData.firstName = res.data.errors.firstName 
                    for(let e of res.data.errors.firstName  )
                        this.e(e);
                }    
                if(res.data.errors.lastName)
                {
                    this.errorData.lastName = res.data.errors.lastName 
                    for(let e of res.data.errors.lastName  )
                        this.e(e);
                }    
            }
            else{
                this.swr();
            }
        },
        async login(data){
            const res = await this.callApi('post','login',data)
            if(res.status===200){
                this.$router.push('/schedule');
            }
            else if (res.status===401){
                this.s(res.data.msg);
            }
            else {
                this.swr();
            }
        }

    },
    created(){

    }


}
</script>

<style>

</style>
