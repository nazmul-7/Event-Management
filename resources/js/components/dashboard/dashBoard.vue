<template>
       <!--==========================
                        Profile
            ===========================-->
                <!--======= Profile Main ======-->
        <div class="profile_main _mt63">
            <div class="container">
                <div class="_title_header _b_color2">
                    <h3 class="_title">{{userInfo.name}} Profile</h3>
                </div>

                <p class="_title4"><i class="fas fa-chevron-left"></i> BACK</p>

                <div class="row">
                        <!--~~~~~~~ Profile Card ~~~~~~~-->
                    <div class="col-12 col-md-4 col-lg-4">
                        <!--~~~~~~~ Details Right Profile ~~~~~~~-->
                        <div class="Details_profie _mr_b30 _box_shadow _border_radious _padd_20">
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

                            <div class="Details_profie_rating">
                                
                            </div>

                            <div class="Details_profie_location">
                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="fas fa-map-marker-alt"></i>

                                    <p class="Details_pro_renge_name _flex_space">First Name</p>

                                    <p v-if="!isEdit" class="Details_pro_renge_num">{{userInfo.firstName}}</p>
                                    <p v-if="isEdit" class="Details_pro_renge_num">
                                        <input type="text" v-model="edituserInfo.firstName">
                                    </p>
                                </div>

                                <div class="Details_pro_renge _dis_flex none_f _b_color2">
                                    <i class="fas fa-globe-europe"></i>

                                    <p class="Details_pro_renge_name _flex_space">Last Name</p>

                                    <p v-if="!isEdit" class="Details_pro_renge_num">{{userInfo.lastName}}</p>
                                    <p v-if="isEdit" class="Details_pro_renge_num">
                                        <input type="text" v-model="edituserInfo.lastName">
                                    </p>
                                </div>


                               

                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="far fa-envelope"></i>

                                    <p class="Details_pro_renge_name _flex_space">Position</p>

                                    <div class="boi_text_div _w_100">
                                        <div class="Pro_details">
                                            <p class="boi_text _text_overflow">{{userInfo.position}}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="far fa-envelope"></i>

                                    <p class="Details_pro_renge_name _flex_space">Email</p>

                                    <div class="boi_text_div _w_100">
                                        <div class="Pro_details">
                                            <p class="boi_text _text_overflow">{{userInfo.email}}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="fas fa-phone"></i>

                                    <p class="Details_pro_renge_name _flex_space">Contact Number</p>

                                    <div class="boi_text_div _w_100">
                                        <div class="Pro_details">
                                            <p v-if="isEdit" class="boi_text _text_overflow">
                                                <input type="text" v-model="edituserInfo.phone">
                                            </p>
                                            <p v-if="!isEdit" class="boi_text _text_overflow">{{userInfo.phone}}</p>
                                        </div>
                                    </div>
                                </div>
                             

                                </div>


                                
                            </div>
                        </div>
                    
                        <!--~~~~~~~ Profile Card ~~~~~~~-->

                        <!--~~~~~~~ Profile Details ~~~~~~~-->
                    <div class="col-12 col-md-8 col-lg-8">
                        <div class="_box_shadow pro_menu _border_radious " v-if=" authInfo.id==user_id "  >
                            <ul class="pro_menu_list">
                                <li  v-if="authInfo.id==user_id"  :class="(sellerTab==1)? 'pro_menu_active':''" @click="sellerTab=1">Running Event</li>
                                <li  v-if="authInfo.id==user_id"  :class="(sellerTab==2)? 'pro_menu_active':''" @click="sellerTab=2">Old Event</li>
                                <li  v-if="authInfo.id==user_id"  :class="(sellerTab==3)? 'pro_menu_active':''" @click="sellerTab=3">All User List</li>
                            </ul>
                           
                        </div>
                        <runningEventList  v-if="sellerTab==1 && authInfo.id==user_id" ></runningEventList>
                        <oldEventList  v-if="sellerTab==2 && authInfo.id==user_id" ></oldEventList>
                        <userList  v-if="sellerTab==3 && authInfo.id==user_id" ></userList>
                    </div>
                        <!--~~~~~~~ Profile Details ~~~~~~~-->
                </div>
            </div>
        </div>

</template>

<script>

import runningEventList from './servicelist.vue'
import oldEventList from './oldRunningWeek.vue'
import userList from './userList.vue'


        
export default {
    components:{
        runningEventList,
        oldEventList,
        userList,

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
            defultImage:'/img/pic.png',
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
                this.s("You profile updated successfuly!");
                
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
        if(this.authInfo.position!='admin'){
            this.$router.push("/")
        }
        this.getProfileInfo();
          this.getTotalWokingHours();
    }
}
</script>

<style>

</style>
