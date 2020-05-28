<template>
    <div>
        <div class="container-fluid">
            <div class="row">
                <!---=== left column ====----> 
                
                <!---===left column END ====---->

                <!---=== right column ====---->
                <div class="col-md right_div">
                    <div class="right_side">
                        <div class="container-fluid">
                            <div class="row justify-content-center">
                                <div class="col-md-12">
                                    <div class="row right_row1">
                                        <div class="top_div">
                                            <div class="top_left">
                                                <p class="task_p">Add new project</p>
                                            </div>
                                            
                                            
                                        </div>
                                    </div>

                                    <div class="row right_row2">
                                        <div class="task_body col-10">
                                            <div class="_1st_input">
                                                <div class="left_name">
                                                    <span class="input_title">Project name</span>
                                                </div>
                                                <div class="right_input">
                                                    <Input placeholder="Project name" style="width: 100%" />
                                                </div>
                                            </div>
                                            <div class="_1st_input">
                                                <div class="left_name">
                                                    <span class="input_title">Client name</span>
                                                </div>
                                                <div class="right_input">
                                                    <Input placeholder="Client name" style="width: 100%" />
                                                </div>
                                            </div>
                                            <div class="_1st_input">
                                                <div class="left_name">
                                                    <span class="input_title">Project Status</span>
                                                </div>
                                                <div class="right_input">
                                                    <Select size="large" style="width:100%">
                                                        <Option>Running</Option>
                                                        <Option>Completed</Option>
                                                        <Option>Cancelled</Option>
                                                    </Select>
                                                </div>
                                            </div>
                                            <div class="_1st_input">
                                                <div class="left_name">
                                                    <span class="input_title">Project starting date</span>
                                                </div>
                                                <div class="right_input">
                                                    <DatePicker type="date" placeholder="yyyy/mm/dd" style="width: 100%"></DatePicker>
                                                </div>
                                            </div>
                                              <div class="_1st_input">
                                                <div class="left_name">
                                                    <span class="input_title">Project deadline date</span>
                                                </div>
                                                <div class="right_input">
                                                    <DatePicker type="date" placeholder="yyyy/mm/dd" style="width: 100%"></DatePicker>
                                                </div>
                                            </div>

                                            <div>
                                                <Button type="info" size="large" class="create_btn">Create</Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!---=== right column END ====---->
            </div>
        </div>
    </div>
</template>



<script>
	
	export default {
	  
	}
</script>