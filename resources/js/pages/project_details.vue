<template>
    <div>
        <div class="container-fluid">
            <div class="row">
                <!---=== left column ====----> 
                
                <!---===left column END ====---->

                <!---=== right column ====---->
                <div class="col-md right_div">
                    <div class="right_side2">
                        <div class="container-fluid">
                            <div class="row justify-content-center">
                                <div class="col-md-12">
                        <!---=== top navigation right side ====---->        
                                    <div class="row right_row1">
                                        <div class="top_div">
                                            <div class="top_left">
                                                <p class="task_p">Task Name - Project Name</p>
                                            </div>
                                            
                                            <div class="top_right">
                                                <div class="search_div">
                                                    <Input style="width:300px;" size="large" search  placeholder="Search..." />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            <!---=== top navigation right side END ====---->        
                                    <div class="_table_all"> 
                                        <div class="_table_main">
                                            <table class="_1table"> 
                                                    <thead>
                                                        <tr>
                                                            <th>Id</th>
                                                            <th>Project name</th>
                                                            <th>Employee Name</th>
                                                            <th>Task Name</th>
                                                            <th>Description</th>
                                                            <th>Estimated time</th>
                                                            <th>Start time</th>
                                                            <th>End time</th>
                                                            <th>Total time in Hour</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                
                                                    <tbody>
                                                        <template v-if=" projects == ''">
                                                            <h5> Nothing added yet !!..</h5>
                                                        </template>
                                                        <template v-else>
                                                        <tr v-for="(item,index) in projects" :key="index">
                                                            <td>
                                                                <p>{{item.id}}</p>
                                                            </td>
                                                            <td>
                                                                <p>{{item.projects.project_name}}</p>
                                                            </td>
                                                            <td>
                                                                <p>{{item.employee.name}}</p>
                                                            </td>
                                                            <td>
                                                                <p>{{item.task_name}}</p>
                                                            </td>
                                                            <td>
                                                                <p>{{item.description}}</p>
                                                            </td>
                                                            <td>
                                                                <p>{{item.estimated_time}}</p>
                                                            </td>
                                                            <td>
                                                                <p>{{item.start_time}}</p>
                                                            </td>
                                                            <td>
                                                                <p>{{item.end_time}}</p>
                                                            </td>
                                                            <td>
                                                                <p>{{item.total_time}}</p>
                                                            </td>
                                                            <td>
                                                                <p>{{item.status}}</p>
                                                            </td>
                                                        </tr>
                                                        </template>
                                                    </tbody>
                                            </table>
                                        <!---=== row list attendance END ===---->
                                        </div>
                                    </div>
                            <!---=== table right side ====---->
                                
                            <!---=== table right side END ====---->
                                </div>
                            </div>
                        </div>
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
              tab:-1,
              outingViewModal:false,
              outingItem:{
                  item:'',
                  index:'',
              },
              date:'',
              employees:{},
              projects:[]
              
              
          }
      },
      
        async created(){
            console.log("ok");
            let res1 = await
                this.callApi('get',`singleAssignTask/${this.$route.params.id}`)
            
            if(res1.status == 200){
                
                this.projects = res1.data.AssignTask
                
                
                
            }
           
        },
        
	}
</script>