<?php

namespace App\Http\Controllers;

use App\Models\lib;
use App\Models\user;
use Illuminate\Http\Request;
use DB;

class LibController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      
        // $users = DB::table('users')
        //     ->join('libs', 'users.id', '=', 'libs.sid')
        //     // ->join('orders', 'users.id', '=', 'orders.user_id')
            
        //     // ->select('users.email', 'users.code','users.number', 'libs.status','libs.name', 'libs.id')
        //     ->select('users.id','users.email', 'users.code','users.number',  'libs.status','libs.name',)
        //     ->distinct()->get();
        // $item = DB::table('libs')
        // ->where('sid', '=', 1)
        // ->select( 'name', 'value','id','sid')
        // ->get();
        
        $s="student";
        $users = DB::table('users')
        ->where('role', '=', $s )
        ->where('admission', 'admitted') 
        ->select( 'id','name','email','code','number')
        ->get();
        return response()->json([
        "success" => true,
        "message" => "Item List",
        "val" => "2",
        "data" => $users,
        // "data" => $item,
        ]);
    }
    public function StudentArears()
    {
        $users = DB::table('users')
            ->join('libs', 'users.id', '=', 'libs.sid')
            // ->join('orders', 'users.id', '=', 'orders.user_id')
            
            // ->select('users.email', 'users.code','users.number', 'libs.status','libs.name', 'libs.id')
            ->select('users.id','users.email', 'users.code','users.number',  'libs.status','libs.name',)
            ->distinct()->get();
        // $item = DB::table('libs')
        // ->where('sid', '=', 1)
        // ->select( 'name', 'value','id','sid')
        // ->get();
        return response()->json([
        "success" => true,
        "message" => "Item List",
        "val" => "2",
        "user" => $users,
        // "data" => $item,
        ]);
    }
    public function Libdata(Request $request)
    {
     
        $item = DB::table('libs')
        ->where('sid', '=', $request->id)
        ->select( 'name', 'value','status','id','sid')
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
        // $hid=$request->hid;
        // $uid=$request->uid;

        $item = new Lib;
        $item->sid = $request->sid;
        $item->name =$request->name;
        $item->value = $request->value;
        $item->save();

        $item1 = DB::table('libs')
        ->where('sid', '=', $request->sid)
        ->select( 'name', 'value','status','id','sid')
        ->get();

        return response()->json([
                "success" => true,
                "val" => "2",
                "message" => "Lib successfully uploaded",
                "data" => $item1
            ]);
        return response()->json($response);
    }
    public function payment(Request $request)
    {
        $response = [];
        $hid=$request->hid;
        $uid=$request->uid;

        $item = new Lib;
        $item->sid = $request->sid;
        $item->name =$request->name;
        $item->value = $request->value;
        $item->status = "payed";
        $item->save();

        return response()->json([
                "success" => true,
                "val" => "2",
                "message" => "payment successful",
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
     * @param  \App\Models\lib  $lib
     * @return \Illuminate\Http\Response
     */
    public function show(lib $lib)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\lib  $lib
     * @return \Illuminate\Http\Response
     */
    public function edit(lib $lib)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\lib  $lib
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
       
        // $ids=$request->ids;
        // foreach($ids as $id) {
        //     $affected1 = DB::table('libs')
        //     ->where('id', $id)
        //     ->update(['status' => "done1"]);
        //     echo $id;
        // }
     
        // $affected =Lib::where('id','IN', $ids)->update(['status'=>'done2']);
        // $affected =Lib::where('id','IN', $ids)->update(['status'=>'done2']);
        // DB::table('libs')->whereIn('id',$ids)->update(['status'=>'done2']);
        // $ids1=["1","2"];
        // $ids1=json_decode($ids);
        
        // echo gettype(json_decode($ids));
        // echo $ids1;
        // Lib::where('id','IN', $ids1)->update(['status'=>'done2']);
        $response = [];
        $ids1=json_decode($request->ids);
        $affected=Lib::whereIn('id', $ids1)->update(['status' => "settled"]);
        return response()->json([
            "success" => true,
            "val" => "2",
            "message" => "Lib successfully updated",
            "affected" => $affected
        ]);
    }
    
    public function update1(Request $request)
    {
        $response = [];
        $affected=Lib::where('id', $request->id)->update(['name' => $request->name,
        'value' => $request->value,'status' => $request->status,]);
        $item1 = DB::table('libs')
        ->where('sid', '=', $request->sid)
        ->select( 'name', 'value','status','id','sid')
        ->get();

        return response()->json([
            "success" => true,
            "val" => "2",
            "message" => "Library successfully updated",
            "affected" => $affected,
            "data" => $item1
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\lib  $lib
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $response = [];
        Lib::destroy($request->id);

        $item1 = DB::table('libs')
        ->where('sid', '=', $request->sid)
        ->select( 'name', 'value','status','id','sid')
        ->get();

        return response()->json([
            "success" => true,
            "val" => "2",
            "message" => "Library successfully updated",
            // "affected" => $affected,
            "data" => $item1
        ]);
    }
}
