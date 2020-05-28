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
                                                <p class="task_p">Running projects</p>
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
             <div class="row justify-content-between">
                
                <div class="col-md-12">
                    <div class="designation">
                        <Select v-model="status" style="width:200px" @on-change="all_Projects">
                            <Option  value="All" >All</Option>
                            <Option  value="No Started" >No Started</Option>
                            <Option  value="Running" >Running</Option>
                            <Option  value="Completed" >Completed</Option>
                        </Select>
                    </div>
                </div>
            </div>
            
            <div class="_table_all">
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
                                    <td>
                                        <p>{{item.projects.project_name}}</p>
                                    </td>
                                    <td>
                                        <p>{{item.projects.client.name}}</p>
                                    </td>
                                    <td>
                                        <p>{{item.projects.start_date | formatCreated}}</p>
                                    </td>
                                    <td>
                                        <p>{{item.projects.deadline_date | formatCreated}}</p>
                                    </td>
                                    <td>
                                        <p>{{item.projects.duration}}</p>
                                    </td>
                                    <td>
                                        <p>{{item.projects.status}}</p>
                                    </td>
                                    <td>
                                    <template>
                                        <Progress :percent="item|userformatProgressparcent" :stroke-width="20" text-inside />
                                    </template>
                                    
                                </td>
                                    <td>
                                        <Button @click="add_modalOn(item)" type="info">Add Task</Button>
                                    </td>
                                </tr>
                            </tbody>
                    </table>
                <!---=== row list attendance END ===---->
                </div>
            </div>
        </div>
        <!-- Add Assign task modal end -->
        <Modal
            v-model="newTask.modal"
            title="Add New Assign Task"
            @on-ok="addTask"
            @on-cancel="newTask.modal = false">

            <div class="left_atten_card" v-if="newTask.modal == true">
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Name</span>
                        </div>
                        <div class="right_input_pro">
                              <p class="list_p2">{{newTask.item.projects.project_name}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Task Name</span>
                        </div>
                        <div class="right_input_pro">
                            <Input v-model="form.task_name" style="width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Description</span>
                        </div>
                        <div class="right_input_pro">
                            <Input v-model="form.description" style="width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Estimated Time</span>
                        </div>
                        <div class="right_input_pro">
                            <Input   v-model="form.estimated_time" style="width: 100%" > <span slot="append">Minutes</span></Input>
                            <!-- <InputNumber  :min="0" v-model="form.estimated_time"></InputNumber>
                            <span>Hour</span> -->
                        </div>
                    </div>
                </div>
            </div>
        </Modal>
        <!-- Add Assign task modal end -->
    </div>
</template>


<script>
	export default {
	  data(){
          return{
                search:'',
                status:'All',
                clients:[],
                projects:[],
                assignTask:[],
                search:'',
                edit_data: {},
                editIndex:-1,
                edit_modal: false,
                projects:[],
                form:{
                    project_id:'',
                    assign_task_id:'',
                    task_name:'',
                    description:'',
                    estimated_time:0,
                },
                newTask:{
                    modal:false,
                    item:{},
                }
          }
      },
      methods:{
          add_modalOn(item){
              this.form.project_id = item.projects.id
              this.form.assign_task_id = item.id
              this.newTask.item = item
              this.newTask.modal = true
          },
          async addTask(){
            if(this.form.project_id == '') return this.i("Project Name is Empty!")
            if(this.form.assign_task_id == '') return this.i("Task name  is Empty!")
            if(this.form.task_name == '') return this.i("Task name  is Empty!")
            if(this.form.description == '') return this.i("Description Name is Empty!")
            if(this.form.estimated_time == '') return this.i("Estimated time  is Empty!")
            const res = await this.callApi('post','EmployeeTask',this.form)
            if(res.status == 200){
                this.s(' Task have been successfully Assigned!')
                this.assignTask.push(res.data)
                console.log(res.data)
                // let item = {
                //     project_name:
                // }
                this.form.project_id = ''
                this.form.task_name = ''
                this.form.assign_task_id = ''
                this.form.description = ''
                this.form.estimated_time = ''
            }
            else{
                this.swr()
            }

          },
        async all_Projects(){
                 const res = await this.callApi('get',`user_project?status=${this.status}`)
                if(res.status == 200){
                    this.projects = res.data
                }
            },
        
      },
      async created(){
          this.all_Projects();
       
    }
	}
</script>