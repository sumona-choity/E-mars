<template>
    <div>
         <!---=== Dashboard top card ===--->
        <div class="row right_row1">
            <div class="top_div">
                <div class="top_left">
                    <p class="task_p">All Assigned Task</p>
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
        <!---=== Dashboard top card END ===--->
        <div class="row justify-content-center">
            
            <div class="col-md-4">
                <div class="designation">
                       <Select v-model="str_p" @on-change="all_assignTask" filterable>
                            <Option  value="All" >All Projects</Option>
                            <Option  v-for="(item,index) in projects" :value="item.id" :key="index" >{{item.project_name}}</Option>
                            
                        </Select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="designation">
                       <Select v-model="str_e" @on-change="all_assignTask" filterable>
                            <Option  value="All" >All Employee</Option>
                            <Option  v-for="(item,index) in employees" :value="item.id" :key="index" >{{item.name}}</Option>
                            
                        </Select>
                </div>
            </div>
        </div>
        
        <!---=== row list attendance END ===---->
            
        <div class="table_list" v-for="(dateItem,dateIndex) in assignTask " :key="dateIndex" > 
             
            <div class="row justify-content-between">
                <div class="col-md-12">
                    <div class="date_list">      
                        <div class="row justify-content-between">
                            <div class="col-md-4 list_p1 date_header ">{{dateItem.group}} - {{ dateItem.group | dayName}}</div>
                            <div class="col-md-4 list_p1 date_header " v-if="str_e != 'All'"> Time Worked = {{dateItem.task | totalCountedTime}} Hours</div>
                            <div class="col-md-4 list_p1 date_header " v-if="str_e != 'All'"> Time letf = {{dateItem.task | totalUnCountedTime}} Hours</div>
                        </div>        
                        <!-- <p class="list_p1 date_header"></p> -->
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
                                    <th>Employee name</th>
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
                                    <td  >
                                        <p>{{item.employee.name}}</p>
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
        <div class="_table_all" v-for="(dateItem,dateIndex) in 10 " :key="dateIndex">
            <h1>Hi</h1>
        </div>
       
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
                <div class="pro_left_input" v-if="employees.length>0"> 
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
              isLoading:true,
              detail_modal: false,
            //   viewPause_modal: false,
              showdataIndex:-1,
              view:{
                item:{},
                index:-1, 
            },
            viewlModal:false,
              showdata:{},
            //   viewPause:{},
              search:'',
              str_p:'All',
              str_e:'All',
              status:'All',
              edit_modal: false,
              add_modal:false,
              edit_data: {},
              editIndex:-1,
              assignTask:[],
              employees:[],
              projects:[],
              form:{
                  project_id:'',
                  employee_id:'',
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
            this.view.item = item
            this.view.index = this.showdataIndex
            this.viewlModal = true;
        },
        
        viewDetail (item) {
            this.showdata = item;
            this.detail_modal = true;
        },
        async all_assignTask(){
            const res = await this.callApi('get',`taskListByEmployeeAndProject?status=${this.status}&project_id=${this.str_p}&employee_id=${this.str_e}`)
            if(res.status == 200){
                const task = Object.values(res.data)
                const group = Object.keys(res.data)
                this.assignTask = [];
                for(let i in task){
                    let ob ={
                        group:group[i],
                        task:task[i]
                    }
                    this.assignTask.push(ob)
                }
            }
        },
      },
      filters:{
          totalCountedTime(item){
              let total = 0;
              if(item.length>0){
                  for(let d of item){
                      total = parseInt(total) + parseInt(d.total_time)
                  }
              }
                
                

              return parseFloat(total/60).toFixed(2)
          },
          totalUnCountedTime(item){
               let total = 0;
              if(item.length>0){
                  for(let d of item){
                      total = parseInt(total) + parseInt(d.total_time)
                  }
              }

              return parseFloat((480-total)/60).toFixed(2)
          },
          dayName(item){
            let day =  new Date(item);
            var weekdays = new Array(7);
            weekdays[0] = "Sunday";
            weekdays[1] = "Monday";
            weekdays[2] = "Tuesday";
            weekdays[3] = "Wednesday";
            weekdays[4] = "Thursday";
            weekdays[5] = "Friday";
            weekdays[6] = "Saturday";

              return weekdays[day.getDay()]
          }
      },
      async created(){
          let status = ['Running','Not Started']
         let [res1,res2,res3] = await Promise.all([
                this.callApi('get',`employee`),
                this.callApi('get',`project?status=${status}`),
                this.callApi('get',`taskListByEmployeeAndProject?status=${this.status}`),
            ]);
            if(res1.status == 200 && res2.status == 200 && res3.status == 200){
                this.employees = res1.data
                this.projects = res2.data
                const task = Object.values(res3.data)
                const group = Object.keys(res3.data)
                this.assignTask = [];
                for(let i in task){
                    let ob ={
                        group:group[i],
                        task:task[i]
                    }
                    this.assignTask.push(ob)
                }
                
            }
            this.isLoading = false
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
