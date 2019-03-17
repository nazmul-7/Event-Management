<template>
        <div class="_2menu _bg _color  _box_shadow">
            <div class="_2menu_logo _b_color2">
                <div class="logo_container">
                    <img class="_2menu_logo_pic" src="/img/logo.jpg" title="" alt="">
                </div>
                
                
            </div>

            <div class="_2menu_ceta mo_none">

                <div class=" _2big_menu_cat_main">
                    <div class="_2menu_ul_list">
                        <ul class="_2menu_main_ul_list_ul">
                            <li><router-link :to="{path:'/'}" >HOME</router-link></li>
                            <li v-if="authInfo" ><router-link :to="{path:'/schedule'}" >SCHEDULE</router-link></li>
                            <li><router-link :to="{path:'/about'}" >ABOUT</router-link></li>
                            <li><router-link :to="{path:'/contact'}" >CONTACT</router-link></li>
                            <li v-if="!authInfo" ><router-link :to="{path:'/login'}" >LOGIN</router-link></li>
                            <li v-if="!authInfo" ><router-link :to="{path:'/registration'}" >REGISTRATION</router-link></li>
                            <li v-if="authInfo.position!='admin'" ><router-link  :to="{name:'profile',params:{ id:authInfo.id}}" >{{this.authInfo.firstName}}</router-link></li>
                            <li v-if="authInfo.position =='admin'"><router-link :to="{path:'/eventCreate'}" >Create an event</router-link></li>
                            <li v-if="authInfo.position =='admin'"><router-link :to="{name:'dashBoard',params:{ id:authInfo.id}}" >{{this.authInfo.firstName}}(Admin)</router-link></li>
                            <li v-if="authInfo" ><a href="/logout"  >LOGOUT</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="_2menu_log _b_color2 mo_none" v-if="authInfo" >
                <ul class="_2menu_ul">
                    <li>
                        <div class="_2menu_profile">
                            <img class="_2menu_profile_pic" :src="(authInfo.image)? authInfo.image: defultImage" alt="" title="">

                            
                        </div>
                    </li>
                </ul>
            </div>

                <!-- mobile button -->
            <div class="mobile_button" @click="openMobile">
                <i class="fas fa-list-ul"></i>
            </div>
                <!-- mobile button -->
                <!-- mobile menu sidebar -->
            <div class="mobile_menu_content_all" :style="`left:${left}`">
                <div class="mobile_menu_content">
                    <p class="cencel _color" @click="closeMobile"><i class="fas fa-times"></i></p>
                    <div class="mobile_menu">
                            <!-- frist page -->
                        <div class="mobile_menu_page">
                            <ul class="mobile_menu_frist_page_ul">
                                <li @click="goToNext('/')">HOME</li>
                                <li v-if="authInfo"  @click="goToNext('/schedule')">SCHEDULE</li>
                                <li @click="goToNext('/about')">ABOUT</li>
                                <li @click="goToNext('/contact')">CONTACT</li>
                               
                                <li @click="goToNext(`/profile/${authInfo.id}`)" v-if="authInfo.position!='admin'" >{{this.authInfo.firstName}}</li>
                                <li @click="goToNext('/eventCreate')" v-if="authInfo.position =='admin'">Create an event</li>
                                <li @click="goToNext('/dashBoard')" v-if="authInfo.position =='admin'">{{this.authInfo.firstName}}(Admin)</li>
                               
                                <li  v-if="!authInfo">
                                    <div class="mobile_menu_button">
                                        <button class="_btn upper" type="button" @click="goToNext('/registration')">SIGN UP</button>
                                        <button class="_btn upper" type="button" @click="goToNext('/login')">LOGIN</button>
                                    </div>
                                </li>
                                <li  v-if="authInfo">
                                    <div class="mobile_menu_button">
                                        <a href="/logout"  > <button class="_btn" type="button">LOGOUT</button></a>
                                       
                                       
                                    </div>
                                </li>
                            </ul>
                        </div>
                            <!-- frist page -->
                    </div>
                </div>

                <div class="bg_color" :style="`opacity: ${opacity}; display: ${none}`" @click="closeMobile"></div>
            </div>
        </div>
</template>

<script>
export default {
    data(){
        return{
            defultImage:'/img/prfile.png', 
            left: '-100%',
            opacity: 0, 
            none: 'none'
        }
    },
    methods: {
        openMobile(){

            this.left = '0px'
            this.opacity = 1
            this.none = 'block'
        },
        closeMobile(){
            this.left = '-100%'
            this.opacity = 0
            this.none = 'none'
        },
        goToNext(url){
            this.$router.push(url)
            this.closeMobile()
            this.left = '-100%'
            this.opacity = 0
            this.none = 'none'
        }
    }
}
</script>

<style>

</style>
