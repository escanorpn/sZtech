<?php

namespace App\Http\Controllers;

use App\Models\Company;
use Illuminate\Http\Request;
use App\Http\Requests\StoreCompanyRequest;
use App\Http\Requests\UpdateCompanyRequest;
use Illuminate\Support\Facades\Validator;

class CompanyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $companies = Company::all();
        return response()->json([
        "success" => true,
        "message" => "Company List",
        "val" => "2",
        "data" => $companies
        ]);
    }
    
    public function index_limited()
    {
        //
        $companies = Company::all()->take(6);
        return response()->json([
        "success" => true,
        "message" => "Company List",
        "val" => "2",
        "data" => $companies
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }
    public function addCompany(Request $request){
        //
            $imagesName = [];
            $response = [];
    
            $validator = Validator::make($request->all(),
                [
                    'images' => 'required',
                    'images.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048'
                ]
            );
    
            if($validator->fails()) {
                return response()->json(["status" => "failed", "message" => "Validation error", "errors" => $validator->errors()]);
            }
         
            if ($file1 = $request->file('images')) {
                foreach($file1 as $file){
    
                $path = $file->store('public/files/companies/'.date("Y-m-d"));
                $name = time().rand(0,3).'.'.$file->getClientOriginalName();
      
                //store your file into directory and db
                $save = new Company();
                // $save->product_id =  $product->id;
                $save->url= $path;
                $save->save();
                }
            
                   
                return response()->json([
                    "success" => true,
                    "message" => "File successfully uploaded",
                    // "file" => $file
                ]);
       
            } else {
                $response["status"] = "failed";
                $response["message"] = "Failed! image(s) not uploaded";
            }
            return response()->json($response);
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreCompanyRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCompanyRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Company  $company
     * @return \Illuminate\Http\Response
     */
    public function show(Company $company)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Company  $company
     * @return \Illuminate\Http\Response
     */
    public function edit(Company $company)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateCompanyRequest  $request
     * @param  \App\Models\Company  $company
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCompanyRequest $request, Company $company)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Company  $company
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Company::destroy($id);
        $companies = Company::all();
        return response()->json([
        "success" => true,
        "message" => "Company List",
        "val" => "2",
        "data" => $companies
        ]);
    }
}
