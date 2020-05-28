<template>
    <div>
         <!---=== top navigation right side ====---->         
        <div class="row right_row1">
            <div class="top_div">
                <div class="top_left">
                    <p class="task_p">Employee Attendance</p>
                </div>
                
                <div class="top_right">
                    <div class="search_div">
                        <Input style="width:300px;" size="large" search v-model="search" @on-change="searchOn"  placeholder="Search..." />
                    </div>
                    <div class="notify_icon">
                        <Icon type="md-notifications-outline" />
                        <span class="num">2</span>
                    </div>
                </div>
            </div>
        </div>
        <!---=== top navigation right side END ====---->
        <!---=== right side content ===---->
        <!---==== right side top button ===--->
        <div class="row justify-content-between">
            <div class="col-md-4" v-if="today">
                <div class="calender">
                    
                    <DatePicker type="date" format="yyyy-MM-dd" :value="today" @on-change="selectDate" style="width: 100%"></DatePicker>
                </div>
            </div>
        </div>
        <div class="row justify-content-between">
            <div class="col-md-6">
                <div class="designation">
                    <Button @click="add_modal = true" type="info">Add Attendance</Button>
                </div>
            </div>
        </div>
        <!---==== right side top button END ===--->
        <!-- Add Attendance  start modal -->
        <Modal
            v-model="add_modal"
            title="Add New Attendance"
            @on-ok="add_people"
            @on-cancel="add_modal = false">
            <Checkbox v-model="checkAll" @on-change="changeAll">Select All</Checkbox>
            <div class="row" v-if="designation.length>0">
               <div class="col-md-6" v-for="(item,index) in designation" :key="index">
                   <h5>{{item.name}}</h5>
                   <div  v-for="(people,people_index) in employee" :key="people_index" v-if="people.designation_id==item.id">
                       <Checkbox v-model="people.isSelected">{{people.name}}</Checkbox>
                   </div>

               </div>
           </div>
        </Modal>
        <!-- Add Attendance modal end -->
        <!---=== table right side ====---->
            <div class="_table_all">
                <div class="_table_main">
                    <table class="_1table">
                        <thead>
                            <tr>
                               <th>
                                    <p> No.</p>
                                </th>
                                <th>
                                    <p>Employee Name</p>
                                </th>
                                <th>
                                    <p>Entry time</p>
                                </th>
                                <th>
                                    <p>Estamated Leave Time</p>
                                </th>
                                <!-- <th>
                                    <p>Score</p>
                                </th> -->

                                <th>
                                    <p>Description</p>
                                </th>
                                <th>
                                    <p>No. of Outing</p>
                                </th>
                                <th>
                                    <p>Action</p>
                                </th>
                                <!-- <th>
                                    <p>Break Statr</p>
                                </th>
                                <th>
                                    <p>Break End</p>
                                </th>
                                <th>
                                    <p>Duration of break</p>
                                </th>
                                <th>
                                    <p>Leave time</p>
                                </th>
                                
                                
                                <th>
                                    <p>Total in time</p>
                                </th>
                                <th>
                                    <p>Total Out time</p>
                                </th>
                                
                                 -->
                            </tr>
                        </thead>
                        <tbody>
                            <template v-if="attendance == ''">
                                <tr>
                                    <td>
                                        <h5> Nothing added yet !!..</h5>
                                    </td>
                                </tr>
                            </template>
							<template v-else>
								<tr  v-for="(item,index) in attendance" :key="index">
									<template v-if="isEdit == true && editIndex == index">
										<td>
											<p>{{index+1}}</p>
										</td>
										<td>
											<p v-if="item.employee">{{item.employee.name}}</p>
										</td>
										<td>
											<TimePicker format="HH:mm" placeholder="Select time" style="width: 100%" :value="editData.entry_time" @on-change="editEntryTime"></TimePicker>
										</td>
										<td>
											<TimePicker format="HH:mm" placeholder="Select time" style="width: 100%" :value="editData.break_start" @on-change="editStartTime"></TimePicker>
										</td>
										<td>
											<TimePicker format="HH:mm" placeholder="Select time" style="width: 100%" :value="editData.break_end" @on-change="editEndTime"></TimePicker>
										</td>
										<td>
											<Input style="width: 100%" disabled v-model="editData.duration_of_break"/>
										</td>
										<td>
											<TimePicker format="HH:mm" placeholder="Select time" style="width: 100%" :value="editData.leave_time" @on-change="editLeaveTime"></TimePicker>
										</td>
										<td>
											<Button type="primary" @click="outingModal = true">View</Button>
										</td>
										<td>
											<p>{{item | esLeaveTime}}</p>
										</td>
										<td>
											<Input style="width: 100%" disabled v-model="editData.total_in_time"/>
										</td>
										<td>
											<Input style="width: 100%" disabled v-model="editData.total_out_time"/>
										</td>
										<td>
											<Input style="width: 100%" v-model="editData.score"/>
										</td>
										<td>
											<Button type="success" @click="updateAttendance">Save</Button>
											<button class="btn btn-warning" @click="isEdit = false">Cancel</button>
										</td>
									</template>
									<template v-else>
										<td>
											<p >{{index+1}}</p>
										</td>
										<td>
											<p>{{item.employee.name}}</p>
										</td>
										<td>
											<p>{{item.entry_time}}</p>
										</td>
                                        <td>
											<p>{{item | esLeaveTime}}</p>
										</td>
                                        <!-- <td>
											<p>{{item.score}}</p>
										</td> -->
                                        <td>
                                            <Button @click="viewDetail(item)" type="info">View</Button> 
                                        </td>
                                        <td>
											<Button type="primary" @click="outingViewModalOn(item,index)">View</Button>
											
										</td>
                                        <td>
											<div class="_button">
                                                <!-- <Button type="info" @click="edit_assignTask(item,index)">Edit</Button> -->
												<Button type="info" @click="isEditOn(item,index)" >Edit</Button>
												<Button type="info" @click="addOutingOn(item,index)" >Add Outing</Button>
												<Button @click="atten_delete(item.id,index)" type="error">Delete</Button>
											</div>
										</td>
										<!-- <td>
											<p>{{item.break_start}}</p>
										</td>
										<td>
											<p>{{item.break_end}}</p>
										</td>
										<td>
											<p>{{item.duration_of_break}} min</p>
										</td>
										<td>
											<p>{{item.leave_time}}</p>
										</td>
										
										
										<td>
											<p>{{item.total_in_time | formatTime}}</p>
										</td>
										<td>
											<p>{{item.total_out_time | formatTime}}</p>
										</td>
										
										 -->
									</template>
								</tr>
							</template>
                            
                        </tbody>
                    </table>
                </div>
            </div>

        <!---=== right side attendance list ==--->
        
        <!---==== right side attendance list END ===--->
        <!---=== right side content END ===---->
        <Modal
            v-model="edit_modal"
            title="Edit Attendance"
            @on-ok="updateAttendance"
            @on-cancel="edit_modal = false">

            <div class="left_atten_card">
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Employee Name</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <Select v-model="edit_data.project_id" style="width:100%" size="large" clearable filterable>
                                <Option v-for="(item,index) in projects" :key="index" :value="item.id">{{item.project_name}}</Option>
                            </Select> -->
                            <p v-if="editData.employee">{{editData.employee.name}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Entry Time</span>
                        </div>
                        <div class="right_input_pro">
                            <TimePicker format="HH:mm" placeholder="Select time" style="width: 100%" :value="editData.entry_time" @on-change="editEntryTime"></TimePicker>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Break Start</span>
                        </div>
                        <div class="right_input_pro">
                            <TimePicker format="HH:mm" placeholder="Select time" style="width: 100%" :value="editData.break_start" @on-change="editStartTime"></TimePicker>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Break End</span>
                        </div>
                        <div class="right_input_pro">
                            <TimePicker format="HH:mm" placeholder="Select time" style="width: 100%" :value="editData.break_end" @on-change="editEndTime"></TimePicker>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Duration of Break</span>
                        </div>
                        <div class="right_input_pro">
                            <Input style="width: 100%" disabled v-model="editData.duration_of_break"/>
                        </div>
                    </div> 
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Leave Time</span>
                        </div>
                        <div class="right_input_pro">
                            <TimePicker format="HH:mm" placeholder="Select time" style="width: 100%" :value="editData.leave_time" @on-change="editLeaveTime"></TimePicker>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Estamated Leave Time</span>
                        </div>
                        <div class="right_input_pro">
                            <p>{{editData | esLeaveTime}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Total in time</span>
                        </div>
                        <div class="right_input_pro">
                            <Input style="width: 100%" disabled v-model="editData.total_in_time"/>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Total out time</span>
                        </div>
                        <div class="right_input_pro">
                            <Input style="width: 100%" disabled v-model="editData.total_out_time"/>
                        </div>
                    </div>
                </div>
            </div>
        </Modal>
        <Modal v-model="outingModal" title="Extra Outing" @on-ok="OutingSubmit" @on-cancel="cancel">
            <div class="btn_add_row">
              
            </div>
            <div class="outing_list">
                <div class="row table_1">
                    <div class="col-md-1">
                        <p class="list_p1">No. of outing</p>
                    </div>
                    <div class="col-md-3">
                        <p class="list_p2">Leave time</p>
                    </div>
                    <div class="col-md-3">
                        <p class="list_p2">Entry time</p>
                    </div>
                    <div class="col-md-2">
                        <p class="list_p2">Duration</p>
                    </div>
                    <div class="col-md-3">
                        <p class="list_p2">Reason</p>
                    </div>
                </div>
                <div class="row table_2">
                    <div class="col-md-1">
                        <p class="list_p1">1</p>
                    </div>
                    <div class="col-md-3">
                        <TimePicker format="HH:mm" placeholder="Select time" style="width: 100%" :value="outingData.entry_time" @on-change="outingEntryTime"></TimePicker>
                    </div>
                    <div class="col-md-3">
                        <TimePicker format="HH:mm" placeholder="Select time" style="width: 100%" :value="outingData.leave_time" @on-change="outingLeaveTime"></TimePicker>
                    </div>
                    <div class="col-md-2">
                        <Input style="width: 100%" disabled v-model="outingData.duration"/>
                    </div>
                    <div class="col-md-3">
                        <Input style="width: 100%" type="text" v-model="outingData.reason"/>
                    </div>
                </div>
            </div>
        </Modal>

         <Modal v-model="outingViewModal" title="Extra Outing" @on-ok="outingViewModal = false" @on-cancel="canceloutingViewModalOn">
            
            <div class="outing_list" v-if="outingItem.item.outings">
                <div class="row table_1">
                    <div class="col-md-2">
                        <p class="list_p1">No. of outing</p>
                    </div>
                    <div class="col-md-2">
                        <p class="list_p2">Entry time</p>
                    </div>
                    <div class="col-md-2">
                        <p class="list_p2">Leave time</p>
                    </div>
                    <div class="col-md-2">
                        <p class="list_p2">Duration</p>
                    </div>
                    <div class="col-md-2">
                        <p class="list_p2">Reason</p>
                    </div>
                    <div class="col-md-2">
                        <p class="list_p2">Action</p>
                    </div>
                </div>
                <div class="row table_2" v-for="(item,index) in outingItem.item.outings" :key="index">
                    <div class="col-md-2">
                        <p class="list_p1">{{index+1}}</p>
                    </div>
                    <div class="col-md-2">
                         <p class="list_p1">{{item.leave_time}}</p>
                    </div>
                    <div class="col-md-2">
                            <p class="list_p1">{{item.entry_time}}</p>
                    </div>
                    <div class="col-md-2">
                            <p class="list_p1">{{item.duration}}</p>
                    </div>
                    <div class="col-md-2">
                            <p class="list_p1">{{item.reason}}</p>
                    </div>
                    <div class="col-md-2">
                             <Button type="error" @click="outingDeleted(item,index)" >Delete</Button>
                    </div>
                </div>
            </div>
        </Modal>
        <Modal
            v-model="detail_modal"
            title="Detail of Assign Task"
			width="600px;">

            <div class="left_atten_card" v-if="showdata.employee">
               
                <div class="pro_left_input" v-if="employee.length>0"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Employee Name</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <Select v-model="form.employee_id" style="width:100%" size="large" clearable>
                                <Option v-for="(item,index) in employees" :key="index" :value="item.id">{{item.name}}</Option>
                            </Select> -->
                            <p v-if="showdata.employee">{{showdata.employee.name}}</p>
                            <!-- <p>{{showdata.name}}</p> -->
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Entry Time</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <Input v-model="form.task_name" style="width: 100%" /> -->
                            <p>{{showdata.entry_time}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Estamated Leave Time</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <Input v-model="form.task_name" style="width: 100%" /> -->
                            <p>{{showdata | esLeaveTime}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Break Start</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <Input v-model="form.description" type="textarea" :autosize="{minRows: 2,maxRows: 5}" style="width: 100%" /> -->
                            <p>{{showdata.break_start}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Break End</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <InputNumber  :min="0" v-model="form.estimated_time" style="width: 100%"></InputNumber> -->
                            <p>{{showdata.break_end}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Duration of break</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <InputNumber  :min="0" v-model="form.estimated_time" style="width: 100%"></InputNumber> -->
                            <p>{{showdata.duration_of_break}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Leave time</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <InputNumber  :min="0" v-model="form.estimated_time" style="width: 100%"></InputNumber> -->
                            <p>{{showdata.leave_time}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Total in time</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <InputNumber  min="0" v-model="form.estimated_time" style="width: 100%"></InputNumber> -->
                            <p>{{showdata.total_in_time | formatTime}}</p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Total Out time</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <InputNumber  :min="0" v-model="form.estimated_time" style="width: 100%"></InputNumber> -->
                            <p>
                                <span>{{showdata.total_out_time | formatTime}}</span>
                                <!-- <span><Button @click="viewPause(showdata)" type="info">View</Button></span> -->
                           </p>
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Score</span>
                        </div>
                        <div class="right_input_pro">
                            <!-- <InputNumber  :min="0" v-model="form.estimated_time" style="width: 100%"></InputNumber> -->
                            <p>
                                <span>{{showdata.score}}</span>
                                <!-- <span><Button @click="viewPause(showdata)" type="info">View</Button></span> -->
                           </p>
                        </div>
                    </div>
                </div>
            </div>
        </Modal>
    </div>
</template>

<script>
	export default {
      data(){
          return{
              edit_modal: false,
              detail_modal: false,
              showdata:{},
              attendance:[],
              today:'',
              search:'',
              editIndex:-1,
              isEdit:false,
              outingViewModal:false,
              checkAll:false,
              outingModal : false,
              add_modal:false,
              employee:[],
              designation:[],
              form:{
                current_date:'',
                employee_id:'',
              },
              editData:{

              },
              outingData:{
                  employee_id:'',
                  attendance_id:'',
                  entry_time:'',
                  leave_time:'',
                  duration:0,
                  reason:'',
              },
              outingItem:{
                  item:'',
                  index:'',
              }

          }
      },
      methods: {
          viewDetail (item) {
            this.showdata = item;
            this.detail_modal = true;
        },
          outingEntryTime(date){
              this.outingData.entry_time=date
          },
          outingLeaveTime(date){

              this.outingData.leave_time=date
              const O_entry = new Date("01/01/2007 "+ this.outingData.entry_time);
              const O_leave = new Date("01/01/2007 "+ this.outingData.leave_time);

              const diffTime = Math.abs(O_leave - O_entry);
              const diffDays = Math.ceil(diffTime / (1000 * 60 )); 
              this.outingData.duration = diffDays
          },
          editStartTime(date){
              this.editData.break_start=date
          },
          editEndTime(date){

              this.editData.break_end=date
              const date1 = new Date("01/01/2007 "+ this.editData.break_start);
              const date2 = new Date("01/01/2007 "+ this.editData.break_end);

              const diffTime = Math.abs(date2 - date1);
              const diffDays = Math.ceil(diffTime / (1000 * 60 )); 
              this.editData.duration_of_break = diffDays
          },
          editEntryTime(date){
              this.editData.entry_time=date
          },
          editLeaveTime(date){

              this.editData.leave_time=date
              const date3 = new Date("01/01/2007 "+ this.editData.entry_time);
              const date4 = new Date("01/01/2007 "+ this.editData.leave_time);

              const diffTime = Math.abs(date4 - date3);
              let diffDays = Math.ceil(diffTime / (1000 * 60)); 
              diffDays = diffDays - this.editData.duration_of_break
              let hours = Math.ceil(diffDays / 60);
              let minutes = diffDays % 60;
              let time  = hours + ' hours :'+minutes+" minutes"
              console.log(time)
              this.editData.total_in_time  = diffDays
              this.editData.total_out_time = this.editData.duration_of_break
          },
          isEditOn(item,index){
              this.editData = _.clone(item)
              this.editIndex = index
             
              this.edit_modal = true
          },
          addOutingOn(item,index){
              this.outingItem.item = _.clone(item)
              this.outingItem.index = index
              this.outingModal = true
          },
          outingViewModalOn(item,index){
              this.outingItem.item = _.clone(item)
              this.outingItem.index = index
              this.outingViewModal = true
          },
           canceloutingViewModalOn(){
              this.outingItem.item = {}
              this.outingItem.index = -1
              this.outingViewModal = false
          },
          
          async selectDate(date){

            this.today = date
            const res = await this.callApi('get',`Attendance?date=${this.today}`)
            if(res.status == 200){
                this.attendance = res.data
            }
            else this.swr()
           
          },
          async searchOn(){
            const res = await this.callApi('get',`Attendance?date=${this.today}&str=${this.search}`)
            if(res.status == 200){
                this.attendance = res.data
            }
            else this.swr()
           
          },
          changeAll(){

			for(let d of this.employee){
				d.isSelected = this.checkAll
			  }
           },
           async OutingSubmit(){
               this.outingData.employee_id=this.outingItem.item.employee_id
               this.outingData.attendance_id=this.outingItem.item.id
            if(this.outingData.entry_time == '') return this.i("Entry time Name is Empty!")
            if(this.outingData.leave_time == '') return this.i("Leave time Name is Empty!")
            if(this.outingData.duration == '') return this.i("Duration is Empty!")
            if(this.outingData.reason == '') return this.i("Reason is Empty!")
            const res = await this.callApi('post','extraOuting',this.outingData)
            if(res.status == 200){
                this.s(' ExtraOuting have been successfully added!')

                this.attendance[this.outingItem.index].outings.push(res.data)
                this.outingData.employee_id = ''
                this.outingData.attendance_id = ''
                this.outingData.entry_time = ''
                this.outingData.leave_time = ''
                this.outingData.duration = ''
                this.outingData.reason = ''
                this.outingItem.item = ''
                this.outingItem.index = ''
            }
            else{
                this.swr()
            }

          },
           async outingDeleted(item,index){
            
            const res = await this.callApi('delete','extraOuting',{id:item.id})
            if(res.status == 200){
                this.s(' ExtraOuting have been successfully deleted!')

                this.attendance[this.outingItem.index].outings.splice(index,1)
                
            }
            else{
                this.swr()
            }

          },
           async add_people(){
            if(this.today == '') return this.i("Current date is Empty!")
            if(this.employee == '') return this.i("employee is Empty!")
            let ob={
                current_date : this.today,
                employee : this.employee

            }
            const res = await this.callApi('post','Attendance',ob)
            if(res.status == 200){
                this.s(' Attendance have been successfully added!')
                console.log(res.data)
                this.attendance = (res.data)
                this.today == ''
                // this.form.employee_id = ''
                
            }
            else{
                this.swr()
            }

          },
          async updateAttendance(){
            if(this.editData.leave_time){
                const date3 = new Date("01/01/2007 "+ this.editData.entry_time);
                const date4 = new Date("01/01/2007 "+ this.editData.leave_time);

                const diffTime = Math.abs(date4 - date3);
                let diffDays = Math.ceil(diffTime / (1000 * 60)); 
                diffDays = diffDays - this.editData.duration_of_break
               
                this.editData.total_in_time  = diffDays
                this.editData.total_out_time = this.editData.duration_of_break
                if(this.editData.outings.length > 0){
                    for(let d of this.editData.outings){
                        this.editData.total_in_time -= d.duration
                        
                        this.editData.total_out_time = parseInt(this.editData.total_out_time) + parseInt(d.duration)
                    }
                }
                
            }

            delete this.editData.employee
            delete this.editData.outings
            const res = await this.callApi('put','Attendance',this.editData)
            if(res.status == 200){
                this.attendance[this.editIndex] = res.data 
                this.s("Attendance Updated  !")
                console.log(res.data)
                this.editData = {} 
                this.editIndex = -1
                this.isEdit = false
            }
            else{
                this.swr();
            }
        },
        async atten_delete(id,index){
                if(!confirm("Are you sure to delete this Attendance?")){
                    return;
                }
                let ob = {
                    id:id
                }
                const res = await this.callApi('delete','Attendance',ob)
                if(res.status == 200){
                    this.i(' Attendance have been successfully Deleted!')
                    this.attendance.splice(index,1)
                }
            },
          
            ok () {
                this.$Message.info('Clicked ok'); 
            },
            cancel () {
                this.$Message.info('Clicked cancel');
            }
        },
        filters:{
            formatTime(item){
            let hours = Math.floor(item / 60);
              let minutes = item % 60;
              let time  = hours + ' hours :'+minutes+" minutes"
              return time;
            }
        },
        
        async created(){
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();

            today =  yyyy + '-' + mm + '-' + dd ;
            this.today = today
            let [res1,res2,res3] = await Promise.all([
                this.callApi('get','designation'),
                this.callApi('get','employee'),
                this.callApi('get',`Attendance?date=${today}`),
            ]);
            if(res1.status == 200 && res2.status == 200 && res3.status == 200){
                this.designation = res1.data
                for(let d of res2.data){
                    d.isSelected = false
                }
                this.employee = res2.data
                this.attendance = res3.data
                
            }
           
        },
        
	}
</script>
