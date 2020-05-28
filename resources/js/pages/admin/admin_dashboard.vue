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
                                    <Option value=""> May</Option>
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
                                <i-circle :percent="87">
                                    <span class="demo-Circle-inner" style="font-size:24px">87%</span>
                                </i-circle>
                            </div>
                            <div class="d_card_bottom_right">
                                <p class="d_card_p1">95%</p>
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
                                <p class="d_card_p1">Average Ranking</p>
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
                                <i-circle :percent="90">
                                    <span class="demo-Circle-inner" style="font-size:24px">2</span>
                                </i-circle>
                            </div>
                            <div class="d_card_bottom_right">
                                <p class="d_card_p1">4th</p>
                                <p class="d_card_p2">Today's Rank</p>
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
                                <th>No.</th>
                                <th>Project Name</th>
                                <th>Start Date</th>
                                <th>Deadline Date</th>
                                <th>Total Time</th>
                                <th>Status</th>
                                <th>Progress</th>
                                <!-- <th>Score</th> -->
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
                                    <template>
                                        <Progress :percent="item|formatProgressparcent" :stroke-width="20" text-inside />
                                    </template>
                                    
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
<!-- 









            <div class="table_list"> 
                <div class="row table_1">
                    <div class="col-md-3 col-3">
                        <p class="list_p1">Project Name</p>
                    </div>
                    <div class="col-md-2 col-2">
                        <p class="list_p1">Start Date</p>
                    </div>
                    <div class="col-md-2 col-2">
                        <p class="list_p1">Deadline date</p>
                    </div>
                    <div class="col-md-2 col-2">
                        <p class="list_p1">Total time</p>
                    </div>
                    <div class="col-md-1 col-1">
                        <p class="list_p1">Status</p>
                    </div>
                    <div class="col-md-2 col-2">
                        <p class="list_p1">Score</p>
                    </div>
                </div>

                
                    <div class="row table_2" v-for="(item,index) in projects" :key="index">
                        <div @click="$router.push(`/admin/project_details/${item.id}`)" class="col-md-3 col-3">
                            <p class="list_p1">{{item.project_name}}</p>
                        </div>
                        <div class="col-md-2 col-2">
                            <p class="list_p1">{{item.start_date}}</p>
                        </div>
                        <div class="col-md-2 col-2">
                            <p class="list_p1">{{item.deadline_date}}</p>
                        </div>
                        <div class="col-md-2 col-2">
                            <p class="list_p1">{{item.duration}} hr</p>
                        </div>
                        <div class="col-md-1 col-1">
                            <div class="pro_btn_div">
                                <Button class="project_btn" size="small" type="info">{{item.status}}</Button>
                            </div>
                        </div>
                            <div class="col-md-2 col-2">
                            <p class="list_p1">147.5</p>
                        </div>
                    </div>

                
            </div> -->
        </div>
        <!---=== table right side END ====---->
                           
    </div>
</template>

<script>
	export default {
	  data(){
          return{
              
              projects:[],
              
          }
      },
      methods:{
          
        
        async all_Projects(){
                const res = await this.callApi('get','project')
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