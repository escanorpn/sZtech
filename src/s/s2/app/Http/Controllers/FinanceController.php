<?php

namespace App\Http\Controllers;

use App\Models\finance;
use Illuminate\Http\Request;

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
    public function StudentArears()
    {
        $users = DB::table('users')
            ->join('finances', 'users.id', '=', 'finances.sid')
            ->select('users.id','users.email', 'users.code','users.number',  'finances.status','finances.name',)
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
     
        $item = DB::table('finances')
        ->where('sid', '=', $request->id)
        ->select( 'name', 'value','id','sid')
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
        $uid=$request->uid;

        $item = new Finance;
        $item->sid = $request->sid;
        $item->name =$request->name;
        $item->value = $request->value;
        $item->save();

        return response()->json([
                "success" => true,
                "val" => "2",
                "message" => "Financial record successfully uploaded",
                // "file" => $file
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

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\finance  $finance
     * @return \Illuminate\Http\Response
     */
    public function destroy(finance $finance)
    {
        //
    }
}
