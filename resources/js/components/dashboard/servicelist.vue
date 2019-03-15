<template>
    <div>
        <div class="profile_schedule _b_color">
            <div class="_profile_card_all pro_schedule_all" v-if="list.length" >
                <!-- card -->
                <div class="schedule_items _dis_flex _bg _color _b_color" v-for="(item,index) in list " :key="index" >
                    <div class="schedule_items_date schedule_date_bg_green">
                        <p class="schedule_date_one">{{item.timeSlot}}</p>
                        <p class="schedule_date_two">{{item.eventDate | getDay}}</p>
                    </div>

                    <div class="schedule_title _flex_space _text_overflow _b_color">
                        <p class="schedule_title_text _text_overflow">{{item.eventName}}</p>
                    </div>

                    <div class="schedule_time _flex_space _b_color">
                        <p class="schedule_time_text">
                            <i class="fas fa-map-marker-alt"></i>

                            <span class="schedule_time_text_span">{{item.eventLocation}}</span>
                        </p>
                    </div>

                    <div class="schedule_time _b_color">
                        <p class="schedule_time_text">
                            <i class="fas fa-users"></i>

                            <span class="schedule_time_text_span">{{item.numberOfGuests}} </span>
                        </p>
                    </div>

                    <!-- <div class="schedule_time _flex_space _b_color">
                        <p class="schedule_time_text">
                            <span class="schedule_time_text_span">Status : {{item.status}}</span>
                        </p>
                    </div> -->
                    <div class="schedule_time _b_color">
                        <p class="schedule_time_text">
                            <span class="schedule_time_text_span"><router-link :to="{name:'eventEdit',params:{id:item.id}}">Edit</router-link></span>
                        </p>
                    </div>
                    
                </div>
            </div>
        </div>
        <!-- card -->
    </div>
</template>

<script>
export default {
    data(){
        return{
            list:[],
            toDayDate:'',
            user_id:this.$route.params.id,
        }
    },
    methods:{
        async getWorkingEventList(){
            const res  = await  this.callApi('get',`getAllWorkingEventList`)
            if(res.status===200){
                this.list = res.data
            }
            else{
                this.swr();
            }
        },
    },
    filters:{
        getDay(item){
            var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
            var d = new Date(item);
            return days[d.getDay()];
        },
    },
    created(){
        this.getWorkingEventList();
    }
}
</script>

<style>

</style>
