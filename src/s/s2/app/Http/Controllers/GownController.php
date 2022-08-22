<?php

namespace App\Http\Controllers;

use App\Models\gown;
use App\Models\user;
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
        ->where('admission', 'admitted') 
        // ->select( 'id','email','code','name')
        ->get();
        return response()->json([
        "success" => true,
        "message" => "Item List",
        "val" => "2",
        "data" => $users,
        ]);
    }
    public function all()
    {
        
        $s="student";
        $users = DB::table('users')
        ->where('role', '=', $s )
        // ->where('admission', 'admitted') 
        // ->select( 'id','name','email','code','number')
        ->get();
        return response()->json([
        "success" => true,
        "message" => "Item List",
        "val" => "2",
        "data" => $users,
        // "data" => $item,
        ]);
    }
    public function StudentGowns()
    {
        $users = DB::table('users')
            ->join('gowns', 'users.id', '=', 'gowns.sid')
            ->select('users.id','users.email', 'users.code','users.name','users.gowns',  'gowns.created_at',)
            ->distinct()->get();
     
        return response()->json([
        "success" => true,
        "message" => "Item List",
        "val" => "2",
        "data" => $users,
        // "data" => $item,
        ]);
    }
    public function Userdata(Request $request)
    {
     
        $item = DB::table('gowns')
        ->where('sid', '=', $request->id)
        ->select( 'name', 'status','id','sid','created_at')
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
            $item1="";
            $val=2;
            $uid=$request->uid;
    
            $item = new Gown;
            $item->sid = $request->sid;
            $item->name =$request->name;
            
            $issue = DB::table('gowns')
            ->where('sid', '=', $request->sid)
            ->where('name', '=',$request->name)
            ->count();
            User::where('id', $request->sid)->update(['gowns' => $request->name]);
            if($issue>0){
                $val=22;
             
            }else{
                $item->save();
                $item1 = DB::table('gowns')
                ->where('sid', '=', $request->sid)
                ->select( 'name', 'status','id','sid','created_at')
                ->get();
            }

            
    
            return response()->json([
                    "success" => true,
                    "val" =>  $val,
                    "message" => "Gowns record successfully added",
                    "data" => $item1
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
    public function switch(Request $request)
    {
        $response = [];
        $affected=User::where('id', $request->sid)->update(['gown' => $request->switch]);
        $gown = DB::table('users')
        ->where('id', '=', $request->sid)
        ->select( 'gown')
        ->get();
        return response()->json([
            "success" => true,
            "val" => "2", 
            "message" => "Gown successfully updated",
            "affected" => $affected,
            "switch" => $gown,

        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\gown  $gown
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $response = [];
        Gown::destroy($request->id);

        $item1 = DB::table('gowns')
        ->where('sid', '=', $request->sid)
        ->select( 'name', 'status','id','sid','created_at')
        ->get();

    

        return response()->json([
            "success" => true,
            "val" => "2",
            "message" => "FInance successfully updated",
            // "affected" => $affected,
            "data" => $item1,
            
        ]);
    }
}
