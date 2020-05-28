import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)



import login from '../components/login.vue';
import passwordresetGetEmail from '../components/passwordresetGetEmail.vue';
import passwordreset from '../components/passwordreset.vue';
import registration from '../components/registration.vue';

import seller_dashboard from '../pages/seller/seller_dashboard'
import seller_profile from '../pages/seller/seller_profile'
import seller_productList from '../pages/seller/seller_productList'
import user_attendance from '../pages/user_attendance'
import add_project from '../pages/add_project'
import running_project from '../pages/admin/running_project'
import project_details from '../pages/admin/project_details'
import user_project_details from '../pages/project_details'
import user_dashboard from '../pages/user_dashboard'
import profile from '../pages/profile'
import attendance from '../pages/admin/attendance'
import admin_dashboard from '../pages/admin/admin_dashboard'
import emp_profile from '../pages/admin/emp_profile'
import emp_details from '../pages/admin/emp_details'
import assign_project from '../pages/admin/assign_project'
import assign_task from '../pages/admin/assign_task'
import completed_project from '../pages/admin/completed_project'
import emp_run_pro from '../pages/emp_run_pro'
import emp_com_pro from '../pages/emp_com_pro'
import task_list from '../pages/admin/task_list'
import daily_task from '../pages/admin/dailyTask'
import all_project from '../pages/admin/all_project'
import all_client from '../pages/admin/all_client'
import my_task from '../pages/my_task'
import designation from '../pages/admin/designation'
import profile_edit from '../pages/profile_edit'
import user_Daily_task from '../pages/user_Daily_task'




export default new Router({
  mode: 'history',
  routes: [

    {
      path: '/login',
      name: 'login',
      component: login,
      meta: {
          guest: true,
          allowedUserType: ['All'],
          title: 'Login',
      }

    },
    {
      path: '/passwordresetGetEmail',
      name: 'passwordresetGetEmail',
      component: passwordresetGetEmail,
      meta: {
          guest: true,
          allowedUserType: ['All'],
          title: 'Password Reset',
      }

    },
    {
      path: '/passwordreset/:token',
      name: 'passwordreset',
      component: passwordreset,
      meta: {
          guest: true,
          allowedUserType: ['All'],
          title: 'Password Reset Field',
      }

    },
    {
      path: '/registration',
      name: 'registration',
      component: registration,
      meta: {
          guest: true,
          allowedUserType: ['All'],
          title: 'Registration',
      }

    },
    {
      path: '/user_Daily_task',
      name: 'user_Daily_task',
      component: user_Daily_task,
      meta: {
          guest: true,
          allowedUserType: ['All'],
          title: 'User Daily Task',
      }

    },
    {
      path: '/seller',
      name: 'seller_dashboard',
      component: seller_dashboard,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'Seller dashboard',
      }
    },
    
    {
      path: '/seller/seller_profile',
      name: 'seller_profile',
      component: seller_profile,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'Seller profile',
      }
    },
    {
      path: '/seller/seller_productList',
      name: 'seller_productList',
      component: seller_productList,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'seller_productList',
      }
    },
    {
      path: '/',
      name: 'user_dashboard',
      component: user_dashboard,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'User Dashboard',
      }
    },

    {
      path: '/user_attendance',
      name: 'user_attendance',
      component: user_attendance,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'user_attendance',
      }
    },
    {
      path: '/admin/add_project',
      name: 'add_project',
      component: add_project,
      meta: {
        guest: false,
        allowedUserType: ['All'],
        title: 'Add Project',
      }
    },
    {
      path: '/admin/running_project',
      name: 'running_project',
      component: running_project,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'Running Project',
      }
    },
    {
      path: '/admin/project_details/:id', 
      name: 'project_details',
      component: project_details,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'Project Detail',
      }
    },
    {
      path: '/user_project_details/:id', 
      name: 'user_project_details',
      component: user_project_details,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'user project details',
      }
    },
    
    {
      path: '/profile',
      name: 'profile',
      component: profile,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'Profile',
      }
    },
    { 
      path: '/admin/attendance',
      name: 'attendance',
      component: attendance,
      meta: {
        guest: false,
        allowedUserType: ['All'],
        title: 'Attendance',
      }
    },
    {
      path: '/admin',
      name: 'admin_dashboard',
      component: admin_dashboard,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'Admin Dashboard',
      }
    } ,
    {
      path: '/admin/emp_profile',
      name: 'emp_profile',
      component: emp_profile,
      meta: {
        guest: false,
        allowedUserType: ['All'],
        title: 'Employee Profile',
      }
    },
    {
      path: '/admin/emp_details/:id',
      name: 'emp_details',
      component: emp_details,
      meta: {
        guest: false,
        allowedUserType: ['All'],
        title: 'Employee Detail',
      }
    },
    {
      path: '/admin/assign_project',
      name: 'assign_project',
      component: assign_project,
      meta: {
        guest: false,
        allowedUserType: ['All'],
        title: 'Assign Project',
      }
    },
    {
      path: '/admin/assign_task',
      name: 'assign_task',
      component: assign_task,
      meta: {
        guest: false,
        allowedUserType: ['All'],
        title: 'Assign Task',
      }
    },
    {
      path: '/admin/daily_task',
      name: 'daily_task',
      component: daily_task,
      meta: {
        guest: false,
        allowedUserType: ['All'],
        title: 'Daily Task',
      }
    },
    {
      path: '/admin/completed_project',
      name: 'completed_project',
      component: completed_project,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'Completed Project',
      }
    },
    {
      path: '/emp_run_pro',
      name: 'emp_run_pro',
      component: emp_run_pro,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'Employee Running Project',
      }
    },
    {
      path: '/emp_com_pro',
      name: 'emp_com_pro',
      component: emp_com_pro,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'Employee Completed Project',
      }
    },
    {
      path: '/admin/task_list',
      name: 'task_list',
      component: task_list,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'Task List',
      }
    },
    {
      path: '/admin/all_project',
      name: 'all_project',
      component: all_project,
      meta: {
        guest: false,
        allowedUserType: ['All'],
        title: 'All Project',
      }
    },
    {
      path: '/admin/all_client',
      name: 'all_client',
      component: all_client,
      meta: {
        guest: false,
        allowedUserType: ['All'],
        title: 'All Client',
      }
    },
    {
      path: '/my_task',
      name: 'my_task',
      component: my_task,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'My Task',
      }
    },
    {
      path: '/admin/designation',
      name: 'designation',
      component: designation,
      meta: {
        guest: false,
        allowedUserType: ['All'],
        title: 'Designation',
      }
    },
    {
      path: '/profile_edit/:id',
      name: 'profile_edit',
      component: profile_edit,
      meta: {
        guest: true,
        allowedUserType: ['All'],
        title: 'Edit Profile',
      }
    }

  ],

});