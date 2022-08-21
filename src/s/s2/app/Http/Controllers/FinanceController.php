<?php

namespace App\Http\Controllers;

use App\Models\finance;
use App\Models\user;
use Illuminate\Http\Request;
use DB;

class FinanceController extends Controller
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
        ->where('role', '=', $s )
        ->where('admission', 'admitted') 
        ->select( 'id','name','email','code','number')
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
            ->join('finances', 'finances.sid','=','users.id' )
            ->select('users.id','users.email', 'users.code','users.number',  'finances.status','finances.name')
            ->distinct()->get();

            // $item = DB::table('users')
            // ->join('finances', 'finances.sid','=','users.id' )
            // // ->join('finances', 'finances.status','=','pending' )
            // ->sum('value');
            //  $item = DB::table('finances')
            //  ->where('sid', '=', $request->id)
            //  ->where('status', '=', "pending")
            //  ->sum('value');
        
     
        return response()->json([
        "success" => true,
        "message" => "Item List",
        "val" => "2",
        "data" => $users,
        // "item" => $item,
        ]);
    }
    public function Userdata(Request $request)
    {
     
        $item = DB::table('finances')
        ->where('sid', '=', $request->id)
        ->select( 'name', 'value','status','id','sid')
        ->get();
        
        $user = DB::table('users')
        ->where('id', '=', $request->id)
        ->select( '*')
        ->get();
        $pending = DB::table('finances')
             ->where('sid', '=', $request->id)
             ->where('status', '=', "pending")
             ->sum('value');
        $payed = DB::table('finances')
            ->where('sid', '=', $request->id)
            ->where('status', '=', "payed")
            ->sum('value');
        // $user->data=$item;
        return response()->json([
        "success" => true,
        "message" => "Item List",
        "val" => "2",
        "user" => $user,
        "data" => $item,
        "pending" => $pending,
        "payed" => $payed,
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
        $uid=$request->uid;

        $item = new Finance;
        $item->sid = $request->sid;
        $item->name =$request->name;
        $item->value = $request->value;
        $item->save();
        $item1 = DB::table('finances')
        ->where('sid', '=', $request->sid)
        ->select( 'name', 'value','status','id','sid')
        ->get();

        $pending = DB::table('finances')
        ->where('sid', '=', $request->sid)
        ->where('status', '=', "pending")
        ->sum('value');
        $payed = DB::table('finances')
            ->where('sid', '=', $request->sid)
            ->where('status', '=', "payed")
            ->sum('value');
        return response()->json([
                "success" => true,
                "val" => "2",
                "message" => "Financial record successfully added",
                "data" => $item1,
                "pending" => $pending,
                "payed" => $payed,
            ]);
        return response()->json($response);
    }

    public function payment(Request $request)
    {
        $response = [];
        // $hid=$request->hid;
        $uid=$request->uid;

        $item = new Finance;
        $item->sid = $request->sid;
        $item->name =$request->name;
        $item->value = $request->value;
        $item->status = "payed";
        $item->save();

        $item1 = DB::table('finances')
        ->where('sid', '=', $request->sid)
        ->select( 'name', 'value','status','id','sid')
        ->get();

        $pending = DB::table('finances')
        ->where('sid', '=', $request->sid)
        ->where('status', '=', "pending")
        ->sum('value');
        $payed = DB::table('finances')
            ->where('sid', '=', $request->sid)
            ->where('status', '=', "payed")
            ->sum('value');
        
        return response()->json([
                "success" => true,
                "val" => "2",
                "message" => "payment successful",
                "data" => $item1,
                "pending" => $pending,
                "payed" => $payed,

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
     * @param  \App\Models\finance  $finance
     * @return \Illuminate\Http\Response
     */
    public function show(finance $finance)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\finance  $finance
     * @return \Illuminate\Http\Response
     */
    public function edit(finance $finance)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\finance  $finance
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, finance $finance)
    {
        //
    }
    public function switch(Request $request)
    {
        $response = [];
        $affected=User::where('id', $request->sid)->update(['finance' => $request->switch]);
        $finance = DB::table('users')
        ->where('id', '=', $request->sid)
        ->select( 'finance')
        ->get();
        return response()->json([
            "success" => true,
            "val" => "2", 
            "message" => "Gown successfully updated",
            "affected" => $affected,
            "switch" => $finance,

        ]);
    }
    
    public function update1(Request $request)
    {
        $response = [];
        $affected=FInance::where('id', $request->id)->update(['name' => $request->name,
        'value' => $request->value,'status' => $request->status,]);
        $item1 = DB::table('finances')
        ->where('sid', '=', $request->sid)
        ->select( 'name', 'value','status','id','sid')
        ->get();

        $pending = DB::table('finances')
        ->where('sid', '=', $request->sid)
        ->where('status', '=', "pending")
        ->sum('value');
        $payed = DB::table('finances')
            ->where('sid', '=', $request->sid)
            ->where('status', '=', "payed")
            ->sum('value');
       
        return response()->json([
            "success" => true,
            "val" => "2",
            "message" => "Finance successfully updated",
            "affected" => $affected,
            "data" => $item1,
            "pending" => $pending,
            "payed" => $payed,
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\finance  $finance
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $response = [];
        Finance::destroy($request->id);

        $item1 = DB::table('finances')
        ->where('sid', '=', $request->sid)
        ->select( 'name', 'value','status','id','sid')
        ->get();

        $pending = DB::table('finances')
        ->where('sid', '=', $request->sid)
        ->where('status', '=', "pending")
        ->sum('value');
        $payed = DB::table('finances')
            ->where('sid', '=', $request->sid)
            ->where('status', '=', "payed")
            ->sum('value');

        return response()->json([
            "success" => true,
            "val" => "2",
            "message" => "FInance successfully updated",
            // "affected" => $affected,
            "data" => $item1,
            
            "pending" => $pending,
            "payed" => $payed,
        ]);
    }
}
