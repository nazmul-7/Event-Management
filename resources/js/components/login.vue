<template>
    <div class="login _mt63">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-5">
                    <div class="login_main _box_shadow">
                        <h3 class="_title2">User Log in</h3>
                        <form>
                            <div class="login_input_group">
                                <input :class="(errorData.email.length)? 'content_input_int_e' : 'content_input_int'" type="text" placeholder="Email Address" v-model="formData.email">
                            </div>
                             <div class="login_input_group">
                                <input :class="(errorData.password.length)? 'content_input_int_e' : 'content_input_int'"  type="password"  v-model="formData.password" placeholder="Password">
                                <p class="forget_pass"><span><router-link :to="{path:'/passwordresetGetEmail'}" >Forgot password?</router-link></span></p>
                            </div>
                             <div class="login_input_group">
                                <button class="_btn _bg" type="button" @click="login" >LOGIN</button>
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
                password:'',
            },
            errorData:{
                email:[],
                password:[],
            },
        }
    },
    methods:{
        async login(){
            if(this.formData.email=="" || this.formData.password==''){
                this.i("All frields are required!");
                return;
            }
            const res = await this.callApi('post','login',this.formData)
            if(res.status===200){
                console.log(res.data)
                 this.$store.dispatch('user/updateUser', (res.data));
                this.$router.push('/schedule');
            }
            else if (res.status===422){
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
