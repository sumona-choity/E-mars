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
        <div class="row right_row1">
            <div class="top_div">
                <div class="top_left">
                    <p class="task_p">Employee Profile</p>
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
        <!---==== right side top button ===--->
        <div class="row justify-content-end">
            <div class="col-md-4">
                <div class="right_add_btn">
                    <Button type="primary" @click="add_Modal = true">Add Employee</Button>
                    <Modal v-model="add_Modal" title="Add New Employee" @on-ok="addItem" @on-cancel="add_Modal = false">
                        <div class="left_atten_card">
                            <div class="pro_left_input">
                                <div class="_1st_input_pro">
                                    <div class="left_name_pro">
                                        <span class="input_title">Name</span>
                                    </div>
                                    <div class="right_input_pro">
                                        <Input v-model="add_form.name" placeholder="Enter Employee Name" style="width: 100%"  />
                                    </div>
                                </div>
                            </div>
                            <div class="pro_left_input" v-if="designation.length>0">
                                <div class="_1st_input_pro">
                                    <div class="left_name_pro">
                                        <span class="input_title">Designation</span>
                                    </div>
                                    <div class="right_input_pro">
                                        <Select v-model="add_form.designation_id" style="width:100%">
                                            <Option v-for="(item,index) in designation" :key="index" :value="item.id">{{item.name}}</Option>
                                        </Select>
                                    </div>
                                </div>
                            </div>
                            <div class="pro_left_input">
                                <div class="_1st_input_pro">
                                    <div class="left_name_pro">
                                        <span class="input_title">Email</span>
                                    </div>
                                    <div class="right_input_pro">
                                        <Input v-model="add_form.email" placeholder="Email" style="width: 100%" />
                                    </div>
                                </div>
                            </div>
                            <div class="pro_left_input">
                                <div class="_1st_input_pro">
                                    <div class="left_name_pro">
                                        <span class="input_title">Address</span>
                                    </div>
                                    <div class="right_input_pro">
                                        <Input v-model="add_form.address" placeholder="Address" style="width: 100%" />
                                    </div>
                                </div>
                            </div>
                            <div class="pro_left_input">
                                <div class="_1st_input_pro">
                                    <div class="left_name_pro">
                                        <span class="input_title">Phone</span>
                                    </div>
                                    <div class="right_input_pro">
                                        <Input v-model="add_form.phone" placeholder="Phone" style="width: 100%" />
                                    </div>
                                </div>
                            </div>
                            <div class="pro_left_input">
                                <div class="_1st_input_pro">
                                    <div class="left_name_pro">
                                        <span class="input_title">Password</span>
                                    </div>
                                    <div class="right_input_pro">
                                        <Input v-model="add_form.password" placeholder="Password" style="width: 100%" />
                                    </div>
                                </div>
                            </div>

                        </div>
                    </Modal>
                </div>
            </div>
        </div>
        <!---==== right side top button END ===--->

        <!----=== Employee List ====---->
        <div class="emp_list">
            <div class="row">
                <!----=== Employee List table ====---->
                <div class="col-md-6 emp_table" v-for="(des,index) in designation" :key="index">
                    <div class="emp_head">
                        <p class="table_head_p">{{des.name}}</p>
                    </div>
                    <div class="row table_1">
                        <div class="col-md-4 col-">
                            <p class="list_p2">Employee Name</p>
                        </div>
                        <div class="col-md-4 col-4">
                            <p class="list_p2">Email</p>
                        </div>
                        <div class="col-md-4 col-4">
                            <p class="list_p2">Phone</p>
                        </div>
                    </div>
                    
                    
                        <div class="row table_2" v-for="(item,indi) in employee" :key="indi" v-if="item.designation_id==des.id" >
                            <div class="col-md-4 col-4">
                                <p @click="$router.push(`/admin/emp_details/${item.id}`)" class="list_p2">{{item.name}}</p>
                            </div>
                            <div class="col-md-4 col-4">
                                <p class="list_p2">{{item.email}}</p>
                            </div>
                            <div class="col-md-4 col-4">
                                <p class="list_p2">{{item.phone}}</p>
                            </div>
                        </div>
                    
                    
                </div>
            </div>
        </div>
        <!----=== Employee List END ====---->
    </div>
</template>

<script>
	export default {
	  

      data(){
          return{
              add_Modal: false,
              edit_Modal: false,
              employee:[],
              search:'',
              designation:[],
              add_form:{
                  name:'',
                  designation_id:0,
                  email:'',
                  phone:'',
                  address:'',
                  password:'',
              },
              edit_form:{
                  name:'',
                  designation_id:0,
                  email:'',
                  phone:'',
                  address:'',
                  password:'',
              }
          }
      },
        methods: {
            async addItem(){
                if(this.add_form.name=='') return this.i("Employee name can not be empty")
                if(this.add_form.designation_id=='') return this.i("Employee designation can not be empty")
                if(this.add_form.email=='') return this.i("Employee email can not be empty")
                if(this.add_form.address=='') return this.i("Employee address can not be empty")
                if(this.add_form.phone=='') return this.i("Employee phone can not be empty")
                const res = await this.callApi('post','employee',this.add_form)
                if(res.status == 200){
                    this.s('Employee have been added successfully')
                    this.employee.push(res.data)
                    this.add_form.name = ''
                    this.add_form.email = ''
                    this.add_form.address = ''
                    this.add_form.phone = ''
                }
                else{
                    this.swr()
                }
            },
            async all_employee_profile(){
                const res = await this.callApi('get','employee')
                if(res.status == 200){
                    this.employee = res.data
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
            this.all_employee_profile();
            let res = await this.callApi('get','designation')
            if(res.status == 200){
                this.designation = res.data
            }
            else this.swr()
        }
	}
</script>