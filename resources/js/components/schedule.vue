<template>
    <div>
        <div class="schedule_header _mt63">
            <h1 class="schedule_main_title _text_center _title">My Schedule</h1>
        </div>

        <div class="schedule ">
            <div class="container">
                <div class="schedule_main">
                    <h1 class="_title _text_center">Schedule </h1>

                    <p class="_text _text_center">Dorem Ipsum Dolor Sit. Incidunt Laborum Beatae Earum Nihil Odio Consequatur</p>

                        <!--~~~~~~ SCHEDULE ~~~~~~~~-->
                    <div class="schedule_all _b_color">
                            <!-- ITEMS -->
                        <div class="schedule_items _dis_flex _b_color">
                            <div class="schedule_items_date schedule_date_bg_green">
                                <p class="schedule_date_one">3pm-10pm</p>
                                <p class="schedule_date_two">FRIDAY</p>
                            </div>

                            <div class="schedule_title _flex_space _text_overflow _b_color">
                                <p class="schedule_title_text _text_overflow">Introduction Business</p>
                            </div>

                            <div class="schedule_time _flex_space _b_color">
                                <p class="schedule_time_text">
                                    <i class="far fa-clock"></i> 
                                    <span class="schedule_time_text_span">location</span>
                                </p>
                            </div>
                            <div class="schedule_time _flex_space _b_color">
                                <p class="schedule_time_text">
                                    <i class="far fa-clock"></i> 
                                    <span class="schedule_time_text_span">total guests </span>
                                </p>
                            </div>
                            <div class="schedule_time _flex_space _b_color">
                                <p class="schedule_time_text">
                                    <i class="far fa-clock"></i> 
                                    <span class="schedule_time_text_span">valets required 3</span>
                                </p>
                            </div>
                            <div class="schedule_time _flex_space _b_color">
                                <p class="schedule_time_text">
                                    <i class="far fa-clock"></i> 
                                    <span class="schedule_time_text_span">Apply</span>
                                </p>
                            </div>

                           
                        </div>
                            <!-- ITEMS -->

                          
                          
                    </div>

                        <!--~~~~~~~ BUTTON ~~~~~~~~~~-->
                    <div class="schedule_button _text_center">
                        <button class="_btn schedule_button_btn" type="button">More Schedule</button>
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

}
</script>

<style>

</style>
