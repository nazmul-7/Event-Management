<template>
	<div>
		<div class="home _mt_110">
			<div class="container">
				<div class="home_all _box_shadow _bg _border_radious" v-if="list.length" >
					<slick
						ref="slick"
						:options="slickOptions"
						@afterChange="handleAfterChange"
						@beforeChange="handleBeforeChange"
						@breakpoint="handleBreakpoint"
						@destroy="handleDestroy"
						@edge="handleEdge"
						@init="handleInit"
						@reInit="handleReInit"
						@setPosition="handleSetPosition"
						@swipe="handleSwipe"
						@lazyLoaded="handleLazyLoaded"
						@lazyLoadError="handleLazeLoadError">
							<!-- ITMES -->
						<div v-for="(item,index) in list" :key="index" v-if="item.position!='admin'"  >
							<a   >
								<div class="row">
									<div class="col-md-6 home_pic">
										<img class="home_img" :src="(item.image)? item.image: defultImage" alt="">
									</div>	
									<div class="col-md-6 home_about">
										<p class="_title2">About User</p>

										<div class="home_about_details _dis_flex">
											<p class="home_pro_title">Name</p>	
											<p class="home_pro_num">{{item.firstName}} {{item.lastName}} </p>	
										</div>

										<div class="home_about_details _dis_flex">
											<p class="home_pro_title">Position</p>	
											<p class="home_pro_num">{{item | positionName}}</p>	
										</div>	
									</div>	
								</div>	
							</a>
						</div>
							<!-- ITMES -->
						
						<!-- ITMES -->
						
					</slick>
				</div>
			</div>
			
			<div class="home_about_sec">
				<div class="container">
					<p class="_title _text_center">About Schedule</p>

					<p class="_text">Scheduling is the process of arranging, controlling and optimizing work and workloads in a production process or manufacturing process. Welcome to vscheduling, the ultimate valet scheduling tool. This is where valets get the absolute freedom to create their own schedules. There are weekly updates for new job postings which makes for a comfortable experience. Let’s get you started!”</p>
				</div>
			</div>
		</div>
		<footerSection/>
	</div>
</template>



<script>
import Slick from 'vue-slick';
import footerSection from '../partials/footer.vue'
export default {
	 data() {
        return {
            slickOptions: {
                dots: true,
				infinite: true,
				speed: 300,
				slidesToShow: 1,
				adaptiveHeight: true,
				autoplay: true
			},
			list:[],
			defultImage:'/img/valetPic.jpg'
        };
	},
	// All slick methods can be used too, example here
    methods: {
        next() {
            this.$refs.slick.next();
        },

        prev() {
            this.$refs.slick.prev();
        },

        reInit() {
            // Helpful if you have to deal with v-for to update dynamic lists
            this.$nextTick(() => {
                this.$refs.slick.reSlick();
            });
        },

        // Events listeners
        handleAfterChange(event, slick, currentSlide) {
            console.log('handleAfterChange', event, slick, currentSlide);
        },
        handleBeforeChange(event, slick, currentSlide, nextSlide) {
            console.log('handleBeforeChange', event, slick, currentSlide, nextSlide);
        },
        handleBreakpoint(event, slick, breakpoint) {
            console.log('handleBreakpoint', event, slick, breakpoint);
        },
        handleDestroy(event, slick) {
            console.log('handleDestroy', event, slick);
        },
        handleEdge(event, slick, direction) {
            console.log('handleEdge', event, slick, direction);
        },
        handleInit(event, slick) {
            console.log('handleInit', event, slick);
        },
        handleReInit(event, slick) {
            console.log('handleReInit', event, slick);
        },
        handleSetPosition(event, slick) {
            console.log('handleSetPosition', event, slick);
        },
        handleSwipe(event, slick, direction) {
            console.log('handleSwipe', event, slick, direction);
        },
        handleLazyLoaded(event, slick, image, imageSource) {
            console.log('handleLazyLoaded', event, slick, image, imageSource);
        },
        handleLazeLoadError(event, slick, image, imageSource) {
            console.log('handleLazeLoadError', event, slick, image, imageSource);
		},
		async getAllUserList(){
			const res = await this.callApi('get','getUserList');
			if(res.status===200){
				this.list = res.data
			}
			else{
				
			}
		}
    },

	components: {
		Slick ,
		 footerSection,
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
	created(){
		this.getAllUserList();
	}
}
</script>
