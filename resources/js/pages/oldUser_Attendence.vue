<template>
    <div>
         <!---=== top navigation right side ====---->        
        <div class="row right_row1">
            <div class="top_div">
                <div class="top_left">
                    <p class="task_p">Employee Attendance</p>
                </div>
                
                <!-- <div class="top_right">
                    <div class="search_div">
                        <Input style="width:300px;" size="large" search v-model="search" @on-change="searchOn"  placeholder="Search..." />
                    </div>
                    <div class="notify_icon">
                        <Icon type="md-notifications-outline" />
                        <span class="num">2</span>
                    </div>
                </div> -->
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
       
        <!---==== right side top button END ===--->
        <!-- Add Attendance  start modal -->
        <!-- <Modal
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
        </Modal> -->
        <!-- Add Attendance modal end -->
        <!---=== right side attendance list ==--->
        <div class="table_list">
            <div class="row table_1">
                <div class="col-md-2">
                    <p class="list_p1">Employee Name</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">Entry time</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">Break Start</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">Break End</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">Duration of break</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">Leave time</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">No. of Outing</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">Estimate leave time</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">Total in time</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">Total Out time</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">Score</p>
                </div>
                <div class="col-md-1">
                    <p class="list_p2">Action</p>
                </div>
            </div>

           
            <div class="row table_2" v-for="(item,index) in attendance" :key="index">
                <template v-if="isEdit == true && editIndex == index">
                     <div class="col-md-2">
                        <p class="list_p1" v-if="item.employee">{{item.employee.name}}</p>
                    </div>
                    <div class="col-md-1">
                        <TimePicker format="HH:mm" placeholder="Select time" style="width: 100%" :value="editData.entry_time" @on-change="editEntryTime"></TimePicker>
                        
                    </div>
                    <div class="col-md-1">
                        <TimePicker format="HH:mm" placeholder="Select time" style="width: 100%" :value="editData.break_start" @on-change="editStartTime"></TimePicker>
                        
                    </div>
                    <div class="col-md-1">
                        <TimePicker format="HH:mm" placeholder="Select time" style="width: 100%" :value="editData.break_end" @on-change="editEndTime"></TimePicker>
                        
                    </div>
                    <div class="col-md-1">
                        <Input style="width: 100%" disabled v-model="editData.duration_of_break"/>
                    </div>
                    <div class="col-md-1">
                        <TimePicker format="HH:mm" placeholder="Select time" style="width: 100%" :value="editData.leave_time" @on-change="editLeaveTime"></TimePicker>
                        
                    </div>
                    <div class="col-md-1">
                        <Button type="primary" @click="outingModal = true">View</Button>
                        
                    </div>
                    <div class="col-md-1">
                        <Input style="width: 100%" disabled v-model="editData.total_in_time"/>
                    </div>
                    <div class="col-md-1">
                        <Input style="width: 100%" disabled v-model="editData.total_out_time"/>
                    </div>
                    <div class="col-md-1">
                        <Input style="width: 100%" v-model="editData.score"/>
                    </div>
                    <!-- <div class="col-md-1">
                        <Button type="success" @click="updateAttendance">Save</Button>
                        <button class="btn btn-warning" @click="isEdit = false">Cancel</button>
                    </div> -->
                </template>
                <template v-else>
                    <div class="col-md-2">
                        <p class="list_p1">{{item.employee.name}}</p>
                    </div>
                    <div class="col-md-1">
                        <p class="list_p2">{{item.entry_time}}</p>
                    </div>
                    <div class="col-md-1">
                        <p class="list_p2">{{item.break_start}}</p>
                    </div>
                    <div class="col-md-1">
                        <p class="list_p2">{{item.break_end}}</p>
                    </div>
                    <div class="col-md-1">
                        <p class="list_p2">{{item.duration_of_break}} min</p>
                    </div>
                    <div class="col-md-1">
                        <p class="list_p2">{{item.leave_time}}</p>
                    </div>
                    <div class="col-md-1">
                        <Button type="primary" @click="outingViewModalOn(item,index)">View</Button>
                        
                    </div>
                    <div class="col-md-1">
                        <p class="list_p2">{{item | esLeaveTime}}</p>
                    </div>
                    <div class="col-md-1">
                        <p class="list_p2">{{item.total_in_time | formatTime}}</p>
                    </div>
                    <div class="col-md-1">
                        <p class="list_p2">{{item.total_out_time | formatTime}}</p>
                    </div>
                    <div class="col-md-1">
                        <p class="list_p2">{{item.score}}</p>
                    </div>
                    <div class="col-md-1">
                    <!-- <Button type="info" @click="isEditOn(item,index)" >Edit</Button> -->
                    <!-- <Button type="info" @click="addOutingOn(item,index)" >Add Outing</Button> -->
                    <!-- <Button @click="atten_delete(item.id,index)" type="error">Delete</Button> -->
                </div>
                </template>
               
            </div>
        </div>
        <!---==== right side attendance list END ===--->
        <!---=== right side content END ===---->
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

         <Modal v-model="outingViewModal" title="Extra Outing" @on-ok="outingViewModal = false" @on-cancel="outingViewModal = false">
            
            <div class="outing_list">
                <div class="row table_1">
                    <div class="col-md-2">
                        <p class="list_p1">No. of outing</p>
                    </div>
                    <div class="col-md-2">
                        <p class="list_p2">Leave time</p>
                    </div>
                    <div class="col-md-2">
                        <p class="list_p2">Entry time</p>
                    </div>
                    <div class="col-md-2">
                        <p class="list_p2">Duration</p>
                    </div>
                    <div class="col-md-4">
                        <p class="list_p2">Reason</p>
                    </div>
                    <!-- <div class="col-md-4">
                        <p class="list_p2">Action</p>
                    </div> -->
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
                    <div class="col-md-4">
                            <p class="list_p1">{{item.reason}}</p>
                    </div>
                    <!-- <div class="col-md-4">
                             <Button type="error" @click="outingDeleted(item,index)" >Delete</Button>
                    </div> -->
                </div>
            </div>
        </Modal>
    </div>
