<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Models\user;

class student extends Controller
{
    public function getData(Request $request)
    {
    
        $user = DB::table('users')
        ->where('id', '=', $request->id)
        ->select( '*')
        ->get();
        return response()->json([
        "success" => true,
        "message" => "Item List",
        "val" => "2",
        "user" => $user,
        ]);
    }

    public function updateData(Request $request)
    {
        $response = [];
        $id=$request->id;
        $name=$request->name;
        $email=$request->email;
        $number=$request->number;
        $affected=User::where('id', $id)->update(['name' => $name,'email' => $email,'number' => $number]);
        return response()->json([
            "success" => true,
            "val" => "2", 
            "message" => "User successfully updated",
            "affected" => $affected
        ]);
    }

    public function libData(Request $request)
    {
        $item = DB::table('libs')
        ->where('sid', '=', $request->id)
        ->select( 'name', 'value','id','sid')
        ->get();
        return response()->json([
        "success" => true,
        "message" => "Item List",
        "val" => "2",
        "item" => $item,
        ]);
    }

    public function financeData(Request $request)
    {
        $item = DB::table('finances')
        ->where('sid', '=', $request->id)
        ->select( 'name', 'value','id','sid')
        ->get();
        return response()->json([
        "success" => true,
        "message" => "Item List",
        "val" => "2",
        "item" => $item,
        ]);
    }
    
    public function gownData(Request $request)
    {
        $item = DB::table('gowns')
        ->where('sid', '=', $request->id)
        ->select( 'name', 'status','id','sid')
        ->get();
        return response()->json([
        "success" => true,
        "message" => "Item List",
        "val" => "2",
        "item" => $item,
        ]);
    }
}
