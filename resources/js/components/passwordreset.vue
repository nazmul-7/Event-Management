<template>
    <div class="login _mt63">
        <div class="container">
            <div class="row justify-content-center" v-if="status">
                <div class="col-12 col-md-5"  >
                    <div class="login_main _box_shadow">
                        <h3 class="_title2">Password Reset</h3>
                        <form>
                            <div class="login_input_group">
                                <input class="content_input_int" type="password" placeholder="New Password" v-model="formData.password">
                            </div>
                            <div class="login_input_group">
                                <input class="content_input_int" type="password" placeholder="Confirm Password" v-model="formData.password_confirmation">
                            </div>
                             
                             <div class="login_input_group">
                                <button class="_btn _bg" type="button" @click="resetPassword" >Reset Password</button>
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
                email:"",
                password:'',
                password_confirmation:'',
            },
            status:false,
        }
    },
    methods:{

        async resetPassword(){
            if(this.formData.password=="" || this.formData.password_confirmation==''){
                this.i("All frields are required!");
                return;
            }
            const res = await this.callApi('post','resetPassword',this.formData)
            if(res.status===200){
                this.s("Your Password has been reset . Please Login with your new password!")
                this.$router.push('/login');
            }
            else if(res.status===422){
                if(res.data.errors.password)
                {
                    for(let e of res.data.errors.password  )
                        this.e(e);
                }  
            }
            else if (res.status===401){
                this.s(res.data.msg);
            }
            else {
                this.swr();
            }
        },
        async tokenVarification(token){
            const res = await this.callApi('post','matchPasswordLink',{token:token})
            if(res.status===201){
               this.status = true;
               console.log(res.data)
               this.formData.email = res.data.email

            }
            else if (res.status ===401){
                this.e(res.data.msg);
            }
            else{
                this.swr();
            }
        }
    },
    created(){
        let token = this.$route.params.token
        this.tokenVarification(token);
        if(!this.status){
            this.$router.push("/")
        }
        
    },

}
</script>

<style>

</style>
