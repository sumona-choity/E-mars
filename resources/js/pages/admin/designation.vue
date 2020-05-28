<template>
    <div>
        <div class="row right_row1">
            <div class="top_div">
                <div class="top_left">
                    <p class="task_p">Designation</p>
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
        
        <!---=== right side input field ====---->
        <div class="row justify-content-between">
            <div class="col-md-6 offset-md-3">
                <div class="designation text-center">
                    <Input v-model="form.name" placeholder="Designation" style="width: 300px" />
                    <Button @click="form_submmit" type="info">Create</Button>
                </div>
            </div>
        </div>
         <!----=== Designation List table ====---->  
         <div class="_table_all"> 
            <div class="_table_main">
                <table class="_1table"> 
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Designation Name</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    
                        <tbody>
                            <tr v-for="(item,index) in designation" :key="index">
                                <td>
                                    <p>{{item.id}}</p>
                                </td>
                                <td>
                                    <template  v-if="isEdit && index == editIndex">  
                                        <Input v-model="edit_form.name" placeholder="Enter designation..."/>
                                    </template>
                                    <template v-else>
                                        <p>{{item.name}}</p>
                                    </template>
                                </td>
                                <td>
                                    <template   v-if="isEdit && index == editIndex">
                                        <button class="btn btn-success" @click="updateDesignation" >Save</button>
                                        <button class="btn btn-warning" @click="isEdit = false">Cancel</button>
                                    </template>
                                    <template v-else>
                                        <Button type="info" @click="isEditOn(item,index)">Edit</Button>
                                        <Button type="error" @click="designation_delete(item.id,index)">Delete</Button>
                                    </template>
                                </td>
                            </tr>
                        </tbody>
                </table>
            <!---=== row list attendance END ===---->
            </div>
        </div>
        
        <!----=== Designation List table END ====----> 
    </div>
</template>

<script>
	export default {
        data(){
            return{
                search:'',
                designation:[],
                form:{
                    name:''
                },
                edit_form:{
                    name:'',
                    id:''
                },
                editindex:-1,
                isEdit:false,
            }
        },
        methods:{
            async form_submmit(){
                if(this.form.name=='') return this.i("Product name is empty")
                const res = await this.callApi('post','designation',this.form)
                if(res.status == 201){
                    this.s('Designation have been added successfully')
                    this.designation.push(res.data)
                    this.form.name = ''
                }
                else{
                    this.swr()
                    }
                },
            async all_designation(){
                const res = await this.callApi('get','designation')
                if(res.status == 200){
                    this.designation = res.data
                }
            },
            async designation_delete(id,index){
                if(!confirm("Are you sure to delete this Designation")){
                    return;
                }
                let ob = {
                    id:id
                }
                const res = await this.callApi('delete','designation',ob)
                if(res.status == 200){
                    this.i(' Designation have been successfully Deleted!')
                    this.designation.splice(index,1)
                }
            },
            async updateDesignation(){
            if(this.edit_form.name == '') return this.i("Designation Name is empty!");
            const res = await this.callApi('put','designation',this.edit_form)
            if(res.status == 200){
                this.designation[this.editIndex] = _.clone(this.edit_form) 
                this.s("Designation Updated  !")
                let ob ={
                    name:'',
                    id:'',
                }
                this.edit_form = ob 
                this.editIndex = -1
                this.isEdit = false
            }
            else{
                this.swr();
            }
        },
            isEditOn(item,index){
            this.edit_form = _.clone(item) 
            this.editIndex = index
            this.isEdit = true
        }
        },
        created(){
            this.all_designation();
        }
	}
</script>