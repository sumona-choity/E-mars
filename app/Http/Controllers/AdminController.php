<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use App\Product;
use App\Photo;
use App\Category;
use App\SubCategory;
use App\Designation;
use App\Client;
use App\User;
use App\TaskPause;
use DB;
use \Validator;
use App\Project;
use App\AssignProject;
use App\AssignTask;
use App\EmployeeAttendance;
use App\ExtraOuting;

class AdminController extends Controller
{
    // seller product
    protected $url = "https://emers.com";
    public function upload(Request $request)
    {
        request()->file('img')->store('uploads');
        $pic= $request->img->hashName();
        $pic= $this->url."/uploads/$pic";
        /*update the profile pic*/
        //return Gallery::create($data);
        return response()->json([
            'imageUrl'=> $pic
        ],200);
    }
    public function validateProductName($request)
    {
        $validator = Validator::make($request->all(), [ 
            'name' => 'required|string|unique:products',
        ]);
      
        if ($validator->fails()) {
          return false;
        }
        return true;
    }
    public function storeProduct(Request $request){
        $data = $request->all();
        $link = $data['uploadList'];
        unset($data['uploadList']);
        // $videos = $data['videotList'];
        // unset($data['videotList']);
      $value =  $this->validateProductName($request);
      if($value==true){
            // $data['image'] = $uploadList[0]['url'];
            $product =  Product::create($data);
            $photo = []; 
            if(sizeof($link)>0){
                foreach ($link as  $value) {
                    $ob = [];
                    $ob['productId'] = $product->id;
                    $ob['link'] = $value['link'];
                    \Log::info($value);  
                    array_push($photo,$ob);
                }
                //  \Log::info($photo);   
                Photo::insert($photo); 
            }     
                $Product = Product::where('id',$product->id)->with('photo','category','Subcategory')->first();
                return response()->json([
                    'product' => $Product,
                    'success' => true
                ],200);
        }
        return response()->json([
            'message' => "This Product Name already been Taken!!",
            'success' => false
        ],422);
    }
    public function editProduct(Request $request){ 
        $data = $request->all();
        $link = $data['uploadList'];
        unset($data['uploadList']);
        // $videos = $data['videotList'];
        // unset($data['videotList']);
        // $data['image'] = $uploadList[0]['url'];
        $product =  Product::where('id',$data['id'])->update($data);
        $photo = []; 
        if(sizeof($link)>0){
            Photo::where('productId',$data['id'])->delete(); 
            foreach ($link as  $value) {
                $ob = [];
                $ob['productId'] = $data['id'];
                $ob['link'] = $value['link'];
                 \Log::info($value);  
                array_push($photo,$ob);
            }
            Photo::insert($photo);
        }
        // $photo = []; 
        // if(sizeof($videos)>0){
        //     Video::where('productId',$data['id'])->delete(); 
        //     foreach ($videos as  $value) {
        //         $ob = [];
        //         $ob['productId'] = $data['id'];
        //         $ob['link'] = $value['link'];
        //         $ob['type'] = $value['type'];
        //         //  \Log::info($value);  
        //         array_push($photo,$ob);
        //     }
        //     Video::insert($photo);
        // }
        // return  $product;
        $Product = Product::where('id',$data['id'])->with('photo','category','Subcategory')->first();
        return response()->json([
            'product' => $Product,
            'success' => true
        ],200);
    }
    public function deleteProduct (Request $request){
        $data = $request->all();
        $Product = Product::where('id',$data['id'])->with('photo')->delete();
        
        return response()->json([
            'product' => $Product,
            'success' => true
        ],200);
    }
    public function showProduct(Request $request){
        $key = $request->key;
        $total = $request->total;
        $search = $request->search;
        $order = $request->order;
        // return Product::all(); 
        $product = Product::with('photo','category','Subcategory')->where('name','like',"%$search%")->orderBy('id',"desc")->get();
        return response()->json([
            'product' => $product,
            'success' => true
        ],200);
    }

    public function indexCategory(Request $request){
        $key = $request->key;
        $total = $request->total;
        $Category = Category::all();
        return response()->json([
            'category' => $Category,
            'success' => true
        ],200); 
    }

    public function showsubCategoryforProduct(Request $request){
        $key = $request->key;
        $categoryId = $request->categoryId;
        $search = $request->search;
        // return Product::all(); 
        $subCategoryforProduct = SubCategory::where('categoryId',$categoryId)->get();
        return response()->json([
            'subCategoryforProduct' => $subCategoryforProduct,
            'success' => true
        ],200);
    }
    // Employee

