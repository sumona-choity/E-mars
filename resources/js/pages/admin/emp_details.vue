<template>
    <div>
          <div class="dash_card">
            <div class="row">
                <!---=== Dashboard top 1st card ===--->             
                <div class="col-md-4">
                    <div class="d_card">
                        <div class="d_card_top">
                            <div class="d_card_left">
                                <p class="d_card_p1">Average score</p>
                            </div>
                            <div class="d_card_right">
                                <Select style="width:70px">
                                    <Option value="">Jan</Option>
                                    <Option value="">Feb</Option>
                                    <Option value="">Mar</Option>
                                    <Option value="">Apr</Option>
                                    <Option value="">May</Option>
                                    <Option value="">Jun</Option>
                                    <Option value="">Jul</Option>
                                    <Option value="">Aug</Option>
                                    <Option value="">Sep</Option>
                                    <Option value="">Oct</Option>
                                    <Option value="">Nov</Option>
                                    <Option value="">Dec</Option>
                                </Select>
                            </div>
                        </div>

                        <div class="d_card_bottom">
                            <div class="d_card_bottom_left">
                                <i-circle :percent="80">
                                    <span class="demo-Circle-inner" style="font-size:24px">147.9</span>
                                </i-circle>
                            </div>
                            <div class="d_card_bottom_right">
                                <p class="d_card_p1">130.7</p>
                                <p class="d_card_p2">Today's score</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!---=== Dashboard top 1st card END ===--->  

                <!---=== Dashboard top 2nd card ===--->  
                <div class="col-md-4">
                        <div class="d_card">
                        <div class="d_card_top">
                            <div class="d_card_left">
                                <p class="d_card_p1">Attendance (%)</p>
                            </div>
                            <div class="d_card_right">
                                <Select style="width:70px">
                                    <Option value="">Jan</Option>
                                    <Option value="">Feb</Option>
                                    <Option value="">Mar</Option>
                                    <Option value="">Apr</Option>
                                    <Option value="">May</Option>
                                    <Option value="">Jun</Option>
                                    <Option value="">Jul</Option>
                                    <Option value="">Aug</Option>
                                    <Option value="">Sep</Option>
                                    <Option value="">Oct</Option>
                                    <Option value="">Nov</Option>
                                    <Option value="">Dec</Option>
                                </Select>
                            </div>
                        </div>

                        <div class="d_card_bottom">
                            <div class="d_card_bottom_left">
                                <i-circle :percent="presence|attendanceParcent">
                                    <span class="demo-Circle-inner" style="font-size:24px">{{presence|attendanceParcent}}%</span>
                                </i-circle>
                            </div>
                            <div class="d_card_bottom_right">
                                <p class="d_card_p1">{{presence|attendanceParcent}}%</p>
                                <p class="d_card_p2">This month</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!---=== Dashboard top 2nd card END ===---> 

                <!---=== Dashboard top 3rd card ===--->   
                <div class="col-md-4">
                        <div class="d_card">
                        <div class="d_card_top">
                            <div class="d_card_left">
                                <p class="d_card_p1">Today Hours Done</p>
                            </div>
                            <div class="d_card_right">
                                
                                <DatePicker type="date"  placeholder="Select date" @on-change="changeDateTime" style="width:100px"></DatePicker>
                            </div>
                        </div>

                        <div class="d_card_bottom">
                            <div class="d_card_bottom_left">
                                <i-circle :percent="totalTasTimekDone | workingParcent">
                                    <span class="demo-Circle-inner" style="font-size:24px">{{ totalTasTimekDone |workingParcent}}%</span>
                                </i-circle>
                            </div>
                            <div class="d_card_bottom_right">
                                <p class="d_card_p1">{{totalTasTimekDone}} Minutes</p>
                                <p class="d_card_p2">{{date2}}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!---=== Dashboard top 3rd card END ===--->     

            </div>
        </div>      
        <div>
        <!---==== right side top options ===--->
        <div class="row justify-content-center"> 
            <div class="col-md-2" @click="tab = 0">
                <p  class="emp_p" :class="(tab==0)? 'emp_p_active' : ''">All</p>
            </div>
            <div class="col-md-2" @click="tab = 1">
                <p  class="emp_p" :class="(tab==1)? 'emp_p_active' : ''">{{employees.name}}</p>
            </div>
            <div class="col-md-2"  @click="tab = 5">
                <p class="emp_p" :class="(tab==5)? 'emp_p_active' : ''">All Projects</p>
            </div>
            <div class="col-md-2"  @click="tab = 2">
                <p class="emp_p" :class="(tab==2)? 'emp_p_active' : ''">All Task</p>
            </div>
            <div class="col-md-2"  @click="tab = 4">
                <p class="emp_p" :class="(tab==4)? 'emp_p_active' : ''">Task Details</p>
            </div>
            <div class="col-md-2"  @click="tab = 3">
                <p class="emp_p" :class="(tab==3)? 'emp_p_active' : ''">Attendance History</p>
            </div>
        </div>
        <!---==== right side top options END ===--->  


        <!---==== right side top button ===--->
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="calender">                     
                    <DatePicker type="daterange" :options="options2" placeholder="Select date" @on-change="changeDate" style="width: 100%"></DatePicker>
                </div>
            </div>
            <div class="col-md-6 ml-0">
                <div class="calender">                     
                     <Select v-model="status" style="width:100%" @on-change="all_TasksByStatus">
                            <Option  value="All" >All</Option>
                            <Option  value="Not Started" >Not Started</Option>
                            <Option  value="Running" >Running</Option>
                            <Option  value="Pause" >Pause</Option>
                            <Option  value="Completed" >Completed</Option>
                        </Select>
                </div>
            </div>
        </div>
        <!---==== right side top button END ===---> 

        <!---=== table right side ====---->
        <div class="row right_row2 justify-content-center" v-if="tab == 1 || tab== 0">
            <div class="task_body col-10">
                <div class="_1st_input">
                    <div class="left_name">
                        <span class="input_title">Full Name</span>
                    </div>
                    <div class="right_input">
                        <p class="list_p2">{{employees.name}}</p>
                    </div>
                </div>
                    <div class="_1st_input">
                    <div class="left_name">
                        <span class="input_title">Phone Number</span>
                    </div>
                    <div class="right_input">
                        <p class="list_p2">{{employees.phone}}</p>
                    </div>
                </div>
                <div class="_1st_input">
                    <div class="left_name">
                        <span class="input_title">Address</span>
                    </div>
                    <div class="right_input">
                        <p class="list_p2">{{employees.address}}</p>
                    </div>
                </div>
                <div class="_1st_input">
                    <div class="left_name">
                        <span class="input_title">Email</span>
                    </div>
                    <div class="right_input">
                        <p class="list_p2">{{employees.email}}</p>
                    </div>
                </div>
                <div class="_1st_input">
                    <div class="left_name">
                        <span class="input_title">Absent</span>
                    </div>
                    <div class="right_input">
                        <p class="list_p2">{{employees.name}} is absent {{ab}} Days within {{day}} Days({{date1}} - {{date2}})</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- <div class="_table_all">
                <div class="_table_main">
                    <table class="_1table">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Project Name</th>
                                <th>Task name</th>
                                <th>Description</th>
                                <th>Estimated Time</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item,index) in projects" :key="index">
                                <td>
                                    <p>{{index+1}}</p>
                                </td>
                                <td>
                                    <p @click="$router.push(`/admin/project_details/${item.id}`)">{{item.project_name}}</p>
                                </td>
                                <td>
                                    <p>{{item.start_date}}</p>
                                </td>
                                <td>
                                    <p>{{item.deadline_date}}</p>
                                </td>
                                <td>
                                    <p>{{item.duration}} hr</p>
                                </td>
                                <td>
                                    <Button class="project_btn" size="small" type="info">{{item.status}}</Button>
                                </td>
                                <td>
                                    <p>147.5</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div> -->
        <div class="_table_all" v-if="tab == 2 || tab== 0" >
            <h1 class="justify-content-center text-center" >All Tasks By Projects</h1>
            <div>
                 <div class="_table_main" v-for="(item,index) in allTasks" :key="index" v-if="item.tasks.length>0" >
                 <table class="_1table"> 
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Project Name</th>
                                <th>Task name</th>
                                <th>Description</th>
                                <th>Estimated Time</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                    
                        <tbody>
                            <tr v-for="(taskItem,taskIndex) in item.tasks" :key="taskIndex">
                                <td>
                                    <router-link to="/task_list"><p>{{taskItem.id}}</p></router-link>
                                </td>
                                <td>
                                    <router-link to="/task_list"><p>{{item.projects.project_name}}</p></router-link>
                                </td>
                                <td>
                                    <router-link to="/task_list"><p>{{taskItem.task_name}}</p></router-link>
                                </td>
                                <td>
                                    <router-link to="/task_list"><p>{{taskItem.description}}</p></router-link>
                                </td>
                                <td>
                                    <router-link to="/task_list"><p>{{taskItem.estimated_time}}</p></router-link>
                                </td>
                                <td>
                                    <router-link to="/task_list"><p>{{taskItem.status}}</p></router-link>
                                </td>
                            </tr>
                        </tbody>
                
                </table>
            </div>
            </div>
            
        </div>
        <div class="_table_all" v-if="tab == 5 || tab== 0" >
            <h1 class="justify-content-center text-center" >All  Projects</h1>
            <div>
                 <div class="_table_main"  >
                 <table class="_1table"> 
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Project Name</th>
                                <th>total Task</th>
                                <th>Duration</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                    
                        <tbody>
                            <tr v-for="(item,index) in allTasks" :key="index" >
                                <td>
                                    <router-link :to="`/admin/task_list?project_id=${item.projects.id}&employee_id=${$route.params.id}`"><p>{{item.id}}</p></router-link>
                                </td>
                                <td>
                                    <router-link :to="`/admin/task_list?project_id=${item.projects.id}&employee_id=${$route.params.id}`"><p>{{item.projects.project_name}}</p></router-link>
                                </td>
                               
                                <td>
                                    <router-link :to="`/admin/task_list?project_id=${item.projects.id}&employee_id=${$route.params.id}`"><p>{{item.tasks.length}}</p></router-link>
                                </td>
                                <td>
                                    <router-link :to="`/admin/task_list?project_id=${item.projects.id}&employee_id=${$route.params.id}`"><p>{{item.projects.duration}}</p></router-link>
                                </td>
                                <td>
                                    <router-link :to="`/admin/task_list?project_id=${item.projects.id}&employee_id=${$route.params.id}`"><p>{{item.projects.status}}</p></router-link>
                                </td>
                            </tr>
                        </tbody>
                
                </table>
            </div>
            </div>
            
        </div>
       
        <!---=== table right side END ====---->
        </div>

        <!---=== right side attendance list ==--->

        <div class="_table_all" v-if="tab == 3 || tab== 0"> 
            <h1 class="justify-content-center text-center" >Attendance</h1>
            <div class="_table_main">
                <table class="_1table"> 
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Date</th>
                                <th>Entry time</th>
                                <th>Break Start</th>
                                <th>Break End</th>
                                <th>Duration of break</th>
                                <th>Leave time</th>
                                <th>Estimated Leave time</th>
                                <th>No. of Outing</th>
                                <th>Total in time</th>
                                <th>Total Out time</th>
                            </tr>
                        </thead>
                    
                        <tbody>
                            <tr v-for="(item,index) in EmployeeAttendance" :key="index">
                                <td>
                                    <p>{{item.id}}</p>
                                </td>
                                <td>
                                    <p>{{item.current_date}}</p>
                                </td>
                                <td>
                                    <p>{{item.entry_time}}</p>
                                </td>
                                <td>
                                    <p>{{item.break_start}}</p>
                                </td>
                                <td>
                                    <p>{{item.break_end}}</p>
                                </td>
                                <td>
                                    <p>{{item.duration_of_break}}</p>
                                </td>
                                <td>
                                    <p>{{item.leave_time}}</p>
                                </td>
                                <td>
                                    <p>{{item | esLeaveTime}}</p>
                                </td>
                                <td>
                                    <Button type="primary" @click="outingViewModalOn(item,index)">View</Button>
                                </td>
                                <td>
                                    <p>{{item.total_in_time|formatTime}}</p>
                                </td>
                                <td>
                                    <p>{{item.total_out_time|formatTime}}</p>
                                </td>
                            </tr>
                        </tbody>
                </table>
            <!---=== row list attendance END ===---->
            </div>
        </div>
        <!---==== right side attendance list END ===--->

        <div class="_table_all"  v-if="tab == 4 || tab== 0"> 
            <h1 class="justify-content-center text-center" >Task Detail</h1>
            <div class="_table_main">
                <table class="_1table">
                    <thead>
                        <tr>
                            <th>
                                <p>Id</p>
                            </th>
                            <th>
                                <p>Project Name</p>
                            </th>
                            <th>
                                <p>Task name</p>
                            </th>
                            <th>
                                <p>Description</p>
                            </th>
                            <th>
                                <p>Estimated Time</p>
                            </th>
                            <th>
                                <p>Status</p>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(item,index) in task" :key="index">
                            <td>
                                <p>{{item.id}}</p>
                            </td>
                            <td>
                                <p v-if="item.projects">{{item.projects.project_name}}</p>
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
                                <p>{{item.status}}</p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>


        <!---=== Modal ====-->
        <Modal v-model="outingViewModal" title="Extra Outing" @on-ok="outingViewModal = false" @on-cancel="outingViewModal = false">
            <div class="outing_list">
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
                    <div class="col-md-4">
                        <p class="list_p2">Reason</p>
                    </div>
                    <div class="col-md-4">
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
                    <div class="col-md-4">
                            <p class="list_p1">{{item.reason}}</p>
                    </div>
                    <div class="col-md-4">
                                <Button type="error" @click="outingDeleted(item,index)" >Delete</Button>
                    </div>
                </div>
            </div>
        </Modal>
        <!----==== Modal END ===---->
    </div>
