<template>
    <div class="registration _mt63">
        <div class="container">
            <div class="row justify-content-center" v-if="!weekFlag" >
                <div class="col-12 col-md-6">
                    <div class="registration_main _box_shadow _bg _color">
                        <h3 class="_title2">Create Event</h3>
                        <form>
                            <div class="row">
                                    <!-- items -->
                               <div class="col-12 col-md-12 justify content center">
                                    <div class="login_input_group">
                                        <p class="regi_title" >Choose Week</p>
                                        <select  v-model="weekStatus" >
                                          <option class="optoin_select" selected value="1">Running Week</option>
                                          <option class="optoin_select" value="2">New Week</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="col-12 col-md-12">
                                    <div class="login_input_group">
                                        <button class="_btn2 _bg" type="button" @click="weekSelect" >Next</button>
                                    </div>
                                </div>
                                    <!-- button -->
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center" v-if="weekFlag" >
                <div class="col-12 col-md-6">
                    <div class="registration_main _box_shadow _bg _color">
                        <h3 class="_title2">Event Registration</h3>
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
                                        
                                        <TimePicker class="content_input_int" v-model="formData.timeSlot" @on-change="getSlots"  format="hh:mm A" type="timerange" placement="bottom-end" placeholder="Select time" ></TimePicker>
                                      
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
                                        <button class="_btn2 _bg" type="button" @click="registation" >Create</button>
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
            weekStatus:'1',
            weekFlag: false,
        }
    },
    methods:{
        async registation(){
            if(this.formData.numberOfValetsNeeded=='' || this.formData.visibleAfter =='' || this.formData.eventName=='' || this.formData.eventDesc=='' || this.formData.eventLocation=='' || this.formData.timeSlot=='' || this.formData.totalHours=='' || this.formData.numberOfGuests=='' ){
                this.i("All frields are required!");
                return;
            }
            this.formatDate();
          
            const res = await this.callApi('post',"eventRegistration",this.formData)
            if(res.status===201){
                this.s("Event registration Successfull!");
                this.$router.push('/schedule')

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
            start[1] = start[1].split(" ");
            end[1] = end[1].split(" ");
             if(start[1][1]=='PM' && start[0]!='12') start[0] = parseInt(start[0])+12
             if(end[1][1]=='PM' && end[0]!='12') end[0] = parseInt(end[0])+12

             if(start[1][1]=='AM' && start[0]=='12') start[0] = parseInt(start[0])-12
             if(end[1][1]=='AM' && end[0]=='12') end[0] = parseInt(end[0])-12
            
           
            var startDate = new Date(0, 0, 0, start[0], start[1][0], 0);
            var endDate = new Date(0, 0, 0, end[0], end[1][0], 0);
           
            
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
            
            this.formData.totalHours = this.formatTime(this.formData.timeSlot[0],this.formData.timeSlot[1])
        }

    },
    created(){

        if(this.authInfo.position!='admin'){
            this.$router.push("/")
        }
    }


}
</script>

<style scoped>
label {
    display: block;
    font: 1rem 'Fira Sans', sans-serif;
}

input,
label {
    margin: .4rem 0;
}

.note {
    font-size: .8em;
}
</style>

