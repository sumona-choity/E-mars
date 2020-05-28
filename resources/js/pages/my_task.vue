<template>
    <div>
        <div class="row right_row1">
            <div class="top_div">
                <div class="top_left">
                    <p class="task_p">Task</p>
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
            <div class="col-md-6">
                <div class="designation">
                    <Button @click="add_modal = true" type="info">Add Task</Button>
                </div>
            </div>
            <div class="col-md-6">
                <div class="designation">
                       <Select v-model="status" @on-change="all_assignTask" filterable>
                            <Option  value="All" >All Status</Option>
                            <Option  value="Not Started" >Not Started</Option>
                            <Option  value="Running" >Running</Option>
                            <Option  value="Pause" >Pause</Option>
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
                                <th>Task Name</th>
                                <th>Detail</th>
                                <th>Status</th>
                                <th>Action</th>
                                <!-- <th>Id</th>
                                <th>Project name</th>
                                <th>Task Name</th>
                                <th>Description</th>
                                <th>Estimated time</th>
                                <th>Start time</th>
                                <th>End time</th>
                                <th>Total Time</th>
                                <th>Status</th>
                                <th>Action</th> -->
                            </tr>
                        </thead>
                    
                        <tbody>
                            <tr v-for="(item,index) in assignTask" :key="index">
                                <td>
                                    <p>{{item.id}}</p>
                                </td>
                                <td>
                                    <p v-if="item.projects">{{item.projects.project_name}}</p>
                                </td>
                                <td>
                                    <p>{{item.task_name}}</p>
                                </td>
                                <!-- <td>
                                    <p>{{item.description}}</p>
                                </td>
                                <td>
                                    <p>{{item.estimated_time}} Minutes</p>
                                </td>
                                <td>
                                    <p>{{item.start_time}}</p>
                                </td>
                                <td>
                                    <p>{{item.end_time}}</p>
                                </td>
                                <td>
                                    <p>{{item.total_time}}</p>
                                </td> -->
                                <td>
                                    <Button @click="viewDetail(item)" type="info">View</Button> 
                                </td>
                                <td>
                                    <p>{{item.status}}</p>
                                </td>
                                <td>
                                    <div class="_button">
                                        <Button type="info" @click="edit_Task(item,index)">Edit</Button>
                                        <Button v-if="item.status == 'Pause'" type="success" @click="start_assignTask(index)">Start</Button>
                                        <Button v-else-if="item.status == 'Running'" type="warning" @click="pause_assignTaskOn(item,index)">Pause</Button>
                                        <Button @click="Task_delete(item.id,index)" type="error">Delete</Button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                </table>
            <!---=== row list attendance END ===---->
            </div>
        </div>
        <!-- Add Assign task  start modal -->
        <Modal
            v-model="add_modal"
            :mask-closable ="false"
            title="Add New Assign Task"
            @on-ok="form_submmit"
            @on-cancel="add_modal = false">

            <div class="left_atten_card">
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Name</span>
                        </div>
                        <div class="right_input_pro">
                            <Select v-model="form.project_id" style="width:100%" size="large" clearable filterable>
                                <Option v-for="(item,index) in projects" :key="index" :value="item.id">{{item.project_name}}</Option>
                            </Select>
                        </div>
                    </div>
                </div>
                <!-- <div class="pro_left_input" v-if="employees.length>0"> 
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
                </div> -->
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
                        </div>
                    </div>
                </div>
            </div>
        </Modal>
        <!-- Add Assign task modal end -->
        <!-- Edit Assign task  start modal -->
        <Modal
            v-model="edit_modal"
            :mask-closable ="false"
            title="Edit New Assign Task"
            @on-ok="update_assignTask"
            @on-cancel="edit_modal = false">

            <div class="left_atten_card">
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Name</span>
                        </div>
                        <div class="right_input_pro">
                            <Select v-model="edit_data.project_id" style="width:100%" size="large" clearable filterable>
                                <Option v-for="(item,index) in projects" :key="index" :value="item.id">{{item.project_name}}</Option>
                            </Select>
                        </div>
                    </div>
                </div>
                <!-- <div class="pro_left_input" v-if="employees.length>0"> 
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
                </div> -->
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Task Name</span>
                        </div>
                        <div class="right_input_pro">
                            <Input v-model="edit_data.task_name" style="width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Description</span>
                        </div>
                        <div class="right_input_pro">
                            <Input v-model="edit_data.description" style="width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Estimated Time</span>
                        </div>
                        <div class="right_input_pro">
                            
                            <Input  v-model="edit_data.estimated_time" style="width: 100%" > <span slot="append">Minutes</span></Input>
                            
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Start Time</span>
                        </div>
                        <div class="right_input_pro">
                            <DatePicker type="datetime" format="yyyy-MM-dd HH:mm" :value="edit_data.start_time" @on-change="editStartTime" style="width: 100%"></DatePicker>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">End Time</span>
                        </div>
                        <div class="right_input_pro">
                            <DatePicker type="datetime"  format="yyyy-MM-dd HH:mm" :value="edit_data.end_time" @on-change="editEndTime" @on-ok="editEndTimeOk" style="width: 100%"></DatePicker>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Total Time</span>
                        </div>
                        <div class="right_input_pro">
                            <Input disabled v-model="edit_data.total_time" style="width: 100%" > <span slot="append">Minutes</span></Input>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Status</span>
                        </div>
                        <div class="right_input_pro">
                              <Select v-model="edit_data.status" filterable>
                                <Option  value="All" >All</Option>
                                <Option  value="Not Started" >Not Started</Option>
                                <Option  value="Running" >Running</Option>
                                <!-- <Option  value="Pause" >Pause</Option> -->
                                <Option  value="Completed" >Completed</Option>
                            </Select>
                        </div>
                    </div>
                </div>
            </div>
        </Modal>
        <Modal
            v-model="pause.modal"
            :mask-closable ="false"
            title="Edit New Assign Task"
            @on-ok="pause_assignTask"
            @on-cancel="edit_modal = false">

            <div class="left_atten_card" v-if="pause.modal">
                
                
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Task Name</span>
                        </div>
                        <div class="right_input_pro">
                             <p class="list_p2">{{assignTask[pause.index].task_name}}</p>
                        </div>
                    </div>
                </div>
               
               
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Pause Start</span>
                        </div>
                        <div class="right_input_pro">
                             <Input v-model="pause_data.start_time"  disabled style="width: 100%" />
                            <!-- <DatePicker type="datetime" format="yyyy-MM-dd HH:mm" :value="pause_data.start_time" @on-change="editStartTime" style="width: 100%"></DatePicker> -->
                        </div>
                    </div>
                </div>
                <!-- <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">End Time</span>
                        </div>
                        <div class="right_input_pro">
                            <DatePicker type="datetime"  format="yyyy-MM-dd HH:mm" :value="pause_data.end_time" @on-change="editEndTime" style="width: 100%"></DatePicker>
                        </div>
                    </div>
                </div> -->
                <!-- <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Total Time</span>
                        </div>
                        <div class="right_input_pro">
                            <InputNumber  :min="1" v-model="pause_data.duration" style="width: 100%"></InputNumber>
                        </div>
                    </div>
                </div> -->
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Reason</span>
                        </div>
                        <div class="right_input_pro">
                               <Input v-model="pause_data.reason" type="textarea" :autosize="{minRows: 4}" style="width: 100%" />
                        </div>
                    </div>
                </div>
            </div>
        </Modal>
        <Modal
            v-model="detail_modal"
            title="Detail of Assign Task"
			width="600px;">

            <div class="left_atten_card" v-if="showdata.projects">
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Name</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <Select v-model="form.project_id" style="width:100%" size="large" clearable>
                                <Option v-for="(item,index) in projects" :key="index" :value="item.id">{{item.project_name}}</Option>
                            </Select> -->
                            <p v-if="showdata.projects">{{showdata.projects.project_name}}</p>
                            <!-- <p>{{showdata.project_name}}</p> -->
                        </div>
                    </div>
                </div>
                <!-- <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Employee Name</span>
                        </div>
                        <div class="right_input_pro">
                            <Select v-model="form.employee_id" style="width:100%" size="large" clearable>
                                <Option v-for="(item,index) in employees" :key="index" :value="item.id">{{item.name}}</Option>
                            </Select>
                            <p v-if="showdata.employee">{{showdata.employee.name}}</p>
                            <p>{{showdata.name}}</p>
                        </div>
                    </div>
                </div> -->
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Task Name</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <Input v-model="form.task_name" style="width: 100%" /> -->
                            <p>{{showdata.task_name}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Description</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <Input v-model="form.description" type="textarea" :autosize="{minRows: 2,maxRows: 5}" style="width: 100%" /> -->
                            <p>{{showdata.description}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Estimated Time</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <InputNumber  :min="0" v-model="form.estimated_time" style="width: 100%"></InputNumber> -->
                            <p>{{showdata.estimated_time}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Start time</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <InputNumber  :min="0" v-model="form.estimated_time" style="width: 100%"></InputNumber> -->
                            <p>{{showdata.start_time}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">End time</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <InputNumber  :min="0" v-model="form.estimated_time" style="width: 100%"></InputNumber> -->
                            <p>{{showdata.end_time}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Total Time</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <InputNumber  min="0" v-model="form.estimated_time" style="width: 100%"></InputNumber> -->
                            <p>{{showdata.total_time}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Status</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <InputNumber  :min="0" v-model="form.estimated_time" style="width: 100%"></InputNumber> -->
                            <p>
                                <span>{{showdata.status}}</span>
                                <span><Button @click="viewPause(showdata)" type="info">View</Button></span>
                           </p>
                        </div>
                    </div>
                </div>
            </div>
        </Modal>
        <Modal
			v-model="viewlModal"
			title="Pause Details"
			>
            <template v-if="view.item.status == 'Not Started'">
                <h4>Nothing to show</h4>
            </template>
            <template v-else>
                <div class="outing_list">
                <div class="row table_1">
                    <div class="col-md-3">
                        <p class="list_p1">No. of Pauses</p>
                    </div>
                    <div class="col-md-3">
                        <p class="list_p2">Pause Started:</p>
                    </div>
                    <div class="col-md-3">
                        <p class="list_p2">Pause Ended:</p>
                    </div>
                    <div class="col-md-3">
                        <p class="list_p2">Pause Reason:</p>
                    </div>
                    
                </div>
                <div class="row table_2" v-for="(item,index) in view.item.pausess" :key="index">
                    <div class="col-md-3">
                        <p class="list_p1">{{index+1}}</p>
                    </div>
                    <div class="col-md-3">
                         <p class="list_p1">{{item.start_time}}</p>
                    </div>
                    <div class="col-md-3">
                            <p class="list_p1">{{item.end_time}}</p>
                    </div>
                    <div class="col-md-3">
                            <p class="list_p1">{{item.reason}}</p>
                    </div>
                    
                </div>
            </div>
        	
            </template>
            <div slot="footer">
                <Button type="info"  @click="viewlModal = false">Close</Button>
            </div>
    	</Modal>
        <!-- Edit Assign task modal end -->
    </div>
</template>

<script>
	
	export default {
	  data(){
          return{
            showdataIndex:-1,
            view:{
                item:{},
                index:-1, 
            },
            viewlModal:false,
              detail_modal: false,
              assignTask:[],
              search:'',
              status:'All',
              edit_data: {},
              editIndex:-1,
              edit_modal: false,
              add_modal:false,
              projects:[],
              showdata:{},
              form:{
                  project_id:'',
                  task_name:'',
                  description:'',
                  estimated_time:0,
              },
              pause_data:{
                  task_id:'',
                  employee_id:'',
                  start_time:'',
                  end_time:'',
                  reason:'',
                  duration:0,
              },
              pause:{
                  modal:false,
                  index:-1,
              },
              tempDiffTime:0,
          }
      },
      methods:{
          viewPause(item){
              console.log(item)
            this.view.item = item
            this.view.index = this.showdataIndex
            this.viewlModal = true;
        },
          viewDetail (item) {
            this.showdata = item;
            this.detail_modal = true;
        },
         async pause_assignTask(){
            if(this.pause_data.reason == '' ) return this.i("Reason is Empty!")
            if(this.assignTask[this.pause.index].lastpause.length>0){
                console.log("es yes yes ")
                const O_entry = new Date(this.assignTask[this.pause.index].lastpause[0].end_time);
                const O_leave = new Date( this.pause_data.start_time);

                const diffTime = Math.abs(O_leave - O_entry);
                const diffDays = Math.round(diffTime / (1000 * 60 )); 
                this.pause_data.total_time = diffDays
            }
            else{
            
                const O_entry = new Date(this.assignTask[this.pause.index].start_time);
                const O_leave = new Date( this.pause_data.start_time);

                const diffTime = Math.abs(O_leave - O_entry);
                const diffDays = Math.round(diffTime / (1000 * 60 )); 
                this.pause_data.total_time = diffDays
            }
           
            const res = await this.callApi('post','puaseTask',this.pause_data)
            if(res.status == 200){
                // console.log(res.data);
                this.s(' Task  Paused!')
                this.assignTask[this.pause.index] = res.data
                let pause_data = {
                  task_id:'',
                  employee_id:'',
                  start_time:'',
                  reason:'',
              }
              let pause ={
                  modal:false,
                  index:-1,
              }
              this.pause_data = pause_data
              this.pause = pause

               
            }
            else{
                this.swr()
            }

          },
          async start_assignTask(index){
              
              
           const start = new Date();
           
            let date =start.getFullYear()+'-'+(start.getMonth()+1)+'-'+start.getDate()+' '+ start.getHours()+':'+start.getMinutes();
            let data = {
                id:(this.assignTask[index].lastpause[0])? this.assignTask[index].lastpause[0].id : 0 ,
                task_id:this.assignTask[index].id,
                end_time:date,
                duration:0
            } 

            if(data.id== 0) return this.i("nai")

            const O_entry = new Date(this.assignTask[index].lastpause[0].start_time);
            const O_leave = new Date();

            const diffTime = Math.abs(O_leave - O_entry);
            const diffDays = Math.round(diffTime / (1000 * 60 * 60)); 
            data.duration = diffDays
            
            const res = await this.callApi('put','user/puaseTask',data)
            if(res.status === 200){
               this.s("Task Started!")
                this.assignTask[index] = res.data
                this.assignTask[index].status = 'Running'
                location.reload()
                
                console.log(this.assignTask[index].status)
                this.$forceUpdate();  // 
                return
            //    console.log(this.assignTask[index].status)
               Vue.set(this.assignTask[index] ,'status',"Running")
            }
            else{
                this.swr()
            }

          },
          pause_assignTaskOn(item,index){
              if(item.start_time == null) return this.i("Start Time is empty!")
            this.pause_data.employee_id = item.employee_id
            this.pause_data.task_id = item.id
			const start = new Date();
            let date =start.getFullYear()+'-'+(start.getMonth()+1)+'-'+start.getDate()+' '+ start.getHours()+':'+start.getMinutes();
            this.pause_data.start_time = date
            this.pause.index = index
			this.pause.modal = true
            },
          editStartTime(date){
              this.edit_data.start_time=date
          },
          editEndTime(date){
             console.log(" i am ok")
              if(this.assignTask[this.editIndex].lastpause.length>0){
                this.edit_data.end_time=date
                const date1 = new Date(this.assignTask[this.editIndex].lastpause[0].end_time);
                const date2 = new Date(this.edit_data.end_time);
                const diffTime = Math.abs(date2 - date1);
                const diffDays = Math.round(diffTime / (1000 * 60  )); 
                this.tempDiffTime =  diffDays
                console.log(this.tempDiffTime)
                return
              }
              this.edit_data.end_time=date
              const date1 = new Date(this.edit_data.start_time);
              const date2 = new Date(this.edit_data.end_time);
              const diffTime = Math.abs(date2 - date1);
              const diffDays = Math.round(diffTime / (1000 * 60  )); 
              this.tempDiffTime =  diffDays
               console.log('tempDiffTime')
               console.log(this.tempDiffTime)
          },
         editEndTimeOk(){
             console.log(this.edit_data.total_time)
              this.edit_data.total_time = parseInt(this.edit_data.total_time) + this.tempDiffTime
                console.log(this.edit_data.total_time)
          },
          async form_submmit(){
            if(this.form.project_id == '') return this.i("Project Name is Empty!")
            if(this.form.task_name == '') return this.i("Task name  is Empty!")
            // if(this.form.description == '') return this.i("Description Name is Empty!")
            if(this.form.estimated_time == '') return this.i("Estimated time  is Empty!")
            const res = await this.callApi('post','EmployeeTask',this.form)
            if(res.status == 200){
                this.s(' Task have been successfully Assigned!')
                this.assignTask.unshift(res.data)
                console.log(res.data)
                // let item = {
                //     project_name:
                // }
                this.form.project_id = ''
                this.form.task_name = ''
                this.form.description = ''
                this.form.estimated_time = ''
            }
            else{
                this.swr()
            }

          },
          edit_Task(item,index){
            this.edit_data = _.cloneDeep(item)
            this.editIndex = index
            delete this.edit_data.projects
            delete this.edit_data.lastpause
            delete this.edit_data.pausess
            // delete this.edit_data.employee
			this.edit_modal = true
            },
        async update_assignTask () {
            if(this.edit_data.project_id == '') return this.i("Project Name is Empty!")
            if(this.edit_data.task_name == '') return this.i("Task name  is Empty!")
            // if(this.edit_data.description == '') return this.i("Description Name is Empty!")
            if(this.edit_data.estimated_time == '') return this.i("Estimated time  is Empty!")
            if(this.edit_data.status == "Running" && this.edit_data.start_time == '' ) return this.i("Start time Nme is Empty!")
            
            // if(this.edit_data.end_time == '') return this.i("End time  is Empty!")
            // if(this.edit_data.total_time == '') return this.i("Total time is Empty!")
            // if(this.edit_data.status == '') return this.i("Status is Empty!")
            const res = await this.callApi('put', 'EmployeeTask', this.edit_data)
            if (res.status === 200) {
                this.assignTask[this.editIndex] = res.data
                this.s('Task Updated')
                this.edit_data = {}
                this.editIndex = -1
                this.edit_modal = false
            }else{
                this.swr();
            }

        },
        async Task_delete(id,index){
            if(!confirm("Are you sure to delete this Task?")){
                return;
            }
            let ob = {
                id:id
            }
            const res = await this.callApi('delete','EmployeeTask',ob)
            if(res.status == 200){
                this.i('Task have been successfully Deleted!')
                this.assignTask.splice(index,1)
            }
          },
          async all_Projects(){
              let status = ['Running']
                const res = await this.callApi('get',`project?status=${status}`)
                if(res.status == 200){
                    this.projects = res.data
                }
            },
            async all_assignTask(){
                const res = await this.callApi('get',`EmployeeTask?status=${this.status}`)
                if(res.status == 200){
                    this.assignTask = res.data
                }
            },
      },
      async created(){
          this.all_Projects();
          this.all_assignTask();
          
         
        }
	}
</script>