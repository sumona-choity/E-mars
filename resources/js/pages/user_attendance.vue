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
                <div class="col-md-3 table_12">
                    <p class="list_p1">Day</p>
                </div>
                <div class="col-md-6 table_13" >
                    <p class="list_p2">{{attendance.current_date}}</p>
                </div>
            </div>
            <div class="row table_1">
                <div class="col-md-3 table_12">
                    <p class="list_p1">Entry time</p>
                </div>
                <div class="col-md-6 table_13" >
                    <p class="list_p2">{{attendance.entry_time}}</p>
                </div>
            </div>
            <div class="row table_1">
                <div class="col-md-3 table_12">
                    <p class="list_p1">Break Start</p>
                </div>
                <div class="col-md-6 table_13" >
                    <p class="list_p2">{{attendance.break_start}}</p>
                </div>
            </div>
            <div class="row table_1">
                <div class="col-md-3 table_12">
                    <p class="list_p1">Break End</p>
                </div>
                <div class="col-md-6 table_13" >
                    <p class="list_p2">{{attendance.break_end}}</p>
                </div>
            </div>
            <div class="row table_1">
                <div class="col-md-3 table_12">
                    <p class="list_p1">Duration of break</p>
                </div>
                <div class="col-md-6 table_13" >
                    <p class="list_p2">{{attendance.duration_of_break}} Minutes</p>
                </div>
            </div>
            <div class="row table_1">
                <div class="col-md-3 table_12">
                    <p class="list_p1">Leave time</p>
                </div>
                <div class="col-md-6 table_13" >
                    <p class="list_p2">{{attendance.leave_time}}</p>
                </div>
            </div>
            <div class="row table_1">
                <div class="col-md-3 table_12">
                    <p class="list_p1">No. of Outing</p>
                </div>
                <div class="col-md-6 table_13" >
                     <Button type="primary" @click="outingViewModalOn">View</Button>
                </div>
            </div>
            <div class="row table_1">
                <div class="col-md-3 table_12">
                    <p class="list_p1">Estimate leave time</p>
                </div>
                <div class="col-md-6 table_13" >
                    <p class="list_p2"> {{attendance | esLeaveTime}}</p>
                </div>
            </div>
            <div class="row table_1">
                <div class="col-md-3 table_12">
                    <p class="list_p1">Total in time</p>
                </div>
                <div class="col-md-6 table_13" >
                    <p class="list_p2"> {{attendance.total_in_time | formatTime}}</p>
                </div>
            </div>
            <div class="row table_1">
                <div class="col-md-3 table_12">
                    <p class="list_p1">Total Out time</p>
                </div>
                <div class="col-md-6 table_13" >
                    <p class="list_p2"> {{attendance.total_out_time | formatTime}}</p>
                </div>
            </div>
            <div class="row table_1">
                <div class="col-md-3 table_12">
                    <p class="list_p1">Score</p>
                </div>
                <div class="col-md-6 table_13" >
                    <p class="list_p2">{{attendance.score}} </p> 
                </div>
            </div>
        </div>
        <!---==== right side attendance list END ===--->
        <!---=== right side content END ===---->
        

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
              attendance:{},
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
          outingViewModalOn(){
              this.outingItem.item = _.clone(this.attendance)
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
        },
        async created(){
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();

            today =  yyyy + '-' + mm + '-' + dd ;
            this.today = today

            let [res1] = await Promise.all([
               
                this.callApi('get',`user/EmployeeAttendance?date=${this.today}`),
            ]);
            if(res1.status == 200){
                
                this.attendance = res1.data
                
            }
           
        },
        
	}
</script>
