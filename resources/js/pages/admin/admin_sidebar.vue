<template>
    <div>
        <div class="left_sidebar">
            <div class="logo">
                <p class="logo_p1">AppifyLab</p>
                <!-- <img src="/static/1.png" alt="" class="logo_img">
                <p class="logo_p2">Dilruba Ferdous</p>
                <p class="logo_p3">Front End Developer</p> -->
                <Button type="info" size="large" class="logo_btn">Log out</Button>
            </div>
            
            <!---===left side List ====---->
            <div class="list_menu">
                    <Menu :theme="theme3" active-name="1">
                        <MenuGroup title="NAVIGATION">
                            <!-- <MenuItem name="1">
                                <router-link to="/admin_dashboard">
                                    Dashboard
                                </router-link>    
                            </MenuItem>
                            <MenuItem name="2">
                               <router-link to="/emp_profile">
                                    Employee Profile
                                </router-link>
                            </MenuItem>
                            <MenuItem name="3">
                               <router-link to="/designation">
                                    Designation
                                </router-link>
                            </MenuItem>
                            <MenuItem name="4">
                               <router-link to="/attendance">
                                    Employee Attendance
                                </router-link>
                            </MenuItem>
                            <MenuItem name="5">
                                <router-link to="/add_project">
                                    Add Project
                                </router-link>
                            </MenuItem>
                            <MenuItem name="6">
                                <router-link to="/all_project">
                                  All project
                                </router-link>
                            </MenuItem>
                            <MenuItem name="7">
                                <router-link to="/assign_project">
                                    Assign Project
                                </router-link>
                            </MenuItem>
                            <MenuItem name="8">
                                <router-link to="/assign_task">
                                    Assign Task
                                </router-link>
                            </MenuItem>
                            <MenuItem name="9">
                                <router-link to="/running_project">
                                   Running project
                                </router-link>
                            </MenuItem>
                            <MenuItem name="10">
                                <router-link to="/completed_project">
                                    Completed project
                                </router-link>
                            </MenuItem> -->
                            
                                <router-link to="/completed_project">
                                    <MenuItem name="10">Dashboard</MenuItem>
                                </router-link>
                                <router-link to="/completed_project">
                                    <MenuItem name="10">Employee Profile</MenuItem>
                                </router-link>
                                <router-link to="/completed_project">
                                    <MenuItem name="10">Designation</MenuItem>
                                </router-link>
                                <router-link to="/completed_project">
                                    <MenuItem name="10">Employee Attendance</MenuItem>
                                </router-link>
                                <router-link to="/completed_project">
                                    <MenuItem name="10">Add Project</MenuItem>
                                </router-link>
                                <router-link to="/completed_project">
                                    <MenuItem name="10">All project</MenuItem>
                                </router-link>
                                <router-link to="/completed_project">
                                    <MenuItem name="10">Assign Project</MenuItem>
                                </router-link>
                                <router-link to="/completed_project">
                                    <MenuItem name="10">Assign Task</MenuItem>
                                </router-link>
                                <router-link to="/completed_project">
                                    <MenuItem name="10">Running project</MenuItem>
                                </router-link>
                                <router-link to="/completed_project">
                                    <MenuItem name="10">Completed project</MenuItem>
                                </router-link>
                            
                        </MenuGroup>
                    </Menu>
            </div>
            <!---===left side List END====---->
        </div>
    </div>
</template>