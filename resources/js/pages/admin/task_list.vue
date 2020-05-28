<template>
    <div>
       

        <!---=== table right side ====----> 
         <div class="col-md right_div">
                    <div class="">
                        <div class="container-fluid">
                            <div class="row justify-content-center">
                                <div class="col-md-12">
                                    <div class="row right_row1">
                                        <div class="top_div">
                                            <div class="top_left">
                                                <p class="task_p">Task list</p>
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
                                    </div>


                        <!---==== right side top button ===--->
                                    <div class="row justify-content-between">
                                        <div class="col-md-4">
                                            <div class="calender">                     
                                                <DatePicker type="date" placeholder="Select date" style="width: 200px"></DatePicker>
                                            </div>
                                        </div>
                                    </div>
                        <!---==== right side top button END ===--->

                        <!---==== right side top button ===--->
                                    
                        <!---==== right side top button END ===--->  

                        <!---=== table right side ====---->
                                    <div class="table_list" v-for="(dateItem,dateIndex) in allTask " :key="dateIndex"> 
                                        <div class="row justify-content-between">
                                            <div class="col-md-12">
                                                <div class="date_list">                     
                                                    <p class="list_p1 date_header">{{dateItem.group}}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="_table_all"> 
                                            <div class="_table_main">
                                                <table class="_1table"> 
                                                        <thead>
                                                            <tr>
                                                                <th>Id</th>
                                                                <th>Task name</th>
                                                                <th>Description</th>
                                                                <th>Estimated Time</th>
                                                                <th>Start Time</th>
                                                                <th>End Time</th>
                                                                <th>Duration</th>
                                                                <th>Status</th>
                                                            </tr>
                                                        </thead>
                                                    
                                                        <tbody>
                                                            <tr v-for="(item,index) in dateItem.task" :key="index">
                                                                <td>
                                                                    <p>{{item.id}}</p>
                                                                </td>
                                                                <td  >
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
                                                        </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        <!-- <div class="_table_all"> 
            <div class="_table_main">
                <table class="_1table"> 
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Project name</th>
                                <th>Client Name</th>
                                <th>Starting Date</th>
                                <th>Deadline date</th>
                                <th>Duration</th>
                                <th>Status</th>
                                <th>Progress</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    
                        <tbody>
                            <tr v-for="(item,index) in projects" :key="index">
                                <td>
                                    <p>{{item.id}}</p>
                                </td>
                                <td  @click="$router.push(`/admin/project_details/${item.id}`)">
                                    <p>{{item.project_name}}</p>
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
                                <td>
                                    <p>{{item.progress}}</p>
                                </td>
                                <td>
                                    <div class="_button">
                                        <Button type="info" @click="edit_project(item,index)">Edit</Button>
                                        <Button @click="project_delete(item.id,index)" type="error">Delete</Button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                </table>
            </div>
        </div> -->
        <!---=== table right side END ====---->
       

    </div>
</template>

<script>
	export default {
	  data(){
          return{
              search:'',
              project_id:'',
              employee_id:'',
                allTask:[],
             
          }
      },
      methods:{
      },
      async created(){
          const peopleObj = {
            jim: {
                name: "jim",
                age: 20
            },
            tim: {
                name: "tim",
                age: 22
            }
            }
            // const peopleArray = Object.values(peopleObj)
            // const peopleArray = Object.keys(peopleObj).map(i => peopleObj[i])
            const peopleArray = Object.keys(peopleObj)
           
            
          this.employee_id = this.$route.query.employee_id
          this.project_id = this.$route.query.project_id
          let [res1,res2] = await Promise.all([
                this.callApi('get',`taskListByEmployeeAndProject?project_id=${this.project_id}&employee_id=${this.employee_id}`), 
               
            ]);
            if(res1.status == 200){
                
                const task = Object.values(res1.data)
                const group = Object.keys(res1.data)
                for(let i in task){
                    let ob ={
                        group:group[i],
                        task:task[i]
                    }
                    this.allTask.push(ob)
                }
                console.log(this.allTask)
               
                
            }
        }
	}
</script>
<style >
.date_header{
    margin-bottom: 10px;
    border-bottom: 1px solid #fff;
    padding: 15px 0px;
}
</style>