<template>
    <div class="login _mt63">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-5">
                    <div class="login_main _box_shadow">
                        <h3 class="_title2">Password Reset</h3>
                        <form>
                            <div class="login_input_group">
                                <input class="content_input_int" type="text" placeholder="Enter Your Email Address" v-model="formData.email">
                            </div>
                             
                             <div class="login_input_group">
                                <button class="_btn _bg" type="button" @click="getEmail" >Send Reset Link</button>
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
                email:'',
            },

        }
    },
    methods:{
        async getEmail(){
            if(this.formData.email==""){
                this.i("All frields are required!");
                return;
            }
            const res = await this.callApi('post','passwordresetGetEmail',this.formData)
            if(res.status===200){
               this.s("Password reset link has been sent to Your Email Address ");
               this.$router.push("/login")
            }
            else if (res.status===401){
                this.e(res.data.msg);
            }
            else {
                this.swr();
            }
        },
    },
    created(){

    },

}
</script>

<style>

</style>