    public function getMonthAbsent(Request $request, $id)
    {
        $date1 = $request->pre_month;
        $date2 = $request->current_month;
        $days = $request->days;
        $fridayCount = $request->fridayCount;
        // $ca = AssignTask::where('employee_id', '=', $id)->with('projects')->whereBetween('created_at', array($date1, $date2))->get();
        $ba = EmployeeAttendance::where('employee_id', '=', $id)->withCount('employee')->with('outings')->whereBetween('current_date', array($date1, $date2))->count();
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
    public function singleEmployee(Request $request,$id)
    {
        $date = $request->date;
        \Log::info($date);
        $ab = User::where('id', $id)->first();
        $ba = AssignProject::where('employee_id', $id)->with('projects')->get();
        $totalTaskDone = AssignTask::select(DB::raw( 'SUM(total_time) AS totalTime'))->where([['employee_id', $id],['status','Completed']])->whereDate('start_time',$date)->whereDate('end_time',$date)->first();
        $totalTaskPause = AssignTask::select(DB::raw( 'SUM(total_time) AS totalTime'))->where([['employee_id', $id],['status','Pause']])->whereDate('start_time',$date)->first();
        return response()->json([
                'User' => $ab,
                'AssignProject' => $ba,
                'totalTasTimekDone' => $totalTaskDone->totalTime+$totalTaskPause->totalTime
            ],200);
    }
    public function getSingleEmployeeStats(Request $request, $id)
    {
        $date1 = $request->date1;
        $date2 = $request->date2;
        $status = ($request->status)? $request->status: 'All';

        $ca = AssignTask::where('employee_id', $id)->with('projects')->whereBetween('created_at', array($date1, $date2));
        if($status != "All" ) $ca->where('status',$status);
        $task = $ca->orderBy('id','desc')->get();
        $da = EmployeeAttendance::where('employee_id', $id)->withCount('employee')->with('outings')->whereBetween('current_date', array($date1, $date2))->get();
        // $ba = EmployeeAttendance::where($id, '=', NULL)->withCount('employee')->whereBetween('current_date', array($date1, $date2))->get();
   
        return response()->json([
                'AssignTask' => $task,
                'EmployeeAttendance' => $da,
                // 'absent' => $ba,
            ],200);
    }
    public function showEmployee()
    {
        return User::with('designation')->get();
    }
    public function storeEmployee(Request $request)
    {
        $data = $request->all();
        $data['password'] = Hash::make($data['password']);
        $user =  User::create($data);
        return User::with("designation")->where('id',$user->id)->first();
    }
    public function editEmployee(Request $request){
        $data = $request->all();
        return User::where('id',$data['id'])->update($data);
    }
    public function deleteEmployee(Request $request){
        $data = $request->all();
        return User::where('id',$data['id'])->delete();
    }
    // Designation
    public function storeDesignation(Request $request)
    {
        $data = $request->all();
        return Designation::create($data);
    }
    public function showDesignation()
    {
        return Designation::all();
    }
    public function deleteDesignation(Request $request){
        $data = $request->all();
        return Designation::where('id',$data['id'])->delete();
    }
    public function editDesignation(Request $request){
        $data = $request->all();
        return Designation::where('id',$data['id'])->update($data);
    }

    // Client
    public function storeClient(Request $request)
    {
        $data = $request->all();
        return Client::create($data);
    }
    public function showClient()
    {
        return Client::all();
    }
    public function deleteClient(Request $request){
        $data = $request->all();
        return Client::where('id',$data['id'])->delete();
    }
    public function editClient(Request $request){
        $data = $request->all();
        return Client::where('id',$data['id'])->update($data);
    }

    // Project
    public function showrunningProject()
    {
        return Project::where('status', '=' , 'running')->with('client')->get();
    }
    public function showcompletedProject()
    {
        return Project::where('status', '=' , 'completed')->with('client')->get();
    }
    public function showProject(Request $request)
    {
        $status = $request->status;
        if($status){
            $status = explode(",",$status);
            \Log::info($status);
            return Project::whereIn('status',$status)->with('client','assignTask','assignTaskForCompleted')->get();
        }
        return Project::with('client','assignTask','assignTaskForCompleted')->get();
        
        
    }
    public function storeProject(Request $request)
    {
        $data = $request->all();
        $project =  Project::create($data);
        return Project::where('id',$project->id)->with('client')->orderBy('id','desc')->first();

    }
    public function deleteProject(Request $request){
        $data = $request->all();
        return Project::where('id',$data['id'])->delete();
    }
    public function editProject(Request $request){
        $data = $request->all();
        // return Project::where('id',$data['id'])->update($data);
         Project::where('id',$data['id'])->update($data);
         return Project::where('id', $data['id'])->with('client')->first();
    }

    // AssignProject
    
    
    public function showAssignproject(Request $request)
    {
         $project = ($request->project)? $request->project : 'All';
         $task = AssignProject::with('projects','employee');
         if($project !== "All") $task->where('project_id',$project);
         return $task->orderBy('id','desc')->get();

    }
    
    public function storeAssignproject(Request $request)
    {
        $data = $request->all();
        $AssignProject = AssignProject::create($data);
        return AssignProject::where('id',$AssignProject->id)->with('projects','employee')->orderBy('id','desc')->first();
    }
    public function deleteAssignproject(Request $request){
        $data = $request->all();
        return AssignProject::where('id',$data['id'])->delete();
    }
    public function editAssignproject(Request $request){
        $data = $request->all();
        // return Project::where('id',$data['id'])->update($data);
        AssignProject::where('id',$data['id'])->update($data);
         return AssignProject::where('id', $data['id'])->with('projects','employee')->first();
    }


    // AssignTask
    
    public function singleAssignTask($id)
    {
        // $ab = AssignTask::where('id', '=', $id)->first();
        // $ba = AssignProject::where('employee_id', '=', $id)->with('projects')->get();
        // return response()->json([
        //         'User' => $ab,
        //         'AssignProject' => $ba,
        //     ],200);

        $ba = AssignTask::where('project_id', '=', $id)->with('employee','projects')->get();
        return response()->json([
            'AssignTask' => $ba,
        ],200);
        // return AssignTask::with('projects','employee')->get();
    }
    public function allTaskByEmployee($id)
    {

       return AssignProject::where('employee_id', $id)
       ->with('projects','tasks')
        ->get();
        
        
    }
    public function showTaskListByEmployeeAndProject(Request $request){
        $employee_id =  ($request->employee_id)? $request->employee_id : 'All';
        $project_id =  ($request->project_id)? $request->project_id : 'All';
        $status = ($request->status)? $request->status : 'All';
         $task = AssignTask::select(DB::raw(' * , DATE_FORMAT(start_time, "%Y-%m-%d") AS group_time') )->with('projects','employee','lastpause');
         if($status !== "All") $task->where('status',$status);
         if($project_id !== "All") $task->where('project_id',$project_id);
         if($employee_id !== "All") $task->where('employee_id',$employee_id);
         $data = $task->whereNotNull('start_time')->orderBy('id','desc')->get();
         $value = $data->groupBy('group_time');
         $value = $value->toArray();
         return $value;
  
         
         
        
        
    }
    public function showAssignTask(Request $request)
    { 
         //return AssignTask::with('projects','employee','lastpause')->get();
         $status = ($request->status)? $request->status : 'All';
         $project = ($request->project)? $request->project : 'All';
         $employee_id = ($request->employee_id)? $request->employee_id : 'All';
         $task = AssignTask::with('projects','employee','lastpause','Pausess');
         if($status !== "All") $task->where('status',$status);
         if($project !== "All") $task->where('project_id',$project);
         if($employee_id !== "All") $task->where('employee_id',$employee_id);
         return $task->orderBy('id','desc')->get();
    }
    
    public function storeAssignTask(Request $request)
    {
        $data = $request->all();
        $AssignProject = AssignProject::firstOrCreate(
            ['project_id' => $data['project_id'],'employee_id' => $data['employee_id']]
        );
        $data['assign_task_id'] = $AssignProject->id;
        $AssignTask = AssignTask::create($data);
        return AssignTask::where('id',$AssignTask->id)->with('projects','employee')->orderBy('id','desc')->first();
    }
    public function editAssignTask(Request $request){
        $data = $request->all();
        // return Project::where('id',$data['id'])->update($data);
        AssignTask::where('id',$data['id'])->update($data);
        return AssignTask::where('id', $data['id'])->with('projects','employee','lastpause')->first();
    }
    public function deleteAssignTask(Request $request){
        $data = $request->all();
        return AssignTask::where('id',$data['id'])->delete();
    }

    public function showAttendance(Request $request){
        $date = $request->date;
        $str = $request->str;
        \Log::info($date);
        $data = EmployeeAttendance::with('employee','outings')->whereDate('current_date',$date);
          
        if($str) $data->whereHas('employee', function ($query) use ($str) {
            $query->where('name','like' , "%$str%");
        });
        else $data->with('employee');

        return $data->with('outings')->get();
    }
    
    public function storeAttendance(Request $request){
        $data = $request->all();
        $date = $data['current_date'];
        foreach($data['employee'] as $d){
            if($d['isSelected']== true){
                $id = $d['id'];
                $tdata['current_date'] = $date;
                $g = EmployeeAttendance::firstOrCreate(
                    ['employee_id' => $id,'current_date' => $date]
                );
            }
        }
        return EmployeeAttendance::where('current_date',$date)->with('employee','outings')->get();
    }
    public function editAttendance(Request $request){
        $data = $request->all();
        // return Project::where('id',$data['id'])->update($data);
        EmployeeAttendance::where('id',$data['id'])->update($data);
        return EmployeeAttendance::where('id', $data['id'])->with('employee','outings')->first();
    }
    public function deleteAttendance(Request $request){
        $data = $request->all();
        return EmployeeAttendance::where('id',$data['id'])->delete();
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
    public function editExtraOuting(Request $request){
        $data = $request->all();
        // return Project::where('id',$data['id'])->update($data);
        ExtraOuting::where('id',$data['id'])->update($data);
        return ExtraOuting::where('id', $data['id'])->with('employee')->first();
    }
    public function deleteExtraOuting(Request $request){
        $data = $request->all();
        return ExtraOuting::where('id',$data['id'])->delete();
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
        return AssignTask::where('id',$data['task_id'])->with('projects','employee','lastpause')->first();
    }
    public function startTask(Request $request){
        $data = $request->all();
        TaskPause::where('id',$data['id'])->update($data);
        AssignTask::where('id',$data['task_id'])->update([
            'status' => 'Running'
        ]);
        return AssignTask::where('id',$data['task_id'])->with('projects','employee','lastpause')->first();
    }
   

    
}