</template>

<script>
	

	export default {
      data(){
          return{
              tab:0,
              totalTasTimekDone:0,
              date1:'',
              date2:'',
              status:'All',
              outingViewModal:false,
              outingItem:{
                  item:'',
                  index:'',
              },
              date:'',
              employees:{},
              projects:[],
              task:[],
              allTasks:[],
              EmployeeAttendance:[],
              presence:0,
              ab:0,
              day:0,
              options2: {
                shortcuts: [
                    {
                        text: '1 week',
                        value () {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
                            return [start, end];
                        }
                    },
                    {
                        text: '1 month',
                        value () {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
                            return [start, end];
                        }
                    },
                    {
                        text: '3 months',
                        value () {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
                            return [start, end];
                        }
                    }
                ]
            },
          }
      },
      methods: {
          outingViewModalOn(item,index){ 
              this.outingItem.item = _.clone(item)
              this.outingItem.index = index
              this.outingViewModal = true
          },
            ok () {
                this.$Message.info('Clicked ok');
            },
            cancel () {
                this.$Message.info('Clicked cancel');
            },
            async changeDate(k){
                 if(!k[0]) return
                this.date1 = k[0]
                this.date2 = k[1]
                
                const res = await this.callApi('get',`getSingleEmployeeStats/${this.$route.params.id}?date1=${k[0]}&date2=${k[1]}&status=${this.status}`)
                if(res.status === 200){
                    this.task = res.data.AssignTask
                    this.EmployeeAttendance = res.data.EmployeeAttendance
                }
                else this.swr()

               
                
            },
            async all_TasksByStatus(){
                
                const res = await this.callApi('get',`getSingleEmployeeStats/${this.$route.params.id}?date1=${this.date1}&date2=${this.date2}&status=${this.status}`)
                if(res.status === 200){
                    this.task = res.data.AssignTask
                    this.EmployeeAttendance = res.data.EmployeeAttendance
                }
                else this.swr()
            },
            async changeDateTime(date){
                
                const res = await this.callApi('get',`singleEmployee/${this.$route.params.id}?date=${date}`)
                if(res.status === 200){
                   this.totalTasTimekDone = res.data.totalTasTimekDone
                }
                else this.swr()
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
           
            // var sundays = [ 6 - (new Date( 11 +'/01/'+ 2019 ).getDay()) ];
            // console.log(sundays);
            // for ( var i = sundays[0] + 7; i < days; i += 7 ) {
            //     sundays.push( i );
            // }
            // console.log(sundays);
            // let fridayCount = 0;
            const todayDate = new Date();
            let year=  todayDate.getFullYear();
            let month = todayDate.getMonth()+1;
            // let day = todayDate.getDay();
             var days = new Date( year,month,0 ).getDate();
            console.log(days);
            // console.log(day);
            // var dt = todayDate.setDate(1);
            // console.log(dt);
            // const now = new Date();
            const LastFridayDate = new Date();
            // let last30days = new Date(now.setDate(now.getDate() - 30))
            // console.log(last30days);
            // for(let i = 1 ; i <= 30 ; i++){
            //     while (LastFridayDate[i].getDay() != 5){
            //         LastFridayDate[i].setDate(LastFridayDate[i].getDate()-1);
            //     }
            //     fridayCount=fridayCount+LastFridayDate[i];
            // }
            // console.log(fridayCount);
            // console.log(LastFridayDate);
            // LastFridayDate.setDate(LastFridayDate.getDate()-1);
            let fridayCount = 0
              for(let i = 1 ; i <= days ; i++){

                if (LastFridayDate.getDay() == 5){
                    fridayCount++;
                    console.log("I am firnday");
                }
                LastFridayDate.setDate(LastFridayDate.getDate()-1);
            }
            console.log(fridayCount)
           
            // Friday = 5
            
            const end = new Date();
            // console.log(end);
            // end.setDate(end.getDate() + (7 - end.getDay())-2);
            // console.log(end);
            console.log("ok okk");
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
            
            let date1=start.getFullYear()+'-'+(start.getMonth()+1)+'-'+start.getDate();
            this.date1 = date1
            console.log(date1);
            let date2=end.getFullYear()+'-'+(end.getMonth()+1)+'-'+end.getDate();
            this.date2 = date2
            console.log(date2);
            let [res1,res2,res3,res4] = await Promise.all([
                this.callApi('get',`singleEmployee/${this.$route.params.id}?date=${date2}`),
                this.callApi('get',`getSingleEmployeeStats/${this.$route.params.id}?date1=${date1}&date2=${date2}`),
                this.callApi('get',`getMonthAbsent/${this.$route.params.id}?pre_month=${date1}&current_month=${date2}&fridayCount=${fridayCount}&days=${days}`),
                this.callApi('get',`allTaskByEmployee/${this.$route.params.id}`),
                
            ]);
            if(res1.status == 200){
                this.employees = res1.data.User
                this.totalTasTimekDone = res1.data.totalTasTimekDone
                this.projects = res1.data.AssignProject
                this.task = res2.data.AssignTask
                this.EmployeeAttendance = res2.data.EmployeeAttendance
                this.presence = res3.data.presence
                this.allTasks = res4.data
                this.ab = res3.data.ab
                this.day = res3.data.day
                
                
            }
           
        },
        
	}
</script>