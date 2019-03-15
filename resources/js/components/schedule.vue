<template>
    <div>
        <!-- <div class="schedule_header _mt63">
            <h1 class="schedule_main_title _text_center _title">My Schedule</h1>
        </div> -->

        <div class="schedule _mt_110">
            <div class="container">
                <div class="schedule_main">
                    
                    <h1 class="_title _text_center">Schedule </h1>

                    <p class="_text _text_center">Dorem Ipsum Dolor Sit. Incidunt Laborum Beatae Earum Nihil Odio Consequatur</p>

                        <!--~~~~~~ SCHEDULE ~~~~~~~~-->
                    <div class="schedule_main_all _b_color">
                        <div class="schedule_all _b_color" v-if="runningEvents.length" >
                                <!-- ITEMS -->
                            <div class="schedule_items _bg _color _dis_flex _box_shadow _b_color" v-for="(item,index) in runningEvents " :key="index" >
                                <div class="schedule_items_date schedule_date_bg_green _color">
                                    <p class="schedule_date_one">{{item.timeSlot}}</p>
                                    <p class="schedule_date_two">{{item.eventDate | getDay}}</p>
                                </div>

                                <div class="schedule_title _flex_space _text_overflow _b_color">
                                    <p class="schedule_title_text _text_overflow">{{item.eventName}}</p>
                                </div>

                                <div class="schedule_time _flex_space _b_color _text_overflow">
                                    <p class="schedule_time_text _text_overflow">
                                        <i class="fas fa-map-marker-alt"></i>

                                        <span class="schedule_time_text_span">{{item.eventLocation}}</span>
                                    </p>
                                </div>

                                <div class="schedule_time schedule_othder  _b_color">
                                    <p class="schedule_time_text">
                                        <i class="fas fa-users"></i>

                                        <span class="schedule_time_text_span">{{item.numberOfGuests}} </span>
                                    </p>
                                </div>

                                <div class="schedule_time schedule_othder  _b_color">
                                    <p class="schedule_time_text">
                                        <i class="fas fa-users"></i>

                                        <span class="schedule_time_text_span">{{item.numberOfValetsNeeded- item.applications_count}} valets</span>
                                    </p>
                                </div>

                                <div class="schedule_time schedule_othder _b_color" v-if="item.has_applied==null && authInfo.position!='admin'" @click="applyInEvent(index)" >
                                    <p class="schedule_time_text">
                                        <button class=" schedule_button_btn _btn2"   type="button">Apply</Button>
                                    </p>
                                </div>

                                <div class="schedule_time schedule_othder  _b_color" v-if="item.has_applied && authInfo.position!='admin'" >
                                    <p class="schedule_time_text">
                                        <button class=" schedule_button_btn _btn2" disabled  type="button">Applied</Button>
                                    </p>
                                </div>
                            </div>
                                <!-- ITEMS -->
                        </div>
                    </div>

                        <!--~~~~~~~ BUTTON ~~~~~~~~~~-->
                    <div class="schedule_button _text_center" v-if="authInfo.position=='admin'" >
                        <button class="_btn schedule_button_btn" type="button" @click="$router.push('/eventCreate')" >Create an Event</button>
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
            runningEvents:[], 

        }
    },
    methods:{
        async getRunningEvents(){
            const res = await this.callApi('get','getRunningEvents')
            if(res.status===200){
                this.runningEvents = res.data
            }
            else{
                this.swr();
            }
        },
        async applyInEvent(index){
            let data={
                event_id: this.runningEvents[index].id,
                totalHoursApplied: this.runningEvents[index].totalHours
            }
            const res = await this.callApi('post','applyInEvent',data)
            if(res.status===201){
                this.s("Applied for this Event!")
                this.runningEvents[index].has_applied = true
            }
            else{
                this.swr();
            }
        }

    },
    filters:{
        getDay(item){
            var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
            var d = new Date(item);
            return days[d.getDay()];
        },
    },
    created(){
     
        if(!this.authInfo){
            return this.$router.push('/login')
        }
        this.getRunningEvents();
      
        
    


    },


}
</script>