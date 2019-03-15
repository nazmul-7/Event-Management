<template>
        <div class="_2menu _bg _color  _box_shadow">
            <div class="_2menu_logo _b_color2">
                <!--<img class="_2menu_logo_pic" src="" title="" alt="">-->
                <h3>LOGO IMAGE</h3>
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

                            <div class="_2menu_profile_on _2menu_profile_active"></div>
                        </div>
                    </li>
                </ul>
            </div>

                <!-- mobile button -->
            <div class="mobile_button">
                <i class="fas fa-list-ul"></i>
            </div>
                <!-- mobile button -->
        </div>
</template>

<script>
export default {
    data(){
        return{
            defultImage:'/img/prfile.png'
        }
    }
}
</script>

<style>

</style>
