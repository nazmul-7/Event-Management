<template>
            <div class="_2menu  _box_shadow">
            <div class="_2menu_logo">
                <!--<img class="_2menu_logo_pic" src="" title="" alt="">-->
                <h3>LOGO IMAGE</h3>
            </div>

            <div class="_2menu_ceta">

                <div class=" _2big_menu_cat_main">
                    <div class="_2menu_ul_list">
                        <ul class="_2menu_main_ul_list_ul">
                            <li><router-link :to="{path:'/'}" >HOME</router-link></li>
                            <li v-if="authInfo" ><router-link :to="{path:'/schedule'}" >SCHEDULE</router-link></li>
                            <li><router-link :to="{path:'/'}" >ABOUT</router-link></li>
                            <li><router-link :to="{path:'/'}" >CONTACT</router-link></li>
                            <li v-if="!authInfo" ><router-link :to="{path:'/login'}" >LOGIN</router-link></li>
                            <li v-if="!authInfo" ><router-link :to="{path:'/registration'}" >REGISTRATION</router-link></li>
                            <li v-if="authInfo" ><router-link :to="{name:'profile',params:{ id:authInfo.id}}" >{{this.authInfo.firstName}}</router-link></li>
                            <li v-if="authInfo" ><a href="/logout"  >LOGOUT</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="_2menu_log">
                <ul class="_2menu_ul">
                    <li>
                        <div class="_2menu_mess ">
                            <i class="fas fa-bell"></i>

                            <div class="_2menu_mess_num _bg">3</div>
                        </div>
                    </li>
                    <li>
                        <div class="_2menu_mess ">
                            <i class="fas fa-envelope"></i>

                            <div class="_2menu_mess_num _bg">4</div>
                        </div>
                    </li>
                    <li>
                        <div class="_2menu_profile">
                            <img class="_2menu_profile_pic" src="img/pic.png" alt="" title="">

                            <div class="_2menu_profile_on _2menu_profile_active"></div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
</template>

<script>
export default {

}
</script>

<style>

</style>