</template>

<script>
	export default {
      data(){
          return{
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
             
              this.isEdit = true
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
          
          async selectDate(date){

            this.today = date
            const res = await this.callApi('get',`user/EmployeeAttendance?date=${this.today}`)
            if(res.status == 200){
                this.attendance = res.data
            }
            else this.swr()
           
          },
        //   async searchOn(){
        //     const res = await this.callApi('get',`user/EmployeeAttendance?date=${this.today}&str=${this.search}`)
        //     if(res.status == 200){
        //         this.attendance = res.data
        //     }
        //     else this.swr()
           
        //   },
        //   changeAll(){

		// 	for(let d of this.employee){
		// 		d.isSelected = this.checkAll
		// 	  }
        //    },
           async OutingSubmit(){
               
            if(this.outingData.entry_time == '') return this.i("Entry time Name is Empty!")
            if(this.outingData.leave_time == '') return this.i("Leave time Name is Empty!")
            if(this.outingData.duration == '') return this.i("Duration is Empty!")
            if(this.outingData.reason == '') return this.i("Reason is Empty!")
            this.outingData.employee_id=this.outingItem.item.employee_id
            this.outingData.attendance_id=this.outingItem.item.id
            const res = await this.callApi('post','user/extraOuting',this.outingData)
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
        //    async outingDeleted(item,index){
            
        //     const res = await this.callApi('delete','extraOuting',{id:item.id})
        //     if(res.status == 200){
        //         this.s(' ExtraOuting have been successfully deleted!')

        //         this.attendance[this.outingItem.index].outings.splice(index,1)
                
        //     }
        //     else{
        //         this.swr()
        //     }

        //   },
        //    async add_people(){
        //     if(this.today == '') return this.i("Current date is Empty!")
        //     if(this.employee == '') return this.i("employee is Empty!")
        //     let ob={
        //         current_date : this.today,
        //         employee : this.employee

        //     }
        //     const res = await this.callApi('post','Attendance',ob)
        //     if(res.status == 200){
        //         this.s(' Attendance have been successfully added!')
        //         console.log(res.data)
        //         this.attendance = (res.data)
        //         this.today == ''
        //         // this.form.employee_id = ''
                
        //     }
        //     else{
        //         this.swr()
        //     }

        //   },
        //   async updateAttendance(){
        //     if(this.editData.leave_time){
        //         const date3 = new Date("01/01/2007 "+ this.editData.entry_time);
        //         const date4 = new Date("01/01/2007 "+ this.editData.leave_time);

        //         const diffTime = Math.abs(date4 - date3);
        //         let diffDays = Math.ceil(diffTime / (1000 * 60)); 
        //         diffDays = diffDays - this.editData.duration_of_break
               
        //         this.editData.total_in_time  = diffDays
        //         this.editData.total_out_time = this.editData.duration_of_break
        //         if(this.editData.outings.length > 0){
        //             for(let d of this.editData.outings){
        //                 this.editData.total_in_time -= d.duration
                        
        //                 this.editData.total_out_time = parseInt(this.editData.total_out_time) + parseInt(d.duration)
        //             }
        //         }
                
        //     }

        //     delete this.editData.employee
        //     delete this.editData.outings
        //     const res = await this.callApi('put','Attendance',this.editData)
        //     if(res.status == 200){
        //         this.attendance[this.editIndex] = res.data 
        //         this.s("Attendance Updated  !")
        //         this.editData = {} 
        //         this.editIndex = -1
        //         this.isEdit = false
        //     }
        //     else{
        //         this.swr();
        //     }
        // },
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
       
        
        async created(){
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();

            today =  yyyy + '-' + mm + '-' + dd ;
            this.today = today

            let [res1] = await Promise.all([
               
                this.callApi('get',`user/EmployeeAttendance`),
            ]);
            if(res1.status == 200){
                
                this.attendance = res1.data
                
            }
           
        },
        
	}
</script>
