<template>
    <div>
        
        <!---=== Dashboard top card ===--->
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
                                        <span class="demo-Circle-inner" style="font-size:24px">{{presence|attendanceParcent}} % </span>
                                    </i-circle>
                                </div>
                                <div class="d_card_bottom_right">
                                    <p class="d_card_p1">{{presence|attendanceParcent}}</p>
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
        <!---=== Dashboard top card END ===--->
        <div class="table_div">
            <div class="table_head">
                <p class="table_head_p">Project and task statistics</p>
            </div>
        <!---=== table right side ====---->
            <div class="_table_all">
                <div class="_table_main">
                    <table class="_1table"> 
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Project Name</th>
                                    <th>Start Date</th>
                                    <th>Deadline date</th>
                                    <th>Total time</th>
                                    <th>Status</th>
                                    <th>Progress</th>
                                    <!-- <th>Score</th> -->
                                </tr>
                            </thead>
                        
                            <tbody>
                                <tr v-for="(item,index) in projects" :key="index">
                                    <td>
                                        <p>{{item.projects.id}}</p>
                                    </td>
                                    <td @click="$router.push(`/user_project_details/${item.projects.id}`)">
                                        <p>{{item.projects.project_name}}</p>
                                    </td>                                                                                                       
                                    <td>
                                        <p>{{item.projects.start_date}}</p>
                                    </td>
                                    <td>
                                        <p>{{item.projects.deadline_date}}</p>
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
                                    <!-- <td>
                                        <p>{{147.5}}</p>
                                    </td> -->
                                </tr>
                            </tbody>
                    </table>
                <!---=== row list attendance END ===---->
                </div>
            </div>
            
        </div>
            <!---=== table right side END ====---->
                           
    </div>
</template>

<script>
	export default {
	  data(){
          return{
              
              projects:[],
              date1:'',
              date2:'',
              presence:0,
              totalTasTimekDone:0,
          }
      },
      methods:{
          
        async changeDateTime(date){
                
                const res = await this.callApi('get',`singleEmployee/${this.$route.params.id}?date=${date}`)
                if(res.status === 200){
                   this.totalTasTimekDone = res.data.totalTasTimekDone
                }
                else this.swr()
            }
        
        
      },
      async created(){
            const todayDate = new Date();
            let year=  todayDate.getFullYear();
            let month = todayDate.getMonth()+1;
            var days = new Date( year,month,0 ).getDate();
            console.log(days);
            const LastFridayDate = new Date();
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
            console.log("ok okk");
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
            
            let date1=start.getFullYear()+'-'+(start.getMonth()+1)+'-'+start.getDate();
            this.date1 = date1
            console.log(date1);
            let date2=end.getFullYear()+'-'+(end.getMonth()+1)+'-'+end.getDate();
            this.date2 = date2
            console.log(date2);

          let [res1,res2,res3] = await Promise.all([
                this.callApi('get','userDashboardproject'),
                this.callApi('get',`getMonthAbsent?pre_month=${date1}&current_month=${date2}&fridayCount=${fridayCount}&days=${days}`),
                this.callApi('get',`singleEmployee?date=${date2}`),
            ]);
            if(res1.status == 200){
                this.projects = res1.data
                this.presence = res2.data.presence
                this.totalTasTimekDone = res3.data.totalTasTimekDone
            }
        }
	}
</script>