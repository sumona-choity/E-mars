<template>
    <div>
        <div class="row right_row1">
            <div class="top_div">
                <div class="top_left">
                    <p class="task_p">Projects</p>
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
                    <Button @click="add_modal = true" type="info">Add New Project</Button>
                </div>
            </div>
        </div>

        <!---=== table right side ====---->
        
        <div class="_table_all"> 
            <div class="_table_main">
                <table class="_1table"> 
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Project name</th>
                                <th>Client Name</th>
                                <th>Starting Date</th>
                                <th>Deadline date</th>
                                <th>Duration</th>
                                <th>Status</th>
                                <th>Progress</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    
                        <tbody>
                            <tr v-for="(item,index) in projects" :key="index">
                                <td>
                                    <p>{{item.id}}</p>
                                </td>
                                <td  @click="$router.push(`/admin/project_details/${item.id}`)">
                                    <p>{{item.project_name}}</p>
                                </td>
                                <td>
                                    <p>{{item.client.name}}</p>
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
                                    <p>{{item.status}}</p>
                                </td>
                                <td>
                                    <template>
                                        <Progress :percent="item|formatProgressparcent" :stroke-width="20" text-inside />
                                        <!-- <Progress :percent="45" :stroke-width="20" status="active" text-inside />
                                        <Progress :percent="65" :stroke-width="20" status="wrong" text-inside />
                                        <Progress :percent="100" :stroke-width="20" text-inside /> -->
                                    </template>
                                    
                                </td>
                                <td>
                                    <div class="_button">
                                        <Button type="info" @click="edit_project(item,index)">Edit</Button>
                                        <Button @click="project_delete(item.id,index)" type="error">Delete</Button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                </table>
            </div>
        </div>
        <!---=== table right side END ====---->
        <!-- Add project  start modal -->
        <Modal
            v-model="add_modal"
            title="Add New Project"
            @on-ok="form_submmit"
            @on-cancel="add_modal = false">

            <div class="left_atten_card">
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Name</span>
                        </div>
                        <div class="right_input_pro">
                            <Input v-model="form.project_name" style="width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="pro_left_input" v-if="clients.length>0"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Client Name</span>
                        </div>
                        <div class="right_input_pro">
                            <Select v-model="form.client_id" style="width: 100%" >
                                <Option v-for="(item,index) in clients" :key="index" :value="item.id">{{item.name}}</Option>
                            </Select>
                        </div>
                    </div>
                </div>
                <!-- <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Status</span>
                        </div>
                        <div class="right_input_pro">
                            <Select size="large" v-model="form.project_status" style="width: 100%">
                                <Option v-for="(item,index) in project_status" :key="index" :value="item">{{item}}</Option>
                            </Select>
                        </div>
                    </div>
                </div> -->
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Starting Date</span>
                        </div>
                        <div class="right_input_pro">
                            <DatePicker type="date" format="yyyy-MM-dd" @on-change="addPsDate"   style="width: 100%"></DatePicker>
                            <!-- <Input v-model="form.start_date" style="width: 100%" /> -->
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Deadline Date</span>
                        </div>
                        <div class="right_input_pro">
                            <DatePicker type="date" format="yyyy-MM-dd" @on-change="addPeDate"  style="width: 100%"></DatePicker>
                            <!-- <Input v-model="form.deadline_date" style="width: 100%" /> -->
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Duration</span>
                        </div>
                        <div class="right_input_pro">
                            <Input disabled v-model="form.duration" style="width: 100%" > <span slot="append">Hours</span></Input>
                            
                        </div>
                    </div>
                </div>
            </div>
        </Modal>
        <!-- Add project modal end -->
        <!-- edit project  start modal -->
        <Modal
            v-model="edit_modal"
            title="Edit New Project"
            @on-ok="update_project"
            @on-cancel="edit_modal = false">

            <div class="left_atten_card">
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Name</span>
                        </div>
                        <div class="right_input_pro">
                            <Input v-model="edit_data.project_name" style="width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="pro_left_input" v-if="clients.length>0"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Client Name</span>
                        </div>
                        <div class="right_input_pro">
                            <Select v-model="edit_data.client_id" style="width: 100%" >
                                <Option v-for="(item,index) in clients" :key="index" :value="item.id">{{item.name}}</Option>
                            </Select>
                        </div>
                    </div>
                </div>
                <!-- <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Status</span>
                        </div>
                        <div class="right_input_pro">
                            <Select size="large" v-model="form.project_status" style="width: 100%">
                                <Option v-for="(item,index) in project_status" :key="index" :value="item">{{item}}</Option>
                            </Select>
                        </div>
                    </div>
                </div> -->
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Starting Date</span>
                        </div>
                        <div class="right_input_pro">
                            <DatePicker type="date" format="yyyy-MM-dd" @on-change="editPsDate"  :value="edit_data.start_date" style="width: 100%"></DatePicker>
                            <!-- <Input v-model="form.start_date" style="width: 100%" /> -->
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Deadline Date</span>
                        </div>
                        <div class="right_input_pro">
                            <DatePicker type="date" format="yyyy-MM-dd" @on-change="editPeDate" :value="edit_data.deadline_date" style="width: 100%"></DatePicker>
                            <!-- <Input v-model="form.deadline_date" style="width: 100%" /> -->
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Project Duration</span>
                        </div>
                        <div class="right_input_pro">
                            <Input disabled v-model="edit_data.duration" style="width: 100%" > <span slot="append">Hours</span></Input>
                            
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Status</span>
                        </div>
                        <div class="right_input_pro">
                             <Select v-model="edit_data.status" >
                                <Option  value="All" >All</Option>
                                <Option  value="No Started" >No Started</Option>
                                <Option  value="Running" >Running</Option>
                                <!-- <Option  value="Pause" >Pause</Option> -->
                                <Option  value="Completed" >Completed</Option>
                            </Select>
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
              clients:[],
              projects:[],
              project_status:[
                  'Not Started',
                  'In Design',
                  'In Devlepoment',
                  'Finished',
              ],
              edit_modal: false,
              add_modal:false,
              edit_data: {},
              editIndex:-1,
              form:{
                  project_name:'',
                  client_id:'',
                  start_date:'',
                  deadline_date:'',
                  duration:'',
              }
          }
      },
      methods:{
          addPsDate(date){
              this.form.start_date=date
          },
          addPeDate(date){
            this.form.deadline_date=date

            const date1 = new Date(this.form.start_date);
            const date2 = new Date(this.form.deadline_date);
            const diffTime = Math.abs(date2 - date1);
            const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 )); 
            this.form.duration = diffDays
          },
          editPsDate(date){
              this.edit_data.start_date=date
          },
          editPeDate(date){
            this.edit_data.deadline_date=date

            const date1 = new Date(this.edit_data.start_date);
            const date2 = new Date(this.edit_data.deadline_date);
            const diffTime = Math.abs(date2 - date1);
            const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 )); 
            this.edit_data.duration = diffDays
          },
          edit_project(item,index){
            this.edit_data = _.cloneDeep(item)
            this.editIndex = index
            delete this.edit_data.client
			this.edit_modal = true
            },
          async form_submmit(){
            if(this.form.project_name=='') return this.i("project name can not be empty")
            if(this.form.client_id=='') return this.i("client name can not be empty")
            if(this.form.start_date=='') return this.i("project start date can not be empty")
            if(this.form.deadline_date=='') return this.i("project deadline date can not be empty")
            if(this.form.duration=='') return this.i("project duration can not be empty")
            const res = await this.callApi('post','project',this.form)
            if(res.status == 200){
                this.s('Project have been added successfully')
                this.projects.unshift(res.data)
                this.form.project_name = ''
                this.form.client_id = ''
                this.form.project_status = ''
                this.form.start_date = ''
                this.form.deadline_date = ''
            }
            else{
                this.swr()
            }
        },
        async update_project () {
            if (this.edit_data.project_name=='')return  this.i('Project name can not be empty!')
            if (this.edit_data.client_id=='') return this.i('Client name can not be empty!')
            if (this.edit_data.start_date =='')  return this.i('Start date can not be empty!')
            if (this.edit_data.deadline_date == '' ) return this.i("Deadline date can not be empty!")
            if (this.edit_data.duration == '' ) return this.i("Duration can not be empty!")
            const res = await this.callApi('put', 'project', this.edit_data)
            if (res.status === 200) {
                this.projects[this.editIndex] = res.data
                this.s('Project Updated')
                this.edit_data = {}
                this.editIndex = -1
                this.edit_modal = false
            }else{
                this.swr();
            }

        },
        async project_delete(id,index){
            if(!confirm("Are you sure to delete this Project?")){
                return;
            }
            let ob = {
                id:id
            }
            const res = await this.callApi('delete','project',ob)
            if(res.status == 200){
                this.i(' Project have been successfully Deleted!')
                this.projects.splice(index,1)
            }
        },
        
      },
      filters:{
            formatProgress(item){
            let hours = Math.floor(item / 60);
            //   let minutes = item % 60;
            //   let time  = hours + ' hours :'+minutes+" minutes"
              return hours;
            }
        },
      async created(){
        //   let hours = Math.floor(item / 60);
          let [res1,res2] = await Promise.all([
                this.callApi('get',`project`),
                this.callApi('get',`client`),
            ]);
            if(res1.status == 200 && res2.status == 200){
                this.projects = res1.data
                // let hours = Math.floor(this.projects.totalestimated_time / 60);

                this.clients = res2.data
                
            }
        }
	}
</script>