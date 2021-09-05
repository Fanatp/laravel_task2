<?php

namespace App\Http\Controllers;

use App\Models\Institut;
use App\Models\Profession;
use App\Models\Skill;
use App\Models\User;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class ApiController extends Controller
{
    public function login(Request $request){
        $field = $request->validate([
            'email' => 'required',
            'password'=> 'required',
        ],[
            'email.reauired' => 'Email має бути вкзааним!',
            'password.reuired' => ' :attribute має бути вказаним!',
        ]);

        $user = User::where('email', $field['email'])->first();

        if(!$user || !Hash::check($field['password'], $user->password)){

            return $this->onError(401, 'password is bad');
        }

        $token = $user->createToken('auth_token')->plainTextToken;

        $respons = [
            'user_name' => $user->name,
            'user_email' => $user->email,
            'token' => $token,
        ];

        return $this->onSuccess($respons, "Login success");
    }

    protected function onSuccess($data,  $message = '',  $code = 200)
    {
        return response()->json([
            'status' => $code,
            'message' => $message,
            'data' => $data,
        ], $code);
    }

    protected function onError( $code,  $message = '')
    {
        return response()->json([
            'status' => $code,
            'message' => $message,
        ], $code);
    }

    public function answer(Request $request){
        $skils = Skill::all();
        $insts = Institut::all();
        $request = $request->all();
        $data = array();
        $proff = array();
        $proff_id = array();
        $institut = array();
        foreach ($request as $item) {
//            $data[] = $item;

            foreach ($skils as $skill) {

                if($skill->id == $item){
                    if(!in_array($skill->name, $data)) $data[] = $skill->name;

                    foreach ($skill->professions as $profession) {
                        if(!in_array($profession->id, $proff_id))  $proff_id[] = $profession->id;
                        if(!in_array($profession->name, $proff))  $proff[] = $profession->name;
                    }
                }
            }

        }

        foreach ($insts as $inst) {
            foreach ($inst->professions as $profession) {
                foreach ($proff_id as $id) {
                    if($profession->id == $id){
                        if(!in_array($inst->name , $institut))  $institut[] = $inst->name;
                    }
                }


            }

        }



        $full_data = [
            'skill' => $data,
            'profession'=> $proff,
            'institut'=> $institut,
        ];

        return $this->onSuccess( $full_data, 'Ok');
    }

    public function skills(Request $request)
    {

        $skills = DB::table('skills')->get();
        if ($skills){
            return $this->onSuccess($skills, 'Навики');
        }
        return $this->onError(401, 'Unauthorized Access');

    }
}
