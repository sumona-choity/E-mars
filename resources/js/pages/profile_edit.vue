<template>
    <div>
<div class="row right_row_pro">

    <!---=== profile pic edit column side ====-->    
            <div class="col-md-3">
                <div class="pic_card">
                    <div>
                        <img :src="authUser.image_link" alt="" class="logo_i.mg">
                    </div>
                    <div class="up_pic">
                        
                        <br>
                        <Upload
                            ref="upload"
                            type="drag"
                            name="img"
                            :show-upload-list="listMethod" 
                            :with-credentials="true"
                            :headers="crfObj"
                            :data="{id:1}"
                            :on-success="handleSuccess"
                            :format="['jpg','jpeg','png']"
                            :max-size="2048"
                            action="/app/upload">
                            <div style="padding: 20px 0">
                                <Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
                                <p>Click or drag image here to upload Product Image</p>
                            </div>
                        </Upload>
                        <Card  span="10" offset="1">
                            <div style="text-align:center">
                                <img  style="width: 100%;height: auto;" v-if="imageUrl" :src="imageUrl" >
                            </div>
                        </Card>
                   
                    </div>
                    <div class="cross_icon">
                        <Icon type="md-close" />
                    </div>
                </div>
            </div>
        <!---=== profile pic edit column side END====-->

    <!---=== profile edit column side ====-->        
            <div class="col-md-9">
                <div class="left_pro_card">
                    <div class="pro_card_header">
                        <p class="pro_header_p">Edit info</p>
                    </div>
                    <div class="pro_left_input"> 
                        <div class="_1st_input_pro">
                            <div class="left_name_pro">
                                <span class="input_title">Full name</span>
                            </div>
                            <div class="right_input_pro">
                                <Input v-model="form.name" style="width: 100%" />
                            </div>
                        </div>
                    </div>
                    <div class="pro_left_input"> 
                        <div class="_1st_input_pro">
                            <div class="left_name_pro">
                                <span class="input_title">Phone number</span>
                            </div>
                            <div class="right_input_pro">
                                <Input v-model="form.phone" style="width: 100%" />
                            </div>
                        </div>
                    </div>
                    <div class="pro_left_input"> 
                        <div class="_1st_input_pro">
                            <div class="left_name_pro">
                                <span class="input_title">Address</span>
                            </div>
                            <div class="right_input_pro">
                                <Input v-model="form.address" style="width: 100%" />
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

                    <div class="pro_btn_div">
                        <Button type="info" size="large" @click="formSubmit" class="update_btn">Update</Button>
                    </div>
                </div>

                <!-- <div class="left_pro_card">
                    <div class="pro_card_header">
                        <p class="pro_header_p">Edit email</p>
                    </div>
                    <div class="pro_left_input"> 
                        <div class="_1st_input_pro">
                            <div class="left_name_pro">
                                <span class="input_title"> old Email</span>
                            </div>
                            <div class="right_input_pro">
                                <Input v-model="form.email" style="width: 100%" />
                            </div>
                        </div>
                        <div class="_1st_input_pro">
                            <div class="left_name_pro">
                                <span class="input_title">New Email</span>
                            </div>
                            <div class="right_input_pro">
                                <Input v-model="form.email" style="width: 100%" />
                            </div>
                        </div>
                    </div>

                    <div class="pro_btn_div">
                        <Button type="info" size="large" class="update_btn">Update</Button>
                    </div>
                </div>  -->

                <div class="left_pro_card">
                    <div class="pro_card_header">
                        <p class="pro_header_p">Change password</p>
                    </div>
                    <div class="pro_left_input"> 
                        <div class="_1st_input_pro">
                            <div class="left_name_pro">
                                <span class="input_title">Current password</span>
                            </div>
                            <div class="right_input_pro">
                                <Input type="password" placeholder="" v-model="password.old_password"  style="width: 100%" />
                            </div>
                        </div>
                    </div>
                    <div class="pro_left_input"> 
                        
                        <div class="_1st_input_pro">
                            <div class="left_name_pro">
                                <span class="input_title">New password</span>
                            </div>
                            <div class="right_input_pro">
                                <Input type="password" placeholder="" v-model="password.password" style="width: 100%" />
                            </div>
                        </div>
                    </div>
                    <div class="pro_left_input"> 
                        <div class="_1st_input_pro">
                            <div class="left_name_pro">
                                <span class="input_title">Confirm password</span>
                            </div>
                            <div class="right_input_pro">
                                <Input type="password" placeholder="" v-model="password.confirm_password" style="width: 100%" />
                            </div>
                        </div>
                    </div>

                    <div class="pro_btn_div">
                        <Button type="info" size="large" @click="changePassword" class="update_btn">Update</Button>
                    </div>
                </div>  
            </div>
        <!---=== profile edit column side END ====-->        
        </div>
    </div>
</template>

<script>
	export default {
	  data(){
          return{
              profile:{},
              form:{
                  name:'',
                  phone:'',
                  address:'',
                  email:'',
                  image_link:''
              },
            //   email:{
            //       email:'',
            //       old_email:'',
            //   },
              password:{
                  password:'',
                  confirm_password:'',
                  old_password:'',

              },
              imageUrl:'',
              crfObj: {
                    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                },
                listMethod:true,
          }
      },
      methods:{
           handleSuccess(res, file){
                console.log(res);
                this.imageUrl=res.imageUrl
                this.form.image_link = res.imageUrl;
            },
          async single_profile(){
            const res = await this.callApi('get',`profile/${this.$route.params.id}`)
            if(res.status == 200){
                this.profile = res.data
                this.form = _.clone(this.profile)
            }
        },
        async formSubmit(){
            if(this.form.name == '') return this.i("Name is Empty!")
            if(this.form.phone == '') return this.i("Phone is Empty!")
            if(this.form.address == '') return this.i("address is Empty!")
            if(this.form.email == '') return this.i("email is Empty!")
            this.form.id = this.profile.id
            const res = await this.callApi('post','edit_profile',this.form)
            if(res.status == 200){
                this.s(' profile have been successfully Updated!')
                this.$store.commit('setAuthUser', this.form);
                this.$router.push(`/profile`)
                
            }
            else{
                this.swr()
            }

        },
        async changePassword(){
            if(this.password.password !== this.password.confirm_password) return this.i("Password doesn't match!")
            const res = await this.callApi("post",'changePassword',this.password)
            if(res.status == 200){
                this.i('Password changed successfully!')
                window.location="/logout"
            }
            else if (res.status == 401) this.i(res.data.msg)
            else this.swr()
        }
      },
    created(){
        //console.log(this.$route)
        this.single_profile();
    }
	}
</script>