<template> 
    <div>
        <div class="row right_row1">
            <div class="top_div">
                <div class="top_left">
                    <p class="task_p">All Assigned Project</p>
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
        <div class="row justify-content-between">
            <div class="col-md-4">
                <div class="designation">
                    <Button @click="add_modal = true" type="info">Add Assign Project</Button>
                </div>
            </div>
            <div class="col-md-4">
                <div class="designation">
                    <Select v-model="str_p" @on-change="all_assignTask">
                        <Option  value="All" >All</Option>
                        <Option  v-for="(item,index) in projects" :value="item.id" :key="index" >{{item.project_name}}</Option>
                        
                    </Select>
                </div>
            </div>
        </div>
        <!---=== right side Input ====---->
         <!----=== Assign project List table ====---->  
         <div class="_table_all">
            <div class="_table_main">
                <table class="_1table"> 
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Project Name</th>
                                <th>Employee Name</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    
                        <tbody>
                            <tr v-for="(item,index) in assignProject" :key="index">
                                <td>
                                    <p>{{item.id}}</p>
                                </td>
                                <td @click="$router.push(`/admin/project_details/${item.projects.id}`)" v-if="item.projects">
                                    <p>{{item.projects.project_name}}</p>
                                </td>
                                <td>
                                    <p>{{item.employee.name}}</p>
                                </td>
                                <td>
                                    <div class="_button">
                                        <Button @click="add_modalOn(item)" type="info">Add Task</Button>
                                        <Button type="info" @click="edit_assignproject(item,index)">Edit</Button>
                                        <Button @click="assignproject_delete(item.id,index)" type="error">Delete</Button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                </table>
            <!---=== row list attendance END ===---->
            </div>
        </div>
        
        <!----=== Assign project List table END ====----> 
        <!---=== right side Input END ====---->
        <!-- Add Assign project  start modal -->
        <Modal
            v-model="add_modal"
            title="Add New Assign Project"
            @on-ok="form_submmit"
            @on-cancel="add_modal = false">

            <div class="left_atten_card">
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Name</span>
                        </div>
                        <div class="right_input_pro">
                            <Select v-model="form.project_id" style="width:100%" size="large" clearable>
                                <Option v-for="(item,index) in projects" :key="index" :value="item.id">{{item.project_name}}</Option>
                            </Select>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input" v-if="employees.length>0"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Employee Name</span>
                        </div>
                        <div class="right_input_pro">
                            <Select v-model="form.employee_id" style="width:100%" size="large" clearable>
                                <Option v-for="(item,index) in employees" :key="index" :value="item.id">{{item.name}}</Option>
                            </Select>
                        </div>
                    </div>
                </div>
                
            </div>
        </Modal>
        <!-- Add Assign project modal end -->
        <!-- edit project  start modal -->
        <Modal
            v-model="edit_modal"
            title="Edit New Project"
            @on-ok="update_assignproject"
            @on-cancel="edit_modal = false">

            <div class="left_atten_card">
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Name</span>
                        </div>
                        <div class="right_input_pro">
                            <Select v-model="edit_data.project_id" style="width:100%" size="large" clearable>
                                <Option v-for="(item,index) in projects" :key="index" :value="item.id">{{item.project_name}}</Option>
                            </Select>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input" v-if="employees.length>0"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Employee Name</span>
                        </div>
                        <div class="right_input_pro">
                            <Select v-model="edit_data.employee_id" style="width:100%" size="large" clearable>
                                <Option v-for="(item,index) in employees" :key="index" :value="item.id">{{item.name}}</Option>
                            </Select>
                        </div>
                    </div>
                </div>
            </div>
        </Modal>
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
                            <span class="input_title">Employee Name</span>
                        </div>
                        <div class="right_input_pro">
                              <p class="list_p2">{{newTask.item.employee.name}}</p>
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
                            <Input v-model="form.description" type="textarea" :autosize="{minRows: 2,maxRows: 5}" style="width: 100%" />
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
                            <!-- <InputNumber  :min="1" v-model="form.estimated_time" style="width: 100%"></InputNumber> -->
                        </div>
                    </div>
                </div>
            </div>
        </Modal>
        <!-- Edit project modal end -->
    </div>
</template>

<script>
	export default {
	  data(){
          return{
                search:'',
                str_p:'All',
                edit_modal: false,
                add_modal:false,
                edit_data: {},
                editIndex:-1,
                assignProject:[],
                projects:[],
                employees:[],
                form:{
                    project_id:'',
                    employee_id:''
                },
                newTask:{
                    modal:false,
                    item:{},
                }
          }
      },
      methods:{
          async all_assignTask(){
                const res = await this.callApi('get',`assignproject?project=${this.str_p}`)
                if(res.status == 200){
                    this.assignProject = res.data
                }
            },
           add_modalOn(item){
               console.log(item)
              this.form.project_id = item.project_id
              this.form.employee_id = item.employee_id
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
            const res = await this.callApi('post','AssignTask',this.form)
            if(res.status == 200){
                this.s(' Task have been successfully Assigned!')
                let form ={
                    project_id:'',
                    employee_id:''
                }
                this.form = form
            }
            else{
                this.swr()
            }

          },
          async form_submmit(){
            if(this.form.project_id == '') return this.i("Project Name is Empty!")
            if(this.form.employee_id == '') return this.i("Employee Name is Empty!")
            const res = await this.callApi('post','assignproject',this.form)
            if(res.status == 200){
                this.s(' Project have been successfully Assigned!')
                this.assignProject.unshift(res.data)
                this.form.project_id = ''
                this.form.employee_id = ''
            }
            else{
                this.swr()
            }

        },
        edit_assignproject(item,index){
            this.edit_data = _.cloneDeep(item)
            this.editIndex = index
            delete this.edit_data.projects
            delete this.edit_data.employee
			this.edit_modal = true
        },
        async update_assignproject () {
            if (this.edit_data.project_id=='')return  this.i('Project name can not be empty!')
            if (this.edit_data.employee_id=='') return this.i('employee name can not be empty!')
            const res = await this.callApi('put', 'assignproject', this.edit_data)
            if (res.status === 200) {
                this.assignProject[this.editIndex] = res.data
                this.s('Assign Project Updated')
                this.edit_data = {}
                this.editIndex = -1
                this.edit_modal = false
            }else{
                this.swr();
            }

        },
        async assignproject_delete(id,index){
            if(!confirm("Are you sure to delete this Assign Project?")){
                return;
            }
            let ob = {
                id:id
            }
            const res = await this.callApi('delete','assignproject',ob)
            if(res.status == 200){
                this.i('Assigned Project have been successfully Deleted!')
                this.assignProject.splice(index,1)
            }
        },
      },
      async created(){
          let [res1,res2,res3] = await Promise.all([
                this.callApi('get',`project`),
                this.callApi('get',`employee`),
                this.callApi('get',`assignproject`),
            ]);
            if(res1.status == 200 && res2.status == 200 && res3.status == 200){
                this.projects = res1.data
                this.employees = res2.data
                this.assignProject = res3.data
                
            }
        }
	}
</script>
