<template>
    <div>
         <div class="_box_shadow pro_menu _bg _color _border_radious text-center "  >
             <Select  v-model="filterPosition" placeholder="Select a User Position">
                <Option value=""  >All</Option>
                <Option value="valet" >Valet</Option>
                <Option value="super" >Supervisor</Option>
                <Option value="manager" >Manager</Option>
                <Option value="admin" >Admin</Option>
            </Select>
           
        </div>
        
        <div class="_profile_card_all pro_table_all _bg _color _border_radious" v-if="list.length" >
            <!-- card -->
            <table class="pro_table_main">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Position</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="(item,index) in searchData" :key="index" >
                    <td class="pointer" @click="$router.push(`/profile/${item.id}`)">{{item.firstName}} {{item.lastName}}</td>
                    <td>{{item.email}}</td>
                    <td>{{(item.phone)? item.phone: '---' }}</td>
                    <td>{{item | positionName}}</td>
                    <td>
                        <button @click="updateUser(item)" class="_btn2 _bg">{{(item.isActive)? 'Inactivate': 'Activate'}}</button>
                        <button @click="deleteUser(item)" class="_btn2 _bg">Delete</button>

                    </td>
                </tr>
                
                </tbody>
            </table>
          
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
            filterPosition:'',
        }
    },
    methods:{
        async getUserList(){
            const res  = await  this.callApi('get',`getUserList`)
            if(res.status===200){
                this.list = res.data
            }
            else{
                this.swr();
            }
        },
        async updateUser(item){
            item.isActive = (item.isActive)? 0: 1
            const res  = await  this.callApi('post',`updateUser`,item)
            if(res.status===200){
                this.s("User status has been updated")
            }
            else{
                this.swr();
            }
        },
        async deleteUser(item){
             if(!confirm("Are you sure to delete this user!")){
                return;
            };
            const res  = await  this.callApi('post',`deleteUser`,item)
            if(res.status===200){
               this.s(" User Updated")
            }
            else{
                this.swr();
            }
        },
    },
    filters:{
        positionName(item){
            if(item.position == 'valet')
                return "Valet";
            else if(item.position == 'super')
                return "Supervisor";
            else if(item.position == 'manager')
                return "Manager";
            else if(item.position == 'admin')
                return "Admin";
        },
    },
    computed:{
        searchData() {
                if (this.filterPosition) {
                    return this.list.filter((data) => {
                        return (data.position.toUpperCase().match(this.filterPosition.toUpperCase()))
                    });
                }
                else{
                    return this.list;
                }
        }

    },
    created(){
        this.getUserList();
    }
}
</script>

<style>

</style>
