<template>
	
<div>
    <div>
        <div class="container-fluid">
            <div class="row">
                <!---=== left column ====----> 
                <div class="col-md-auto left_div">
                    <div>
                      <div class="left_sidebar">
                          <div class="logo">
                              <p class="logo_p1">AppifyLab</p>
                              <div class="logo-img"><img src="/img/1.png" alt="" class="logo_i.mg"></div>
                              <!-- <p class="logo_p2">Dilruba Ferdous</p>
                              <p class="logo_p3">Front End Developer</p> -->
                              <p class="logo_p2">{{authUser.name}}</p>
                              <a href="/logout"><Button type="info" size="large" class="logo_btn">Log out</Button></a>
                              
                          </div>
                          
                          <!---===left side List ====---->
                          <div class="list_menu">
                    <Menu :active-name="activeName" :accordion="true">
                        <MenuGroup title="NAVIGATION">
                            <MenuItem name="/admin">
                                <router-link to="/admin">
                                    Dashboard
                                </router-link>    
                            </MenuItem>
                            <MenuItem name="/admin/emp_profile">
                               <router-link to="/admin/emp_profile">
                                    Employee Profile
                                </router-link>
                            </MenuItem>
                            <MenuItem name="/admin/designation">
                               <router-link to="/admin/designation">
                                    Designation
                                </router-link>
                            </MenuItem>
                           
                            <MenuItem name="/admin/all_client">
                                <router-link to="/admin/all_client">
                                  All Client
                                </router-link>
                            </MenuItem>
                            <MenuItem name="/admin/attendance">
                               <router-link to="/admin/attendance">
                                    Employee Attendance
                                </router-link>
                            </MenuItem>
                            <!-- <MenuItem name="/admin/add_project">
                                <router-link to="/admin/add_project">
                                    Projects
                                </router-link>
                            </MenuItem> -->
                            <MenuItem name="/admin/all_project">
                                <router-link to="/admin/all_project">
                                  All project
                                </router-link>
                            </MenuItem>
                            <MenuItem name="/admin/assign_project">
                                <router-link to="/admin/assign_project">
                                    All Assigned Project
                                </router-link>
                            </MenuItem>
                            <MenuItem name="/admin/daily_task">
                                <router-link to="/admin/daily_task">
                                    Daily Based Task
                                </router-link>
                            </MenuItem>
                            <MenuItem name="/admin/assign_task">
                                <router-link to="/admin/assign_task">
                                    All Assigned Task
                                </router-link>
                            </MenuItem>
                            <MenuItem name="/admin/running_project">
                                <router-link to="/admin/running_project">
                                   Running project
                                </router-link>
                            </MenuItem>
                            <MenuItem name="/admin/completed_project">
                                <router-link to="/admin/completed_project">
                                    Completed project
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
                                                <p class="task_p">Admin Dashboard</p>
                                            </div>
                                            
                                            <div class="notify_icon">
                                                    <Icon type="md-notifications-outline" />
                                                    <span class="num">2</span>
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
         activeName:'/admin'
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