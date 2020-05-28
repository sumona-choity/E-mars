<template>
    <div>
        <div class="left_sidebar">
            <div class="logo">
                <p class="logo_p1">AppifyLab</p>
                <p class="logo_p2">Dilruba Ferdous</p>
                <p class="logo_p3">Front End Developer</p>
                <Button type="info" size="large" class="logo_btn">Log out</Button>
            </div>
            
            <!---===left side List ====---->
            <div class="list_menu">
                <Menu :theme="theme3" active-name="1">
                    <MenuGroup title="NAVIGATION">
                            <router-link to="/emp_com_pro">
                                <MenuItem name="6">Dashboard</MenuItem>
                            </router-link> 
                            <router-link to="/emp_com_pro">
                                <MenuItem name="6">Profile</MenuItem>
                            </router-link> 
                            <router-link to="/emp_com_pro">
                                <MenuItem name="6">Add task</MenuItem>
                            </router-link> 
                            <router-link to="/emp_com_pro">
                                <MenuItem name="6">My task</MenuItem>
                            </router-link> 
                            <router-link to="/emp_com_pro">
                                <MenuItem name="6">Running project</MenuItem>
                            </router-link> 
                    </MenuGroup>
                </Menu>
            </div>
            <!---===left side List END====---->
        </div>
    </div>
</template>