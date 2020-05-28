<template>
    <div>
        <div class="container-fluid">
            <div class="row">
                
                <!---=== right column ====---->
                <div class="col-md">
                    <div>
                        <div class="container-fluid">
                            <div class="row justify-content-center">
                                <div class="col-md-12">
                        <!---=== top navigation right side ====---->
                                    <div class="row right_row1">
                                        <div class="top_div">
                                            <div class="top_left">
                                                <p class="task_p">Completed projects</p>
                                            </div>
                                            
                                            <div class="top_right">
                                                <div class="search_div">
                                                    <Input style="width:300px;" size="large" search v-model="search" placeholder="Search..." />
                                                </div>
                                                <div class="notify_icon">
                                                    <Icon type="md-notifications-outline" />
                                                    <span class="num">2</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                        <!---=== top navigation right side END ====---->        

                        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!---=== right column END ====---->
            </div>
            
            <!---=== table right side ====---->
            <div class="_table_all">
                <div class="_table_main">
                    <table class="_1table">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Project name</th>
                                <th>Client Name</th>
                                <th>Starting Date</th>
                                <th>Deadline date</th>
                                <th>Duration</th>
                                <th>Status</th>
                                <!-- <th>Progress</th> -->
                            </tr>
                        </thead>
                        <tbody>
                            <template v-if="projects == ''">
                                <td>
                                    <h5> Nothing added yet !!..</h5>
                                </td>
                            </template>
                            <template v-else>
                            <tr v-for="(item,index) in projects" :key="index">
                                <td>
                                    <p>{{index+1}}</p>
                                </td>
                                <td>
                                    <p @click="$router.push(`/admin/project_details/${item.id}`)">{{item.project_name}}</p>
                                </td>
                                <td>
                                    <p>{{item.client.name}}</p>
                                </td>
                                <td>
                                    <p>{{item.start_date}}</p>
                                </td>
                                <td>
                                    <p>{{item.deadline_date}}</p>
                                </td>
                                <td>
                                    <p>{{item.duration}}</p>
                                </td>
                                <td>
                                    <p>{{item.status}}</p>
                                </td>
                                <!-- <td>
                                    <p>{{item.progress}}</p>
                                </td> -->
                                
                            </tr>
                            </template>
                        </tbody>
                    </table>
                </div>
            </div>



            <!-- <div class="table_list">
            <div class="row table_1">
                <div class="col-md-1">
                    <p class="list_p1">No.</p>
                </div>
                <div class="col-md-2">
                    <p class="list_p1">Project name</p>
                </div>
                <div class="col-md-2">
                    <p class="list_p1">Client Name</p>
                </div>
                <div class="col-md-2">
                    <p class="list_p2">Starting Date</p>
                </div>
                <div class="col-md-2">
                    <p class="list_p2">Deadline date</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">Duration</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">Status</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">Progress</p>
                </div>
                
            </div>
            <template v-if="projects == ''">
                <div>
                    <h5> No Projects Added Yet..</h5>
                </div>
            </template>
            <template v-else>
            <div class="row table_2" v-for="(item,index) in projects" :key="index">
                <div class="col-md-1">
                    <p class="list_p1">{{index+1}}</p>
                </div>
                <div class="col-md-2">
                    <p @click="$router.push(`/admin/project_details/${item.id}`)" class="list_p1">{{item.project_name}}</p>
                </div>
                <div class="col-md-2">
                    <p class="list_p1">{{item.client.name}}</p>
                </div>
                <div class="col-md-2">
                    <p class="list_p2">{{item.start_date}}</p>
                </div>
                <div class="col-md-2">
                    <p class="list_p2">{{item.deadline_date}}</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">{{item.duration}}</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">{{item.status}}</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">{{item.progress}}</p>
                </div>
                
            </div>
            </template>
            
        </div> -->
        </div>
    </div>
</template>
<script>
	export default {
	  data(){
          return{
              search:'',
              clients:[],
              projects:[]
          }
      },
      methods:{
        
      },
      async created(){
          let [res1,res2] = await Promise.all([
                this.callApi('get',`completedProject`),
                this.callApi('get',`client`),
            ]);
            if(res1.status == 200 && res2.status == 200){
                this.projects = res1.data
                this.clients = res2.data
                
            }
        }
	}
</script>