<template>
	<div>
		<div class="content"> 
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						 <div class="category_button_top" style="width:100%" > 
							 <div class="row">
								<div class="col-md-4"> <Button @click="addModalOn" class="_btn _action_btn view_btn1 category_button" type="info">Add Product</Button></div>
								<div class="search_div">
									<Input style="width:300px;" size="large" search v-model="search" @on-change="searchOn" placeholder="Search..." />
								</div>
							 </div>
                        </div>
						<!--~~~~~~~ TABLE ONE ~~~~~~~~~-->
						<div class="_1adminOverveiw_table_recent _box_shadow _border_radious  _p20">
							<div class="_overflow _table_div">
								<table class="_table" style="width:100%">
										<!-- TABLE TITLE -->
									<tr style="background: #5ea1ce;" > 
										<!-- <th>Num</th> -->
										<th>Product Id</th>
										<th>Product Name</th>
										<th>Product Image</th>
										<th>Description</th>
										<th>Action</th>
									</tr>
									<tr v-for="(product,index) in products" :key="product.id">
										<!-- <td>{{index+1}}</td> -->
										<td>{{product.id}}</td>
										<td >{{product.name}}</td>
										<td @click="viewImage(product)"><Button>show</Button></td>
										<td><Button @click="viewItem(product)" class="_btn _action_btn edit_btn1" type="info">Details</Button> </td>
										<td>
											<span class="_pointer" @click="editProduct(product,index)"><i class="fas fa-edit"></i></span>
                                            <span class="_pointer_red" @click="deleteProduct(product.id,index)" ><i class="fas fa-trash-alt"></i></span>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- start show detail modal -->
		<Modal
			v-model="imageModal"
			width="900px;"
			:mask-closable="false"
			title="Product Image"
            >
			<div class="row mText-center" >
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Image</p>
                            <img :src="productImage" alt="">
					</div>
				</div>
			</div>
		 <div slot="footer">
			
            <Button  type="primary"  @click="imageModal = false">Cancel</Button>
        </div>

		</Modal>
		<Modal
			v-model="textVisible"
			width="900px;"
			:mask-closable="false"
			title="Product Details"
            >
        	<div class="row mText-center" >
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Name</p>
                            <p>{{showdata.name}}</p>
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Category</p> 
                           <p v-if="showdata.category">{{showdata.category.name}}</p>
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Sub Category</p> 
                           <p v-if="showdata.subcategory">{{showdata.subcategory.name}}</p>
					</div>
				</div>
				<div class="col-12 col-md-12">
					<div class="_3login_input_group">
						<p class="registration_title">Description</p>
                         <p>{{showdata.description}}</p>
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Price</p>
                           <p>{{showdata.price}}</p>
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Discount</p>
                           <p>{{showdata.discount}}</p>
					</div>
				</div>
				<!-- <div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Cost</p>
                           <p>{{showdata.cost}}</p>
					</div>
				</div> -->
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Stock</p> 
                           <p>{{showdata.stock}}</p>
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Warranty</p> 
                           <p>{{showdata.warranty}}</p>
					</div>
				</div>
				
				<div class="col-4 col-md-4">
					<div class="_3login_input_group">
						<p class="registration_title">Primary image</p> 
							<div class="demo-upload-list" >
								<img :src="showdata.image">
								<div class="demo-upload-list-cover">
									<Tooltip content="View" theme="light"><Icon type="ios-eye-outline" @click.native="handleView(showdata.image)"></Icon></Tooltip>
									
								</div>
							</div>
					</div>
				</div>
				<div class="col-8 col-md-8">
					<div class="_3login_input_group">
						<p class="registration_title"> Extra images</p> 
							<div class="demo-upload-list" v-for="(item,index) in showdata.photo" :key="index">
								<img :src="item.link">
								<div class="demo-upload-list-cover">
									<Tooltip content="View" theme="light"><Icon type="ios-eye-outline" @click.native="handleView(item.link)"></Icon></Tooltip>
								</div>
							</div>
					</div>
				</div>
				<!-- <div class="col-8 col-md-8">
					<div class="_3login_input_group">
						<p class="registration_title"> Videos</p> 
							<div class="demo-upload-list" v-for="(item,index) in showdata.videos" :key="index">
								<video width="320" height="240" controls>
									<source :src="item.link" type="video/mp4">
									Your browser does not support the video tag.
								</video>
							</div>
					</div>
				</div>
				 -->
				
			</div>
 		<div slot="footer">
			
            <Button  type="primary"  @click="textVisible = false">Cancel</Button>
        </div>
			
    	</Modal>
		<!-- end of show detail modal -->
        <Modal
			v-model="addModal"
			title="Add Product"
			:mask-closable="false"
			width="900px;"
			>
        	<div class="row mText-center"  >
				<!-- name -->
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Name</p>
						<Input type="text" v-model="form_data.name" placeholder="Name"/>
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Category Name</p>
						<Select v-model="form_data.categoryId" @on-change="selectCategory" clearable filterable>
                            <Option v-for="(item,index) in categories" :key="index" :value="item.id">{{item.name}}</Option>
                        </Select>
					</div>
				</div>
				
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Subcategory name</p>
						<Select v-model="form_data.subCategoryId" clearable filterable>
                            <Option v-for="(item,index) in subCategories" :key="index" :value="item.id">{{item.name}}</Option>
                        </Select>
					</div>
				</div>
				<div class="col-12 col-md-12">
					<div class="_3login_input_group">
						<p class="registration_title">Description</p>
						<Input  type="textarea" :autosize="{minRows: 2,maxRows: 5}" v-model="form_data.description" placeholder="Description" />
					</div>
				</div>
				<div class="col-4 col-md-4">
					<div class="_3login_input_group">
						<p class="registration_title">Warranty</p>

						<Input  type="textarea" :autosize="{minRows: 2,maxRows: 2}" v-model="form_data.warranty" placeholder="warranty" />

					</div>
				</div>
				<div class="col-4 col-md-4">
					<div class="_3login_input_group">
						<p class="registration_title">Price</p>
						<InputNumber :min='0'  v-model="form_data.price" placeholder="Price"></InputNumber>
					</div>
				</div>
				<div class="col-4 col-md-4">
					<div class="_3login_input_group">
						<p class="registration_title">Discount</p>
						<InputNumber :min='0' v-model="form_data.discount" placeholder="discount"></InputNumber>
					</div>
				</div>
				<!-- <div class="col-4 col-md-4">
					<div class="_3login_input_group">
						<p class="registration_title">Cost</p>
						<InputNumber :min='0' v-model="form_data.cost" placeholder="Cost"></InputNumber>
					</div>
				</div> -->
				
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Stock</p>
						<InputNumber :min='0' v-model="form_data.stock" placeholder="Stock"></InputNumber>
					</div>
				</div>
				
				
				<div class="col-4 col-md-4">
					<div class="_3login_input_group">
						<p class="registration_title">Primary Image</p>
						 <template>
							
							<div class="demo-upload-list" v-if="form_data.image" >
								<img :src="form_data.image">
								<div class="demo-upload-list-cover">
									<Tooltip content="View" theme="light"><Icon type="ios-eye-outline" @click.native="handleView(form_data.image)"></Icon></Tooltip>
									<Tooltip content="Delete " theme="light"><Icon type="ios-trash-outline" @click.native="form_data.image=''"></Icon></Tooltip>
								</div>
							</div>
						</template> 
					</div>
				</div>
				<div class="col-8 col-md-8">
					<div class="_3login_input_group">
						<p class="registration_title">Image</p>
						 <template>
							<div class="demo-upload-list" v-for="(item,index) in uploadList" :key="index">
								<img :src="item.link">
								<div class="demo-upload-list-cover">
									<Tooltip content="View" theme="light"><Icon type="ios-eye-outline" @click.native="handleView(item.link)"></Icon></Tooltip>
									<Tooltip content="Delete " theme="light"><Icon type="ios-trash-outline" @click.native="handleRemove(item,index)"></Icon></Tooltip>
									<Tooltip content="Make Default" theme="light"><Icon type="ios-camera" v-if="item.link != form_data.image"  @click.native="form_data.image=item.link"></Icon></Tooltip>
								</div>
							</div>
							<Upload
								name="img"
								:show-upload-list="false"
								:default-file-list="defaultList"
								:on-success="handleSuccess"
								:format="['jpg','jpeg','png']"
								:max-size="2048"
								:on-format-error="handleFormatError"
								:on-exceeded-size="handleMaxSize"
								:before-upload="handleBeforeUpload"
								multiple
								type="drag"
								action="/app/upload"
								style="display: inline-block;width:58px;">
								<div style="width: 58px;height:58px;line-height: 58px;">
									<Icon type="ios-camera" size="20"></Icon>
								</div>
							</Upload>
						</template> 
					</div>
				</div>
				<!-- <div class="col-8 col-md-8">
					<div class="_3login_input_group">
						<p class="registration_title">Select upload type</p>
						<template>
							<RadioGroup v-model="uploadType">
								<Radio label="youtubelink">
									<span>Youtube Link</span>
								</Radio>
								<Radio label="upload">
									<span>Upload</span>
								</Radio>
								
							</RadioGroup>
						</template>
					</div>
				</div> -->
				<!-- <div class="col-8 col-md-8" v-if="uploadType=='upload'">
					<div class="_3login_input_group">
						<p class="registration_title">Video</p>
						 <template>
							
							
							<Upload
								name="video"
								
								:default-file-list="defaultList"
								:on-success="videoHandleSuccess"
								:format="['MP4','WEBM','WMV','mpga']"
								:on-format-error="handleFormatError"
								:before-upload="handleBeforeUploadcheck"
								:on-remove="removefile"
								multiple
								type="drag"
								action="/app/videoUpload"
								style="display: inline-block;width:100%;">
								<div style="height:58px;line-height: 58px;">
									
									<Icon type="md-videocam" size="20" />
								</div>
							</Upload>
						</template> 
					</div>
				</div> -->
				<!-- <div class="col-8 col-md-8" v-if="uploadType=='youtubelink'" >
					<div class="_3login_input_group">
						<p class="registration_title">youtube video link</p>
						 <div class="add_button">
							<Input type="text" v-model="videoLink" placeholder="Name"/>
							<button type="button"  @click="addnewVideo">add</button>
						</div> 
					</div>
				</div> -->
				<!-- <div class="col-8 col-md-8" >
					<div class="_3login_input_group">
						<p class="registration_title">uploaded video list</p>
						 <template >
							<div class="row">
								<span v-for="(item,index) in videotList" :key="index">{{item.link}} <i class="fas fa-trash-alt" @click="removeVideolistItem(index)"></i></span>
							</div>
							
						
						</template> 
					</div>
				</div> -->
			</div>


		 <div slot="footer">
			
            <Button type="success" v-if="!isLoading"   @click="addProduct">Add Product</Button>
            <Button  type="primary"  @click="addModal = false">Cancel</Button>
            <Button v-if="isLoading" type="primary" :loading="true"  @click="addModal = false">loading..</Button>
        </div>
    	</Modal>
        <Modal
			v-model="editModal"
			:mask-closable="false"
			width="900px;"
			title="Edit Product"
			>
        	<div class="row mText-center">
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Name</p>
						<Input type="text" v-model="edit_data.name" placeholder="name"/>
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Category Name</p>
						<Select v-model="edit_data.categoryId" @on-change="selectCategoryEdit" clearable filterable>
                            <Option v-for="(item,index) in categories" :key="index" :value="item.id">{{item.name}}</Option>
                        </Select>
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Subcategory name</p>
						<Select v-model="edit_data.subCategoryId" clearable filterable>
                            <Option v-for="(item,index) in subCategories" :key="index" :value="item.id">{{item.name}}</Option>
                        </Select>
					</div>
				</div>
				<div class="col-12 col-md-12">
					<div class="_3login_input_group">
						<p class="registration_title">Description</p>
						<Input  type="textarea" :autosize="{minRows: 2,maxRows: 5}" v-model="edit_data.description" placeholder="Description" />
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Warranty</p>
						<DatePicker :value="edit_data.warranty" @on-change="outputdate1" format="yyyy-MM-dd" type="date" placeholder="Select date"></DatePicker>
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Price</p>
						<InputNumber :min='0' v-model="edit_data.price" placeholder="Price"></InputNumber>
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Discount</p>
						<InputNumber :min='0' v-model="edit_data.discount" placeholder="discount"></InputNumber>
					</div>
				</div>
				<!-- <div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Cost</p>
						<InputNumber :min='0' v-model="edit_data.cost" placeholder="Cost"></InputNumber>
					</div>
				</div> -->
				
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Stock</p>
						<InputNumber :min='0' v-model="edit_data.stock" placeholder="Stock"></InputNumber>
					</div>
				</div>
				<!-- <div class="col-12 col-md-12">
					<div class="_3login_input_group">
						<p class="registration_title">Primary Image</p>
						 <template>
							
							<div class="demo-upload-list" >
								<img :src="edit_data.image">
								<div class="demo-upload-list-cover">
									
									
									<Tooltip content="View" theme="light"><Icon type="ios-eye-outline" @click.native="handleView(edit_data.image)"></Icon></Tooltip>
									<Tooltip content="Delete " theme="light"><Icon type="ios-trash-outline" @click.native="edit_data.image=''"></Icon></Tooltip>
									
								</div>
							</div>
						</template> 
					</div>
				</div> -->
				<div class="col-12 col-md-12">
					<div class="_3login_input_group">
						<p class="registration_title">Image</p>
						 <template>
							
							<div class="demo-upload-list" v-for="(item,index) in uploadList" :key="index">
								<img :src="item.link">
								<div class="demo-upload-list-cover">
									
									
									<Tooltip content="View" theme="light"><Icon type="ios-eye-outline" @click.native="handleView(item.link)"></Icon></Tooltip>
									<Tooltip content="Delete " theme="light"><Icon type="ios-trash-outline" @click.native="handleRemove(item,index)"></Icon></Tooltip>
									<Tooltip content="Make Default" theme="light"><Icon type="ios-camera" v-if="item.link != edit_data.image"  @click.native="edit_data.image=item.link"></Icon></Tooltip>
									
								</div>
							</div>
							<Upload
								name="img"
								:show-upload-list="false"
								:default-file-list="defaultList"
								:on-success="handleEditSuccess"
								:format="['jpg','jpeg','png']"
								:max-size="2048"
								:on-format-error="handleFormatError"
								:on-exceeded-size="handleMaxSize"
								:before-upload="handleBeforeUpload"
								multiple
								type="drag"
								action="/app/upload"
								style="display: inline-block;width:58px;">
								<div style="width: 58px;height:58px;line-height: 58px;">
									<Icon type="ios-camera" size="20"></Icon>
								</div>
							</Upload>
							
						</template> 
					</div>
				</div>
				<!-- <div class="col-8 col-md-8">
					<div class="_3login_input_group">
						<p class="registration_title">Video</p>
						 <template>
							
							
							<Upload
								name="video"
								
								:default-file-list="videotList"
								:on-success="videoHandleSuccess"
								:format="['MP4','WEBM','WMV','mpga']"
								:on-format-error="handleFormatError"
								:before-upload="handleBeforeUpload"
								:on-remove="removefile"
								multiple
								type="drag"
								action="/app/videoUpload"
								style="display: inline-block;width:100%;">
								<div style="height:58px;line-height: 58px;">
									
									<Icon type="md-videocam" size="20" />
								</div>
							</Upload>
						</template> 
					</div>
				</div> -->



				<!-- <div class="col-8 col-md-8">
					<div class="_3login_input_group">
						<p class="registration_title">Select upload type</p>
						<template>
							<RadioGroup v-model="uploadType">
								<Radio label="youtubelink">
									<span>Youtube Link</span>
								</Radio>
								<Radio label="upload">
									<span>Upload</span>
								</Radio>
								
							</RadioGroup>
						</template>
					</div>
				</div> -->
				<!-- <div class="col-8 col-md-8" v-if="uploadType=='upload'">
					<div class="_3login_input_group">
						<p class="registration_title">Video</p>
						 <template>
							
							
							<Upload
								name="video"
								
								:default-file-list="defaultList"
								:on-success="videoHandleSuccess"
								:format="['MP4','WEBM','WMV','mpga']"
								:on-format-error="handleFormatError"
								:before-upload="handleBeforeUploadcheck"
								:on-remove="removefile"
								multiple
								type="drag"
								action="/app/videoUpload"
								style="display: inline-block;width:100%;">
								<div style="height:58px;line-height: 58px;">
									
									<Icon type="md-videocam" size="20" />
								</div>
							</Upload>
						</template> 
					</div>
				</div> -->
				<!-- <div class="col-8 col-md-8" v-if="uploadType=='youtubelink'" >
					<div class="_3login_input_group">
						<p class="registration_title">youtube video link</p>
						 <div class="add_button">
							<Input type="text" v-model="videoLink" placeholder="Name"/>
							<button type="button"  @click="addnewVideo">add</button>
						</div> 
					</div>
				</div> -->
				<!-- <div class="col-8 col-md-8" >
					<div class="_3login_input_group">
						<p class="registration_title">uploaded video list</p>
						 <template >
							<div class="row">
								<span v-for="(item,index) in videotList" :key="index">{{item.link}} <i class="fas fa-trash-alt" @click="removeVideolistItem(index)"></i></span>
							</div>
							
						
						</template> 
					</div>
				</div> -->
			</div>

			<div slot="footer"> 
                <Button type="info"  @click="editModal = false"> Cancel</Button>
                <Button type="primary" v-if="!isLoading" @click="updateProduct">Update</Button>
                <Button type="info" loading disabled v-if="isLoading">Loading</Button>
            </div>
    	</Modal>
		<Modal title="View Image" v-model="visible">
			<img :src="imgName" v-if="visible" style="width: 100%">

			<div slot="footer">
			
            <Button  type="primary"  @click="visible = false">Cancel</Button>
        </div>
		</Modal>
	</div>
