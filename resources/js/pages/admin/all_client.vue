<template>
    <div>
        <div class="row right_row1">
            <div class="top_div">
                <div class="top_left">
                    <p class="task_p">Clients</p>
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
                    <Button @click="add_modal = true" type="info">Add New Client</Button> 
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
                                <th>Client Name</th>
                                <th>Client Email</th>
                                <th>Client Address</th>
                                <th>Client Phone</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    
                        <tbody>
                            <tr v-for="(item,index) in clients" :key="index">
                                <td>
                                    <p>{{item.id}}</p>
                                </td>
                                <td>
                                    <p>{{item.name}}</p>
                                </td>
                                <td>
                                    <p>{{item.email}}</p>
                                </td>
                                <td>
                                    <p>{{item.address}}</p>
                                </td>
                                <td>
                                    <p>{{item.phone}}</p>
                                </td>
                                <td>
                                    <Button type="info" @click="edit_client(item,index)">Edit</Button>
                                    <Button @click="client_delete(item.id,index)" type="error">Delete</Button>
                                </td>
                            </tr>
                        </tbody>
                </table>
            <!---=== row list attendance END ===---->
            </div>
        </div>              
                     
        <!-- Add client  start modal -->
        <Modal
            v-model="add_modal"
            title="Add New Client"
            @on-ok="form_submmit"
            @on-cancel="add_modal = false">

            <div class="left_atten_card">
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Name</span>
                        </div>
                        <div class="right_input_pro">
                            <Input v-model="form.name" style="width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Email</span>
                        </div>
                        <div class="right_input_pro">
                            <Input v-model="form.email" style="width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Address</span>
                        </div>
                        <div class="right_input_pro">
                            <Input v-model="form.address" type="textarea" :autosize="{minRows: 2,maxRows: 5}" style="width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Phone</span>
                        </div>
                        <div class="right_input_pro">
                            <Input v-model="form.phone" style="width: 100%" />
                        </div>
                    </div>
                </div>
            </div>
        </Modal>
        <!-- Add client modal end -->
        <!-- edit client  start modal -->
        <Modal
            v-model="edit_modal"
            title="Edit Client"
            @on-ok="update_client"
            @on-cancel="edit_modal = false">

            <div class="left_atten_card">
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Name</span>
                        </div>
                        <div class="right_input_pro">
                            <Input v-model="edit_data.name" style="width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Email</span>
                        </div>
                        <div class="right_input_pro">
                            <Input v-model="edit_data.email" style="width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Address</span>
                        </div>
                        <div class="right_input_pro">
                            <Input v-model="edit_data.address" type="textarea" :autosize="{minRows: 2,maxRows: 5}" style="width: 100%" />
                        </div>
                    </div>
                </div>
                <div class="pro_left_input"> 
                    <div class="_1st_input_pro">
                        <div class="left_name_pro">
                            <span class="input_title">Phone</span>
                        </div>
                        <div class="right_input_pro">
                            <Input v-model="edit_data.phone" style="width: 100%" />
                        </div>
                    </div>
                </div>
            </div>
        </Modal>
        <!-- edit client modal end -->
    </div>
</template>

<script>
	
	export default {
	  data(){
          return{
              search:'',
            clients:[],
            edit_modal: false,
            add_modal: false,
            edit_data: {},
            editIndex:-1,
            form:{
                name:'',
                email:'',
                address:'',
                phone:''
            },

          }
      },
      methods:{
            async form_submmit(){
                if(this.form.name=='') return this.i("Client name can not be empty")
                if(this.form.email=='') return this.i("Client email can not be empty")
                if(this.form.address=='') return this.i("Client address can not be empty")
                if(this.form.phone=='') return this.i("Client phone can not be empty")
                const res = await this.callApi('post','client',this.form)
                if(res.status == 201){
                    this.s('Client have been added successfully')
                    this.clients.push(res.data)
                    this.form.name = ''
                    this.form.email = ''
                    this.form.address = ''
                    this.form.phone = ''
                }
                else{
                    this.swr()
                }
            },
            
            async all_clients(){
                const res = await this.callApi('get','client')
                if(res.status == 200){
                    this.clients = res.data
                }
            },
            edit_client(item,index){
            this.edit_data = _.cloneDeep(item)
            this.editIndex = index
			this.edit_modal = true
            },
            async update_client () {
                if (this.edit_data.name=='')return  this.i('Name can not be empty!')
                if (this.edit_data.email=='') return this.i('Email can not be empty!')
                if (this.edit_data.address =='')  return this.i('Address can not be empty!')
                if (this.edit_data.phone == '' ) return this.i("Phone can not be empty!")
                const res = await this.callApi('put', 'client', this.edit_data)
                if (res.status === 200) {
                    this.clients[this.editIndex] = _.clone(this.edit_data)
                    this.s('Client Updated')
                    this.edit_data = {}
                    this.editIndex = -1
                    this.edit_modal = false
                }else{
                    this.swr();
                }

            },
            async client_delete(id,index){
                if(!confirm("Are you sure to delete this CLient?")){
                    return;
                }
                let ob = {
                    id:id
                }
                const res = await this.callApi('delete','client',ob)
                if(res.status == 200){
                    this.i(' CLient have been successfully Deleted!')
                    this.clients.splice(index,1)
                }
            },
        },
        created(){
            this.all_clients();
        }
	}
</script>