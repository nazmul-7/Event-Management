<template>
       <!--==========================
                        Profile
            ===========================-->
                <!--======= Profile Main ======-->
        <div class="profile_main _mt_110">
            <div class="container">
                
                <div class="row">
                        <!--~~~~~~~ Profile Card ~~~~~~~-->
                    <div class="col-12 col-md-4 col-lg-4">
                        <!--~~~~~~~ Details Right Profile ~~~~~~~-->
                        <div class="Details_profie _mr_b30 _bg _color _box_shadow _border_radious _padd_20">
                            <div class="Details_profie_img_div" v-if="authInfo.id==user_id" >
                                <Upload
                                 ref="upload"
                                 type="drag"
                                 name="img"
                                 :with-credentials="true"
                                 :headers="crfObj"
                                 :on-success="handleSuccess"
                                 :format="['jpg','jpeg','png']"
                                 :max-size="2048"
                                 action="/app/getUserImage">
                                 <!-- action="/app/uploadServiceImages"> -->
                                 <div  >
                                   <img class="Details_profie_img" :src="(userInfo.image==null)? defultImage: userInfo.image" title="" alt="">
                                    <p   class="Details_profie_img_edit">Upload Image</p>
                                 </div>
                              </Upload>
                                
                            </div>
                            <div class="Details_profie_img_div" v-if="authInfo.id!=user_id || authInfo == false" >
                                <div  >
                                   <img class="Details_profie_img" :src="(userInfo.image==null)? defultImage: userInfo.image" title="" alt="">
                                  
                                 </div>
                            </div>

                            <div class="Details_profie_title">
                                <h3 v-if="!isEdit" class="_title3"><span  v-if="authInfo.id==user_id" class="pro_edit_all" @click="isEdit=true" ><i class="fas fa-pencil-alt"></i>Edit</span></h3>
                                <p v-if="isEdit" class="_dis_flex align-items-center"><span class="pro_edit_all" @click="updateInfo" > SAVE</span></p>
                                <div class="Details_profie_title_line"></div>
                            </div>

                            

                            <div class="Details_profie_location">
                                <div class="Details_pro_renge _dis_flex _b_color2">

                                    <p class="Details_pro_renge_name _flex_space">First Name</p>

                                    <p v-if="!isEdit" class="Details_pro_renge_num">{{userInfo.firstName}}</p>
                                    <p v-if="isEdit" class="Details_pro_renge_num">
                                        <input type="text" v-model="edituserInfo.firstName">
                                    </p>
                                </div>

                                <div class="Details_pro_renge _dis_flex none_f _b_color2">

                                    <p class="Details_pro_renge_name _flex_space">Last Name</p>

                                    <p v-if="!isEdit" class="Details_pro_renge_num">{{userInfo.lastName}}</p>
                                    <p v-if="isEdit" class="Details_pro_renge_num">
                                        <input type="text" v-model="edituserInfo.lastName">
                                    </p>
                                </div>


                               

                                <div class="Details_pro_renge _dis_flex _b_color2">

                                    <p class="Details_pro_renge_name _flex_space">Position</p>

                                    <div class="boi_text_div ">
                                        <div class="Pro_details">
                                            <p class="boi_text _text_overflow" v-if="userInfo.position!='super'">{{userInfo.position}}</p>
                                            <p class="boi_text _text_overflow" v-if="userInfo.position=='super'">Supervisor</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="far fa-envelope"></i>

                                    <p class="Details_pro_renge_name _flex_space">Email</p>

                                    <div class="boi_text_div ">
                                        <div class="Pro_details">
                                            <p v-if="isEdit" class="boi_text _text_overflow">
                                                <input type="text" v-model="edituserInfo.email">
                                            </p>
                                            <p v-if="!isEdit" class="boi_text _text_overflow">{{userInfo.email}}</p>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="fas fa-phone"></i>

                                    <p class="Details_pro_renge_name _flex_space">Contact Number</p>

                                    <div class="boi_text_div ">
                                        <div class="Pro_details">
                                            <p v-if="isEdit" class="boi_text _text_overflow">
                                                <input type="text" v-model="edituserInfo.phone">
                                            </p>
                                            <p v-if="!isEdit" class="boi_text _text_overflow">{{userInfo.phone}}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="Details_pro_renge _dis_flex _b_color2">

                                    <p class="Details_pro_renge_name _flex_space">This week's total works</p>

                                    <div class="boi_text_div ">
                                        <div class="Pro_details">
                                           
                                            <p  class="boi_text _text_overflow text-center ">{{totalRunningTime}} Hours </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="Details_pro_renge _dis_flex _b_color2">

                                    <p class="Details_pro_renge_name _flex_space">Lifetime working hours</p>

                                    <div class="boi_text_div ">
                                        <div class="Pro_details">
                                            <!-- <p v-if="isEdit" class="boi_text _text_overflow">
                                                <input type="text" v-model="edituserInfo.phone">
                                            </p> -->
                                            <p  class="boi_text _text_overflow text-center">{{totalRunningTime}} Hours</p>
                                        </div>
                                    </div>
                                </div>

                                </div>


                                
                            </div>
                        </div>
                    
                        <!--~~~~~~~ Profile Card ~~~~~~~-->

                        <!--~~~~~~~ Profile Details ~~~~~~~-->
                    <div class="col-12 col-md-8 col-lg-8">
                        <div class="_box_shadow pro_menu _color _box_shadow _bg _border_radious " v-if=" authInfo.id==user_id"  >
                            <!-- <ul class="pro_menu_list">
                                <li  v-if="authInfo.id==user_id"  :class="(sellerTab==1)? 'pro_menu_active':''" @click="sellerTab=1">Service</li>
                            </ul> -->
                           
                        </div>

                        <servicelist  v-if="sellerTab==1 && authInfo.id==user_id" ></servicelist>
                    </div>
                        <!--~~~~~~~ Profile Details ~~~~~~~-->
                </div>
            </div>
        </div>

</template>

<script>

import servicelist from './servicelist.vue'


        
export default {
    components:{
        servicelist,

    },
    data(){
        return{
            sellerTab:1,
            user_id:this.$route.params.id,
            userInfo:[],
            edituserInfo:[],
            isEdit:false,
            totalAllTime:'',
            totalRunningTime:'',
            defultImage:'/img/prfile.png',
            crfObj: {
                    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
        }
    },
    methods:{
        async getProfileInfo(){
            const res = await this.callApi('get',`getProfileInfo/${this.user_id}`)
            if(res.status === 200){
                this.userInfo = res.data
                this.edituserInfo = res.data
            }
            else{
                this.swr();
            }
        },
        async getTotalWokingHours(){
            const res = await this.callApi('get',`getTotalWokingHours`)
            if(res.status === 200){
               
                this.totalAllTime = res.data.alltime ,
                this.totalRunningTime =res.data.runningTime
               
            }
            else{
                this.swr();
            }
        },
        async updateInfo(){
            const res = await this.callApi('post','updateUserInfo',this.userInfo)
            if(res.status===200){
                this.s("You profile has been updated successfully!");
                
                 this.userInfo =this.edituserInfo
                  this.isEdit =false
            }
            else{
                this.swr();
                 this.isEdit =false
            }
        },
        handleSuccess(res, file){

             this.userInfo.image = res;
            
        },

    },
    created(){
         if(!this.authInfo){
            return this.$router.push('/login')
        }
        this.getProfileInfo();
        this.getTotalWokingHours();
    }
}
</script>

<style>

</style>