</template>
<script>
export default {
    data(){
		return{
			imageModal:false,
			productImage:'',
			defaultList:[],
			videotList:[],
			products:[],
			uploadList:[],
			subCategories:[],
			categories:[],
			search:'',
			isLoading:true,
            addModal: false,
            editModal: false,
            form_data: {
                name:'',
                description:'',
				price:0,
				stock:0,
				// cost:0,
				image:'',
				warranty:'',
				categoryId:'',
				subCategoryId:'',
			},
            edit_data: {},
			editIndex:-1,
			imgName: '',
			visible: false,
			textVisible: false,
			key:'',
			uploadType:'',
			videoLink:'',
			showdata:{},
			listMethod:true,
			imageUrl:'',
            crfObj: {
                'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
			},
			
		}
	},
    methods:{
		removeVideolistItem(index){
			this.videotList.splice(index,1)
		},
		addnewVideo(){
			if(this.uploadType.trim()==''){
				return this.e("please select upload type")
			}
			if(this.videoLink.trim()==''){
				return this.e("please add a videoLink")
			}
			this.videotList.unshift({'type':this.uploadType, 'link':this.videoLink})
			this.uploadType = ''
			this.videoLink = ''
		},
		async selectCategory(){
			if(this.form_data.categoryId)
			{
				const res = await this.callApi('get',`showsubCategoryforProduct?categoryId=${this.form_data.categoryId}`)
				if(res.status == 200){
					this.subCategories = res.data.subCategoryforProduct
				}
				else this.swr()
			}
		},
		async removefile(file,filelist){
				console.log(file)
				console.log(filelist)
				let ob ={
					file:file.response.videoUrl
				}
				const res = await this.callApi('post',`removefile`,ob)
				let index = this.videotList.findIndex(obj => obj.link == file.response.videoUrl);
				this.videotList.splice(index,1)
				console.log(this.videotList)
				// if(res.status == 200){
				// 	this.subCategories = res.data.subCategoryforProduct
				// }
				// else this.swr()
			
		},
		async selectCategoryEdit(){
			if(this.edit_data.categoryId)
			{
				const res = await this.callApi('get',`showsubCategoryforProduct?categoryId=${this.edit_data.categoryId}`)
				if(res.status == 200){
					this.subCategories = res.data.subCategoryforProduct
				}
				else this.swr()
			}
		},
		addModalOn(){

			this.uploadList = []
			this.videotList = []
			this.defaultList = []
			this.addModal = true
		},
		inputdate1(date){
            this.form_data.warranty = date
		},
		outputdate1(date){
            this.edit_data.warranty = date
        },
		handleSuccess(res, file){
			if(this.uploadList.length == 0){
				this.form_data.image = res.imageUrl
				this.edit_data.image = res.imageUrl
			}
			this.uploadList.push({link:res.imageUrl})
        },
		handleEditSuccess(res, file){
				this.uploadList.push({link:res.imageUrl})
        },
		videoHandleSuccess(res, file){

				this.videotList.unshift({type:this.uploadType,link:res.videoUrl})
				this.uploadType = ''
				this.videoLink = ''
        },
		viewItem (item) {
			this.showdata = _.cloneDeep(item);
			console.log(this.showdata, "data show")
            this.textVisible = true;
        },
		viewImage (img) {
			if(img.image!=''){
				this.productImage = img.image
			}
			else if(img.photo){
				this.productImage = img.photo[0].link;
			}
			if(this.productImage=='') return this.i("there is no image")
            this.imageModal = true;
        },
		handleView (item) {
            this.imgName = item;
            this.visible = true;
        },
        handleRemove (item,index) {
			this.uploadList.splice(index,1)
        },
        videoHandleRemove (item,index) {
			this.videotList.splice(index,1)
        },
		handleEditView (item,index) {
            this.imgName = item.link;
            this.visible = true;
        },
        handleEditRemove (item,index) {
			this.uploadList.splice(index,1)
        },
        handleFormatError (file) {
            this.$Notice.warning({
                title: 'The file format is incorrect',
                desc: 'File format of ' + file.name + ' is incorrect, please select jpg or png.'
            });
        },
        handleMaxSize (file) {
            this.$Notice.warning({
                title: 'Exceeding file size limit',
                desc: 'File  ' + file.name + ' is too large, no more than 2M.'
            });
        },
        handleBeforeUpload () {
            // const check = this.uploadList.length < 6;
            // if (!check) {
            //     this.$Notice.warning({
            //         title: 'Up to five pictures can be uploaded.'
            //     });
            // }
            // return check;
        },
        handleBeforeUploadcheck () {
			if(this.uploadType.trim()==''){
				return 
			}
			
            const check = this.uploadType.trim()!='';
            if (!check) {
                this.$Notice.warning({
                    title: 'select upload type!!.'
                });
            }
            return check;
        },
        async deleteProduct(id,index){
            if(!confirm("WARNING!!! Are you sure to delete this info?")){
                return;
            }
            const response = await this.callApi('post', 'deleteProduct', {id:id})
            if (response.status === 200) {
                this.products.splice(index,1)
                this.s('Product deleted');
            }else{
                console.log(response);
                this.swr()
            }
        },
        async editProduct(item,index){
			if(!confirm("WARNING!!! Are you sure to edit this info?")){
                return;
            }
			this.edit_data = _.cloneDeep(item)
			this.editIndex = index
			this.subCategories  = item.Subcategory
			if(this.edit_data.categoryId)
			{
				const res = await this.callApi('get',`showsubCategoryforProduct?categoryId=${this.edit_data.categoryId}`)
				if(res.status == 200){
					this.subCategories = res.data.subCategoryforProduct
				}
				else this.swr()
			}
			this.uploadList = item.photo
			// this.videotList = item.videos
			this.defaultList = []

			// for(let d of this.videotList){
			// 	let ob = {
			// 		name:d.link,
			// 		url:d.link
			// 	}
			// 	this.defaultList.push(ob)

			// }
			this.editModal = true
        },
		async searchOn(){
            const res = await this.callApi('get',`showProduct?search=${this.search}`)
            if(res.status == 200){
                this.products = res.data.product
            }
            else this.swr()
          },
        async addProduct () {

			// if (this.form_data.warranty=='')return  this.e('name can not be empty!')
			if (this.form_data.image.trim()=='' || this.form_data.image==null)return  this.e('image field can not be empty!')
			if (this.form_data.name.trim()=='' || this.form_data.name==null)return  this.e('name can not be empty!')
            if (this.form_data.description.trim()=='' ||this.form_data.description==null)  return this.e('Please Write description !')
			if (this.form_data.price=='' || this.form_data.price==null)  return this.e('Please enter price !')
			if (this.form_data.stock=='')  return this.e('Please enter stock !')
			if (this.form_data.categoryId=='' || this.form_data.categoryId==null)  return this.e('Please enter category !')
			if (this.form_data.subCategoryId=='' || this.form_data.subCategoryId==null)  return this.e('Please enter subCategory !')
			if (this.uploadList.lengh>0 )  return this.e('Please Upload at least one Image !')
			this.form_data.uploadList = this.uploadList

				// this.form_data.videotList = this.videotList
			this.isLoading = true
            const response = await this.callApi('post', 'storeProduct', this.form_data)
			console.log(response)
			if (response.status == 200) {
                this.products.unshift(response.data.product)
				this.s('Product added')
				this.isLoading = false
				this.form_data=  {}
				this.form_data.name=''
				this.form_data.description=''
				this.form_data.price=''
				this.form_data.stock=''
				this.form_data.warranty=''
				this.form_data.categoryId=''
				this.form_data.subCategoryId=''
				this.uploadList=[]
				// this.form_data.videotList=[]
				// this.videotList=[]
				this.form_data.uploadList=[]
				// this.form_data.videotList=[]
			  this.addModal = false
			}
			else if(response.status==422){
				if(response.data.message){
					this.e(response.data.message)
				}
			}
			else{
				
                this.swr();
				console.log(response);
				this.isLoading = false
			}
			this.isLoading = false
        },
        async updateProduct () {
			if (this.edit_data.name.trim()=='')return  this.e('name can not be empty!')
            if (this.edit_data.description.trim()=='') return this.e('description can not be empty! !')
			if (this.edit_data.price=='')  return this.e('price can not be empty! !')
			if (this.edit_data.image=='')  return this.e('Primary image can not be empty! !')
			if (this.uploadList.lengh>0 )  return this.e('Please Upload at least one Image !')
			// if (this.edit_data.stock=='')  return this.e('stock can not be empty! !')
			// if (this.edit_data.warranty=='')  return this.e('warranty can not be empty! !')
			delete this.edit_data.isSelected;
			delete this.edit_data.photo
			delete this.edit_data.category
			delete this.edit_data.subcategory
			// delete this.edit_data.videos
			this.edit_data.uploadList = this.uploadList
			// this.edit_data.videotList = this.videotList
			const response = await this.callApi('post', 'editProduct', this.edit_data)
            if (response.status === 200) {
				this.products[this.editIndex] = response.data.product
				this.edit_data ={}
				this.editIndex = -1
				this.editModal = false
				this.s('Product Updated')
            }else{
                this.swr();
                console.log(response);
            }
        },
        cancel () {
            this.form_data = {}
        },
        addModalForm(){
            this.addModal = true
		},
		// async makeDefult(item,index){
		// 	let ob = {
		// 		id:this.multiImageList.productId,
		// 		productImage:item.url
		// 	}
		// 	this.sending=true
		// 	const res = await this.callApi('put',`/app/main_product/${ob.id}`,ob)
		// 	if(res.status == 200){
		// 		this.s('Great!','Product Defult Image has been updated successfully!')
		// 		this.dataProduct[this.multiImageList.index].productImage = item.url
		// 		this.multiImageList.productImage = item.url

		// 		this.sending=false
		// 	}
		// 	else{
		// 		this.sending=false
		// 		this.e('Oops!','Something went wrong, please try again!')
		// 	}
		// },
	},
	async created(){
		const [res,res1] = await Promise.all([
			this.callApi('get',`showProduct?search=${this.search}`), 
			this.callApi('get',`indexCategory`),
		]);
		if( res.status == 200 & res1.status == 200){
			for(let d of res.data.product){
				d.isSelected = false
			}
			this.products = res.data.product
			this.categories = res1.data.category
			this.isLoading = false
		} else {
			this.swr()
			this.isLoading = false
		}
	},
}
</script>
<style scoped >
	.demo-upload-list{
	display: inline-block;
	width: 200px;
	height: 150px;
	text-align: center;
	line-height: 60px;
	border: 1px solid transparent;
	border-radius: 4px;
	overflow: hidden;
	position: relative;
	margin-right: 4px;
	}
	.demo-upload-list img {
	width: 100%;
	height: 100%;
	}
	.demo-upload-list-cover {
	display: none;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.6);
	}
	.demo-upload-list:hover .demo-upload-list-cover {
	display: block;
	}
	.demo-upload-list-cover i {
	color: #fff;
	font-size: 40px;
	cursor: pointer;
	margin: 0 2px;
	}
	.bottom_option{
		text-align: center;
		padding: 40px 0px;
		display: flex;
	}
	.table_td_product_name{
		width: 320px;
		display: block;
	}
	
 
   
   
</style>
