<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Auth;
use DB;
use App\User;
use App\Project;
use App\AssignProject;
use App\AssignTask;
use App\TaskPause;
use App\ExtraOuting;
use App\EmployeeAttendance;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function getMonthAbsent(Request $request)
    {
        $date1 = $request->pre_month;
        $date2 = $request->current_month;
        $days = $request->days;
        $fridayCount = $request->fridayCount;
        $user_id = Auth::user()->id;
        // $ca = AssignTask::where('employee_id', '=', $id)->with('projects')->whereBetween('created_at', array($date1, $date2))->get();
        $ba = EmployeeAttendance::where('employee_id', '=', $user_id)->withCount('employee')->with('outings')->whereBetween('current_date', array($date1, $date2))->count();
        // $q = EmployeeAttendance::where('employee_id', '=', $id)->whereBetween('current_date', array($date1, $date2))->count();
        $day = $days - $fridayCount;
        $c = $day - $ba;
        return response()->json([
                // 'User' => $ab,
                 'presence' => $ba,
                 'ab' => $c,
                 'day' => $day
            ],200);
    }
    public function singleEmployee(Request $request)
    {
        $date = $request->date;
        $user_id = Auth::user()->id;
        \Log::info($date);
        // $ab = User::where('id', $id)->first();
        // $ba = AssignProject::where('employee_id', $id)->with('projects')->get();
        $totalTaskDone = AssignTask::select(DB::raw( 'SUM(total_time) AS totalTime'))->where([['employee_id', $user_id],['status','Completed']])->whereDate('start_time',$date)->whereDate('end_time',$date)->first();
        $totalTaskPause = AssignTask::select(DB::raw( 'SUM(total_time) AS totalTime'))->where([['employee_id', $user_id],['status','Pause']])->whereDate('start_time',$date)->first();
        return response()->json([
                // 'User' => $ab,
                // 'AssignProject' => $ba,
                'totalTasTimekDone' => $totalTaskDone->totalTime+$totalTaskPause->totalTime
            ],200);
    }
    public function home(Request $request){
        
        if(!Auth::check()){
            \Log::info("i am here Not Auth!");
            return redirect('/login');
        }
        
        
        if($request->segment(1)=='admin'){
           
            
            if(Auth::user()->user_type=='Admin'){
                return view('/admin');
                
            }
            return redirect('/');
           
        }
        if($request->segment(1)=='seller'){
           
            
            if(Auth::user()->user_type=='Seller'){
                return view('/seller');
                
            }
            return redirect('/');
           
        }

        
        return view('welcome');

    }

    // Project

    public function showUserDashboardProject(Request $request)
    {
        // $data = $request->all();
        // $user_id = Auth::user()->id;
        // return Project::where('employee_id',$user_id)->with('client')->get();

        // $status = $request->status;
        $user_id = Auth::user()->id;
        
        return AssignProject::where('employee_id',$user_id)->with('projects.client','projects.assignTask','projects.assignTaskForCompleted')->get();
        
    }

    public function showProject(Request $request){
        $status = ($request->status)? $request->status : 'All';
        $user_id = Auth::user()->id;
        if($status == 'All'){
            return  AssignProject::where('employee_id',$user_id)->with('projects.client','projects.assignTask','projects.assignTaskForCompleted')->get();
        }
        else{
            return  AssignProject::whereHas('projects',function ($query) use ($status) {
                $query->where('status',$status);
            })->where('employee_id',$user_id)->with('projects.client','projects.assignTask','projects.assignTaskForCompleted')->get();
        }
        
        
    }
    public function showsingleProfile($id)
    {
        return User::where('id', '=' , $id)->first();
    }

    // Employee task

    public function showEmployeeTask(Request $request)
    {
        $status = ($request->status)? $request->status : 'All';
        $data['employee_id'] = Auth::user()->id;
        \Log::info("Yes Yes");
        if($status == "All") return AssignTask::where('employee_id',$data['employee_id'])->with('projects','lastpause','Pausess')->orderBy('id','desc')->get();
        return AssignTask::where('status',$status)->where('employee_id',$data['employee_id'])->with('projects','lastpause','Pausess')->orderBy('id','desc')->get();
    }
    public function storeEmployeeTask(Request $request)
    {
        $data = $request->all();
        $data['employee_id'] = Auth::user()->id;
        $AssignProject = AssignProject::firstOrCreate(
            ['project_id' => $data['project_id'],'employee_id' => $data['employee_id']]
        );
        $data['assign_task_id'] = $AssignProject->id;
        
        $AssignTask = AssignTask::create($data);
        
        return AssignTask::where([['id',$AssignTask->id], ['employee_id',$data['employee_id']]])->with('projects','lastpause')->orderBy('id','desc')->first();
    }
    public function editEmployeeTask(Request $request){
        $data = $request->all();
        $data['employee_id'] = Auth::user()->id;
        // return Project::where('id',$data['id'])->update($data);
        AssignTask::where('id',$data['id'])->update($data);
        return AssignTask::where([['id', $data['id']],['employee_id',$data['employee_id']]])->with('projects','lastpause')->first();
    }
    public function deleteEmployeeTask(Request $request){
        $data = $request->all();
        return AssignTask::where('id',$data['id'])->delete();
    }
    // Login && Registration

    public function registration(Request $request){
        $this->validate($request, [
            'firstName' => 'required|string|max:255',
            'lastName' => 'required|string|max:255',
            'position' => 'required',
            'email' => 'required|string|max:255|email|unique:users',
            'password' => 'required|string|min:6|confirmed',
           
        ]);
        $data = $request->all();
        $data['password'] = Hash::make($data['password']);
        return User::create($data);
    }

    public function login(Request $request){
        if((User::where('email', $request->email)->count())==0){
            // return response()->json([
            //     'msg' => "Email doesn't exist!",
            // ],422);
            // Session::flash('error', 'Some thing is wrong. Please try again');
            // Redirect::to("/login");
           
            
            return redirect("/login")->with('message','Email doesnt exist!');
        }

        if((User::where([['email', $request->email],['isActive' , 1 ]])->count())==0){
            return redirect("/login")->with('message','Please Wait for the Admin Activation!');
            // return response()->json([
            //     'msg' => "Please Wait for the Admin Activation!",
            // ],422);
        }
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password ])) {
          
         if(Auth::user()->user_type == "Seller"){
            return  redirect("/seller");
           }
           else if(Auth::user()->user_type == "Admin"){
            return redirect("/admin");
           }
           else {
            return  redirect("/");
           }
         }
         else{
            return redirect("/login")->with('message',"Password doesn't match");
          
         }
    }


    // Password Reset

    public function passwordresetGetEmail(Request $request){
        $isFound = User::where('email',$request->email)->count();

        if($isFound==0){
            return response()->json([
                'msg' => "Email doesn't exist!",
            ],401);
        }
       
            $token=str_random(30);
            $token = \Hash::make($token);
            \Log::info($token);
            \DB::table('password_resets')->where('email',$request->email)->delete();
            $savedData = \DB::table('password_resets')->insert([
                'email' => $request->email,
                'token' => $token, //change 60 to any length you want
                'created_at' => \Carbon\Carbon::now()
            ]);

                // Mail::to($request->email)
                // ->send(new Passwrordreset($savedData));

              return response()->json([
                'msg' => "password reset link has been Sent!",
            ],200);
    }

    public function matchPasswordLink(Request $request){
        $token = $request->token;
        \Log::info("Token is running");
        // get the row from reset table matching this token  http://laravel-vue-authentication.test/passwordreset/$2y$10$D8PB0yYEkbapLjjyFOgozus3BG3.RpBNDgWJJ/hPjFFu9zKDqrQPO
        $isTokenFound = \DB::table('password_resets')->where('token',$token)->first();
        // if token is valid return data only like this 
        if(!$isTokenFound){
            return response()->json([
                'msg' => "token doesn't exist!",
            ],401);
        }
        return $isTokenFound;
    }
    public function resetPassword(Request $request){
        $this->validate($request, [
            'password' => 'required|string|min:6|confirmed',
        ]);

        $flag = User::where("id",1)->update(['password' => Hash::make($request->password)]);
        if(!$flag){
            return response()->json([
                'msg' => "Email doesn't exist!",
            ],401);
        }

        \DB::table('password_resets')->where('email',$request->email)->delete();
        return $flag;
           
    }
    public function changePassword(Request $request){
        $user =  Auth::user();
        $user->makeVisible('password');
        
         $data = $request->all();
         if(!Hash::check($request->old_password, $user->password)){
             return response()->json([
                 'msg' => 'Old password is not correct.', 
                 'success' => false
             ],401);
         }
         $password = bcrypt($data['password']); 
         return User::where('id', $user->id)->update(['password' => $password]);
 
        
     }
     public function updateProfile(Request $request){
        $data = $request->all();
        \Log::info($data);
        return User::where('id',$data['id'])->update($data);
    }
    
    // User Attendence
    public function showEmployeeAttendance(Request $request){
        $date = $request->date;
        
        $user_id = Auth::user()->id;
        $data =  EmployeeAttendance::with('employee','outings')->where('employee_id',$user_id);
          
        if($date)  $data->whereDate('current_date',$date);

        return $data->orderBy('id','desc')->first();
    }


    public function showExtraOuting(Request $request)
    {
        $date = $request->date;
        \Log::info($date);
        return ExtraOuting::with('employee')->whereDate('current_date',$date)->get();
    }
    
    public function storeExtraOuting(Request $request)
    {
        $data = $request->all();
        $ExtraOuting = ExtraOuting::create($data);
        return ExtraOuting::where('id',$ExtraOuting->id)->with('employee')->first();
    }

    // Pause Start
   
    
    public function pauseTask(Request $request)
    {
        $data = $request->all();
        $total_time = $data['total_time'];
        unset($data['total_time']);
        $taskpause =  TaskPause::create($data);
        AssignTask::where('id',$data['task_id'])->update([
            'total_time' =>  DB::raw("total_time + $total_time"),
            'status' => 'Pause'
        ]);
        return AssignTask::where('id',$data['task_id'])->with('projects','lastpause')->first();
    }
    public function startTask(Request $request){
        $data = $request->all();
        TaskPause::where('id',$data['id'])->update($data);
        AssignTask::where('id',$data['task_id'])->update([
            'status' => 'Running'
        ]);
        return AssignTask::where('id',$data['task_id'])->with('projects','lastpause')->first();
    }

    
    // public function storeEmployeeAttendance(Request $request){
    //     $data = $request->all();
    //     $date = $data['current_date'];
    //     foreach($data['employee'] as $d){
    //         if($d['isSelected']== true){
    //             $id = $d['id'];
    //             $tdata['current_date'] = $date;
    //             $g = EmployeeAttendance::firstOrCreate(
    //                 ['employee_id' => $id,'current_date' => $date]
    //             );
    //         }
    //     }
    //     return EmployeeAttendance::where('current_date',$date)->with('employee','outings')->get();
    // }
    // public function editEmployeeAttendance(Request $request){
    //     $data = $request->all();
    //     // return Project::where('id',$data['id'])->update($data);
    //     EmployeeAttendance::where('id',$data['id'])->update($data);
    //     return EmployeeAttendance::where('id', $data['id'])->with('employee','outings')->first();
    // }
    // public function deleteEmployeeAttendance(Request $request){
    //     $data = $request->all();
    //     return EmployeeAttendance::where('id',$data['id'])->delete();
    // }


    public function upload(Request $request)
    {
       \Log::info($request->all());
        
        request()->file('img')->store('uploads');
        $pic= $request->img->hashName();
        $pic= "/uploads/$pic";
        /*update the profile pic*/
        //return Gallery::create($data);
        return response()->json([
            'imageUrl'=> $pic
        ],200);
    }

    
}
