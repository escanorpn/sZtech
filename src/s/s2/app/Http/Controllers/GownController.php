<?php

namespace App\Http\Controllers;

use App\Models\gown;
use Illuminate\Http\Request;
use DB;

class GownController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $s="student";
        $users = DB::table('users')
        ->where('role', '=', $s)
        ->select( 'id','email','code','number')
        ->get();
        return response()->json([
        "success" => true,
        "message" => "Item List",
        "val" => "2",
        "user" => $users,
        ]);
    }
    public function StudentGowns()
    {
        $users = DB::table('users')
            ->join('gowns', 'users.id', '=', 'gowns.sid')
            ->select('users.id','users.email', 'users.code','users.number',  'gowns.status','gowns.name',)
            ->distinct()->get();
     
        return response()->json([
        "success" => true,
        "message" => "Item List",
        "val" => "2",
        "user" => $users,
        // "data" => $item,
        ]);
    }
    public function Userdata(Request $request)
    {
     
        $item = DB::table('gowns')
        ->where('sid', '=', $request->id)
        ->select( 'name', 'status','id','sid')
        ->get();
        
        $user = DB::table('users')
        ->where('id', '=', $request->id)
        ->select( '*')
        ->get();
        // $user->data=$item;
        return response()->json([
        "success" => true,
        "message" => "Item List",
        "val" => "2",
        "user" => $user,
        "data" => $item,
        ]);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
  
        public function create(Request $request)
        {
            $response = [];
            $uid=$request->uid;
    
            $item = new Gown;
            $item->sid = $request->sid;
            $item->name =$request->name;
            // $item->value = $request->value;
            $item->save();
    
            return response()->json([
                    "success" => true,
                    "val" => "2",
                    "message" => "Financial record successfully uploaded",
                    // "file" => $file
                ]);
            return response()->json($response);
        }
    
 

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\gown  $gown
     * @return \Illuminate\Http\Response
     */
    public function show(gown $gown)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\gown  $gown
     * @return \Illuminate\Http\Response
     */
    public function edit(gown $gown)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\gown  $gown
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $response = [];
        $ids1=json_decode($request->ids);
        $affected=Gown::whereIn('id', $ids1)->update(['status' => "returned"]);
        return response()->json([
            "success" => true,
            "val" => "2", 
            "message" => "Gown successfully updated",
            "affected" => $affected
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\gown  $gown
     * @return \Illuminate\Http\Response
     */
    public function destroy(gown $gown)
    {
        //
    }
}
