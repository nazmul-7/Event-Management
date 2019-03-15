<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Auth;
use App\User;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
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
            return response()->json([
                'msg' => "Email doesn't exist!",
            ],422);
        }
        $flag = User::where([['email',$request->email],["isActive",0]])->count();
        if($flag){
            return response()->json([
                'msg' => "Please Wait for the Admin Activation!",
            ],422);
        }

        if (Auth::attempt(['email' => $request->email, 'password' => $request->password ])) {
           return Auth::user(); 
         }
         else{
            return response()->json([
                'msg' => "Password doen't match!",
            ],422);
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
        
        // get the row from reset table matching this token  http://event-booking.test/passwordreset/check?token=$2y$10$KRDnLaCXFF.JIBUGGaiMWOn1EN8jrtXIVsG3W.a3NMsxiOOIBNcdy
        $isTokenFound = \DB::table('password_resets')->where('token',$token)->first();
        // if token is valid return data only like this 
        if(!$isTokenFound){
            return response()->json([
                'msg' => "token doesn't exist!",
            ],401);
        }
        return response()->json([
            "token"=>$isTokenFound,
        ],200);
    }
    public function resetPassword(Request $request){
        
        $this->validate($request, [
            'password' => 'required|string|min:6|confirmed',
        ]);

        $flag = User::where("email",$request->email)->update(['password' => Hash::make($request->password)]);
        if(!$flag){
            return response()->json([
                'msg' => "Email doesn't exist!",
            ],401);
        }

        return \DB::table('password_resets')->where('email',$request->email)->delete();
         
           
        }


        // Profile 

    public function getProfileInfo($id){
        return User::where('id',$id)->first();
    }

    public function updateUserInfo(Request $request){
        if(!Auth::check()){
           return response()->json([
             'message' => "You are not Authenticate User!",
           ], 402);
        }
        $id = Auth::user()->id;
        $data = $request->all();
        if($id!=$data['id']){
           return response()->json([
              'message' => "You are not Authenticate User!",
            ], 402);
  
        }
        return User::where('id',$id)->update($data);
    }
    public function getUserImage(Request $request){
        if(!Auth::check()){
           return response()->json([
             'message' => "You are not Authenticate User!",
           ], 402);
        }
        $id = Auth::user()->id;
        request()->file('img')->store('uploads');
        $pic= "/uploads/".$request->img->hashName();
        $data =[
           'image' => $pic,
        ];
        User::where('id',$id)->update($data);
        return $pic;
        
    }


    // contact us 
    public function contactus(Request $request){
        $this->validate($request, [
            'email' => 'required|string|max:255|email',
        ]);
        \Log::info($request->all());
        return response()->json([
            'message' => "Message has been sent!",
          ], 200);
    }

    
    
}
