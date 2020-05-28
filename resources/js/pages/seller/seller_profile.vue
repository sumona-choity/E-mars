<template>
    <div>
        <!---==== right side top button ===--->
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="profile-edit-btn">
                                                <router-link :to="`/profile_edit/${authUser.id}`">
                                                    <Button type="primary">Edit Profile</Button type="primary">
                                                </router-link>
                                            </div>
                                        </div>
                                    </div>
                            <!---==== right side top button ===--->
                             <!---=== right side Input ====---->  
                                    <div class="row right_row2" v-if="isLoggedIn">
                                        <div class="task_body col-8">
                                            <div class="_1st_input">
                                                <div class="left_name">
                                                    <span class="input_title">Full Name</span>
                                                </div>
                                                <div class="right_input">
                                                    <p class="list_p2">{{authUser.name}}</p>
                                                </div>
                                            </div>
                                             <div class="_1st_input">
                                                <div class="left_name">
                                                    <span class="input_title">Phone Number</span>
                                                </div>
                                                <div class="right_input">
                                                    <p class="list_p2">{{authUser.phone}}</p>
                                                </div>
                                            </div>
                                            <div class="_1st_input">
                                                <div class="left_name">
                                                    <span class="input_title">Address</span>
                                                </div>
                                                <div class="right_input">
                                                    <p class="list_p2">{{authUser.address}}</p>
                                                </div>
                                            </div>
                                            <div class="_1st_input">
                                                <div class="left_name">
                                                    <span class="input_title">Email</span>
                                                </div>
                                                <div class="right_input">
                                                    <p class="list_p2">{{authUser.email}}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            <!---=== right side Input END ====---->  
    </div>
</template>

<script>
	
	export default {
	  data(){
          return{}
      },
      
	}
</script>