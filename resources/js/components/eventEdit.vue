<template>
    <div class="registration _mt63">
        <div class="container">
            <div class="row justify-content-center"  >
                <div class="col-12 col-md-6">
                    <div class="registration_main _box_shadow">
                        <h3 class="_title2">Event Edit</h3>
                        <form>
                            <div class="row">
                                    <!-- items -->
                                <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <p class="regi_title">Name</p>
                                        <input class="content_input_int" type="text" v-model="formData.eventName">
                                        
                                    </div>
                                </div>
                                    <!-- items -->
                                     <!-- items -->
                                 <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <p class="regi_title">Description</p>
                                        <textarea rows="4"   class="content_input_int event_des"  type="text" v-model="formData.eventDesc"></textarea>
                                      
                                    </div>
                                </div>
                                 <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <p class="regi_title">Location</p>
                                        <input class="content_input_int"  type="text" v-model="formData.eventLocation">
                                      
                                    </div>
                                </div>
                                <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <p class="regi_title">Event Date</p>
                                        
                                         <DatePicker type="date"  :options="options3" placeholder="Select date" v-model="formData.eventDate" style="width: 200px"></DatePicker>
                                      
                                    </div>
                                </div>
                                 <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <p class="regi_title">Time-Range</p>
                                        <TimePicker class="content_input_int" v-model="formData.timeSlot" @on-change="getSlots"  format="HH:mm" type="timerange" placement="bottom-end" placeholder="Select time" ></TimePicker>
                                      
                                    </div>
                                </div>
                                 <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <p class="regi_title">Total Hours</p>
                                        <input class="content_input_int" disabled type="text" v-model="formData.totalHours">
                                      
                                    </div>
                                </div>
                                 <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <p class="regi_title">Number of Guest</p>
                                        <input class="content_input_int"  type="number" v-model="formData.numberOfGuests">
                                      
                                    </div>
                                </div>
                                 <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <p class="regi_title">Number of Valet Needed</p>
                                        <input class="content_input_int"  type="number" v-model="formData.numberOfValetsNeeded">
                                      
                                    </div>
                                </div>
                                 <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <p class="regi_title">Visible to Valets After</p>
                                        <input class="content_input_int"  type="number" v-model="formData.visibleAfter">
                                      
                                    </div>
                                </div>
                                
                                <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <button class="_btn _bg" type="button" @click="update" >Update</button>
                                    </div>
                                </div>
                                    <!-- button -->
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
                eventName:'',
                eventDesc:'',
                eventLocation:'',
                timeSlot:'',
                totalHours:'',
                numberOfGuests:'',
                numberOfValetsNeeded:'',
                visibleAfter:'',
                eventDate:'',
                
            },
               options3: {
                    disabledDate (date) {
                        return date && date.valueOf() < Date.now() - 86400000;
                    }
                },

            
        }
    },
    methods:{
        async update(){
            if(this.formData.numberOfValetsNeeded=='' || this.formData.visibleAfter =='' || this.formData.eventName=='' || this.formData.eventDesc=='' || this.formData.eventLocation=='' || this.formData.timeSlot=='' || this.formData.totalHours=='' || this.formData.numberOfGuests=='' ){
                this.i("All frields are required!");
                return;
            }
            this.formatDate();
            
            const res = await this.callApi('post',"eventUpdate",this.formData)
            if(res.status===200){
                this.s("Event Update Successfull!");
               

            }
            else{
                this.swr();
            }
        },
       
        async weekSelect(){
            if(this.weekStatus==''){
                this.i("Please Select Week!");
                return;
            }
            if(this.weekStatus==1){
                this.weekFlag = true;
                return;
            }
            if(!confirm("Are you sure to start a new weeek!")){
                return;
            };
            const res = await this.callApi('post','updateEventStatus')
            if(res.status===200){
                this.weekFlag = true;
            }
            else{
                this.swr();
            }
            
        },
        async getServiceDetails(){
            const res = await this.callApi('post','getServiceDetails',{id:this.$route.params.id})
            if(res.status===200){
                this.formData = res.data;
            }
            else{
                this.swr();
            }
        },
        formatDate(){
            // FORMATE THE DATE 
            let d = new Date(this.formData.eventDate);
            let monthNumber = d.getMonth()+1
            monthNumber = ("0" + monthNumber).slice(-2);

            let dayNumber = d.getDate()
            dayNumber = ("0" + dayNumber).slice(-2);
            this.formData.eventDate = `${d.getFullYear()}-${monthNumber}-${dayNumber}`
        },
        formatTime(start,end){
            // FORMATE THE DATE 
            start = start.split(":");
            end = end.split(":");
            var startDate = new Date(0, 0, 0, start[0], start[1], 0);
            var endDate = new Date(0, 0, 0, end[0], end[1], 0);
            console.log(startDate)
            console.log(endDate)
            var diff = endDate.getTime() - startDate.getTime();
            var hours = Math.floor(diff / 1000 / 60 / 60);
            diff -= hours * 1000 * 60 * 60;
            var minutes = Math.floor(diff / 1000 / 60);
           
            // If using time pickers with 24 hours format, add the below line get exact hours
            if (hours < 0)
            hours = hours + 24;

            let time = (hours+ (minutes/60))
            time = time.toFixed(2)
            return time
           

           
        },
        getSlots(){
            console.log(this.formData.timeSlot);
            this.formData.totalHours = this.formatTime(this.formData.timeSlot[0],this.formData.timeSlot[1])
        }

    },
    created(){
            if(this.authInfo.position!='admin'){
            this.$router.push("/")
        }
        this.getServiceDetails();
    }


}
</script>

<style>

</style>
