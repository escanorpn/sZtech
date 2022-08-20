<?php

namespace App\Http\Controllers;

use App\Models\hod;
use App\Models\user;
use Illuminate\Http\Request;
use DB;

class HodController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $s="student";
        $item =User::query()
        ->where('role','LIKE','student')
        // ->orWhere('description','LIKE',"%{$s}%")
        ->get();
        // $hid=1;
        // $uid=1;
        // $hd =Hod::query()
        // ->where('hid','LIKE',"%{$hid}%")
        // ->andWhere('uid','LIKE',"%{$uid}%")
        // ->get();
        return response()->json([
        "success" => true,
        "message" => "Item List",
        "val" => "2",
        "data" => $item
        ]);
    }
    public function HodStudents()
    {
        $users = DB::table('users')
            ->join('hods', 'users.id', '=', 'hods.uid')
            // ->join('orders', 'users.id', '=', 'orders.user_id')
            
            // ->select('users.email', 'users.code','users.number', 'libs.status','libs.name', 'libs.id')
            ->select('users.id','users.email','users.name', 'users.code','users.number', )
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

        // $hd =Hod::query()
        // ->where('hid','LIKE',"%{$hid}%")
        // ->andWhere('uid','LIKE',"%{$uid}%")
        // ->get();

        $item = new Hod;
        // $item->hid = $hid;
        $item->uid = $uid;
        $item->save();

        return response()->json([
                "success" => true,
                "message" => "Hod successfully uploaded",
                // "file" => $file
            ]);
        return response()->json($response);
    }
    public function update(Request $request)
    {
        $response = [];
        $ids1=json_decode($request->ids);
        $affected=User::whereIn('id', $ids1)->update(['admission' => "admitted"]);
        $item =User::query()
        ->where('role','LIKE','student')
        ->get();
        return response()->json([
            "success" => true,
            "val" => "2",
            "message" => "Users successfully updated",
            "affected" => $affected,
            "data" => $item
        ]);
    }
    public function update1(Request $request)
    {
        $response = [];
        $affected=User::where('id', $request->id)->update(['name' => $request->name,
        'email' => $request->email,'code' => $request->code,'admission' => $request->admission,]);
        $item =User::query()
        ->where('role','LIKE','student')
        ->get();
        return response()->json([
            "success" => true,
            "val" => "2",
            "message" => "Users successfully updated",
            "affected" => $affected,
            "data" => $item
        ]);
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
     * @param  \App\Models\hod  $hod
     * @return \Illuminate\Http\Response
     */
    public function show(hod $hod)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\hod  $hod
     * @return \Illuminate\Http\Response
     */
    public function edit(hod $hod)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\hod  $hod
     * @return \Illuminate\Http\Response
     */
   

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\hod  $hod
     * @return \Illuminate\Http\Response
     */
    public function destroy( $id)
    {
        Hod::destroy($id);
        // $items = RecipeResource::collection(Recipe::all());
        $item =User::query()
        ->where('role','LIKE','student')
        ->get();
        return response()->json([
        "success" => true,
        "message" => "Item removed List",
        "val" => "2",
        "data" => $item
        ]);
    }
}
