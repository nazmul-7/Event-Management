<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Event;
use App\User;
use App\Application;
use Auth;
use DB;
use DateTime;
use Carbon\Carbon;

class EventController extends Controller
{
    // Registration

    public function eventRegistration(Request $request){
        $data = $request->all();
       
        if(!Auth::check()){
         return response()->json([
                 'message' => "You are not Authenticate User!",
             ], 401);
        }

        if(Auth::user()->position!='admin'){
         return response()->json([
                 'message' => "You are not Authenticate User!",
             ], 402);
        }
        $data['user_id'] = Auth::user()->id;
        $start =  new DateTime($data['timeSlot'][0]);
        $end =  new DateTime($data['timeSlot'][1]);
        $data["timeSlot"] =  $start->format('h').":".$start->format('i').' '.$start->format('A')." - ".$end->format('h').":".$end->format('i').' '.$end->format('A');
        \Log::info($data);
        return Event::create($data);
    }
    public function eventUpdate(Request $request){
        $data = $request->all();
       
        if(!Auth::check()){
         return response()->json([
                 'message' => "You are not Authenticate User!",
             ], 401);
        }

        if(Auth::user()->position!='admin'){
         return response()->json([
                 'message' => "You are not Authenticate User!",
             ], 402);
        }
        $data['user_id'] = Auth::user()->id;
        $start =  new DateTime($data['timeSlot'][0]);
        $end =  new DateTime($data['timeSlot'][1]);
        $data["timeSlot"] =  $start->format('h').":".$start->format('i').' '.$start->format('A')." - ".$end->format('h').":".$end->format('i').' '.$end->format('A');
        \Log::info($data);
        return Event::where("id",$data['id'])->update($data);
    }
    public function getRunningEvents(){
        $uid = Auth::user()->id;
        $data =  Event::where('status','runningWeek')->withCount('applications')
                    ->with(array('hasApplied' => function($query) use ($uid)
                    {
                        $query->where('user_id', $uid);
                        $query->select('id', 'event_id', 'user_id');
                    
                    }))
                    ->get();
        if(Auth::user()->position!='valet'){
            return $data;
        }
        $scheduleData = [];
        foreach ($data as $key => $item) {
            $visibleInSeconds = $item->visibleAfter*3600;
            $startTime = Carbon::parse(Carbon::now());
            $finishTime = Carbon::parse($item->created_at);
            $diff=$finishTime->diffInSeconds($startTime);
            if($diff>$visibleInSeconds){
                \Log::info('is ok');
                array_push($scheduleData, $item);
            }
        }

      
        return $scheduleData;
    }
    public function applyInEvent(Request $request){
        if(!Auth::check()){
            return response()->json([
              'message' => "You are not Authenticate User!",
           ], 401);
        }
        $data = $request->all();
        $id = Auth::user()->id;
        $workLimit = [
            "manager" => 40,
            "super" => 30,
            "valet" => 20,
        ];
        $totalHoursWorked = $this->getTotalWokingHoursC();
        \Log::info($totalHoursWorked);
        if($workLimit[Auth::user()->position] <= $totalHoursWorked){
            if(!Auth::check()){
                return response()->json([
                  'message' => "You have crossed your work limit!",
               ], 401);
            }
        }
        $data['user_id'] = $id;
        return Application::create($data);
    }
    public function getTotalWokingHours(){
        $id = Auth::user()->id;
        $allTime =  Application::where("user_id",$id)->sum('totalHoursApplied');
        $runningTime =  $this->getTotalWokingHoursC();
        return response()->json([
            'allTime' => $allTime,
            'runningTime' => $runningTime,
         ], 200);
    }
    public function getTotalWokingHoursC(){
        $id = Auth::user()->id;
        return Application::where([["user_id",$id],['status','runningWeek']])->sum('totalHoursApplied');
    }
    public function getServiceDetails(Request $request){
        
        return Event::where("id",$request->id)->first();
    }
    public function getWorkingEventList(){
        $id = Auth::user()->id;
        return Application::where("user_id",$id)->with('event')->orderBy('id','DESC')->get();
    }
    public function getAllWorkingEventList(){
     
        return Event::where('status',"runningWeek")->orderBy('id','DESC')->get();
    }
    public function getUserList(){
     
        return User::all();
    }
    public function getAllOldEventList(){
       
        return Event::where('status',"oldWeek")->orderBy('id','DESC')->get();
    }
    public function updateEventStatus(Request $request){
        if(!Auth::check()){
            return response()->json([
              'message' => "You are not Authenticate User!",
           ], 401);
        }
        if(Auth::user()->position !='admin'){
            return response()->json([
              'message' => "You are not Authenticate User!",
           ], 401);
        }

        $data['status'] = 'oldWeek';
        Application::where("status",'runningWeek')->update($data);
        return Event::where("status",'runningWeek')->update($data);
    }
    public function updateUser(Request $request){
        $data = $request->all();
        if(!Auth::check()){
            return response()->json([
              'message' => "You are not Authenticate User!",
           ], 401);
        }
        if(Auth::user()->position !='admin'){
            return response()->json([
              'message' => "You are not Authenticate User!",
           ], 401);
        }
        return User::where("id",$data['id'])->update($data);
    }
    public function deleteUser(Request $request){
        $data = $request->all();
        if(!Auth::check()){
            return response()->json([
              'message' => "You are not Authenticate User!",
           ], 401);
        }
        if(Auth::user()->position !='admin'){
            return response()->json([
              'message' => "You are not Authenticate User!",
           ], 401);
        }
        return User::where("id",$data['id'])->delete();
    }
}
