<template>
    <div>
        <div class="_2header_all _text_center">
			<div class="_2header">
				<p class="_2header_welcome">WELCOME TO MARVALOUS CREATIONS</p>

				<h2 class="_2header_des">DESIGN YOUR T-SHIRT</h2>

				<p class="_2header_text"><i>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed  <br> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod Lorem, sed do eiusmod</i></p>

				<div class="_2header_button">
					<button class="_btn _bg" type="button">SHOP NOW</button>
				</div>

				<div class="_2header_scroll bounce animated">
					<p>Scroll down for details</p>
					<i class="fas fa-angle-double-down"></i>
				</div>
			</div>
		</div>
			<!--========== HEADER ==========-->

			<!--========== GRAPHIC ==========-->
		<div class="graphic">
			<div class="container">
				<h2 class="graphic_one"><i>WELCOME TO MARVALOUS CREATIONS</i></h2>

				<div class="title">
					<h2 class="graphic_title">Graphic Design Business Specializing in <span class="_color graphic_title_SPAN">T-SHIRTS</span></h2>

					<div class="line _bg"></div>
				</div>

				<div class="row graphic_row">
					<div class="col-12 col-md-5">
						<p class="graphic_text"> tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
						cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
						proident, sunt in culpa qui officia deserunt </p> 

						<div class="graphic_button">
							<button class="_btn _bg" type="button">READ MORE</button>
						</div>
					</div>

					<div class="col-12 col-md-7 ">
						<img class="graphic_img" src="img/God.jpg" alt="" title="">
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
