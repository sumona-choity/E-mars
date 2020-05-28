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

            <div class="table_list">
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

            <div class="row table_2" v-for="(item,index) in projects" :key="index">
                <div class="col-md-1">
                    <p class="list_p1">{{index+1}}</p>
                </div>
                <div class="col-md-2">
                    <p @click="$router.push(`/admin/project_details/${item.id}`)" class="list_p1">{{item.projects.project_name}}</p>
                </div>
                <div class="col-md-2">
                    <p class="list_p1">{{item.projects.client.name}}</p>
                </div>
                <div class="col-md-2">
                    <p class="list_p2">{{item.projects.start_date}}</p>
                </div>
                <div class="col-md-2">
                    <p class="list_p2">{{item.projects.deadline_date}}</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">{{item.projects.duration}}</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">{{item.projects.status}}</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">{{item.projects.progress}}</p>
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
              search:'',
              clients:[],
              projects:[]
          }
      },
      methods:{
        async all_Projects(){
                const res = await this.callApi('get',`user_project?status=completed`)
                if(res.status == 200){
                    this.projects = res.data
                }
            },
        
      },
      async created(){
        this.all_Projects();
        // const res = await this.callApi('get','client')
        // if(res.status == 200){
        //     this.clients = res.data
        // }
        // else{
        //     this.swr()
        // }
    }
	}
</script>