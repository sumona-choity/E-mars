<template>
	
<div>
    <div>
        <div class="container-fluid">
            <div class="row">
                <!---=== left column ====----> 
                <div class="col-md-auto left_div">
                    <div>
                      <div class="left_sidebar">
                          <div class="logo" v-if="isLoggedIn">
                              <p class="logo_p1">E-mars</p>
                              <div class="logo-img"><img :src="authUser.image_link" alt="" class="logo_i.mg"></div>
                              <p class="logo_p2">{{authUser.name}}</p>
                              <a href="/logout"><Button type="info" size="large" class="logo_btn">Log out</Button></a>
                          </div>
                          
                          <!---===left side List ====---->
                          <div class="list_menu">
                                  <Menu  :active-name="activeName" :accordion="true">
                                      <MenuGroup title="NAVIGATION">
                                          <MenuItem name="/seller">
                                              <router-link to="/seller">
                                                  Dashboard
                                              </router-link>    
                                          </MenuItem>
                                          <MenuItem name="/seller/seller_profile">
                                            <router-link to="/seller/seller_profile">
                                                  Profile
                                              </router-link>
                                          </MenuItem>
                                          <MenuItem name="/seller/seller_productList">
                                            <router-link to="/seller/seller_productList">
                                                  Product lists
                                              </router-link>
                                          </MenuItem>
                                          
                                      </MenuGroup>
                                  </Menu>
                          </div>
                          <!---===left side List END====---->
                      </div>
                  </div>
                </div>
                <!---===left column END ====---->

                <!---=== right column ====---->

                <div class="col-md right_div">
                    <div class="right_side">
                        <div class="container-fluid">
                            <div class="row justify-content-center">
                                <div class="col-md-12">
                            <!---=== top navigation right side ====---->        
                                    <!-- <div class="row right_row1">
                                        <div class="top_div">
                                            <div class="top_left">
                                                <p class="task_p">Dashboard</p>
                                            </div>
                                            
                                            <div class="top_right">
                                                <div class="search_div">
                                                    <Input style="width:300px;" size="large" search  placeholder="Search..." />
                                                </div>
                                                <div class="notify_icon">
                                                    <Icon type="md-notifications-outline" />
                                                    <span class="num">2</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->
                            <!---=== top navigation right side END ====---->
                                    <!-- Routing section -->
                                    		<transition name="component-fade" mode="out-in">
                                            <router-view></router-view>
                                        </transition>
                          
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!---=== right column END ====---->
            </div>
        </div>
    </div>
</div>

</template>


<script>

export default {
 data(){
     return{
         activeName:'/seller'
     }
 },
  created(){
      this.activeName = this.$route.path
     this.$store.commit('setAuthUser', (window.authUser));
     console.log(this.authInfo)
  },

}
</script>







<style>

.component-fade-enter-active, .component-fade-leave-active {
  transition: opacity .5s ease;
}
.component-fade-enter, .component-fade-leave-to
/* .component-fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
.progress-linear {
    
    position: absolute;
    top: -15px;
   
}
</style>