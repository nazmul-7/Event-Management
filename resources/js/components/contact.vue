<template>
    <div class="registration _mt63">
        <div class="container">
            <div class="row justify-content-center" v-if="!weekFlag" >
                <div class="col-12 col-md-6">
                    <div class="registration_main _box_shadow _bg _color">
                        <h3 class="_title2">Contact Us</h3>
                        <form>
                            <div class="row">
                                    <!-- items -->
                               <div class="col-12 col-md-12 justify content center">
                                    <div class="col-12 col-md-12">
                                        <div class="login_input_group">
                                            <p class="regi_title">Email</p>
                                            <input class="content_input_int" type="email" v-model="formData.email">
                                            
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-12">
                                        <div class="login_input_group">
                                            <p class="regi_title">Message</p>
                                            <textarea rows="4"   class="content_input_int event_des"  type="text" v-model="formData.message"></textarea>
                                        
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <button class="_btn2 _bg" type="button" @click="send" >Send</button>
                                    </div>
                                </div>
                                    <!-- button -->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <footerSection/>
    </div>
</template>

<script>
import footerSection from '../partials/footer.vue'
export default {
        components:{
      footerSection,
        },
    data(){
        return{
            formData:{
                email:'',
                message:'',
            },
        }
    },
    methods:{
        async send(){
            if( this.formData.email=='' || this.formData.message==''  ){
                this.i("All frields are required!");
                return;
            }
            
          
            const res = await this.callApi('post',"contactus",this.formData)
            if(res.status==200){
                this.s("Message has been sent successfully!");
            }
            else if(res.status==422){
                this.e(res.data.errors.email)
            }
            else{

                this.swr();
            }
        },

    },


}
</script>

<style>

</style>
