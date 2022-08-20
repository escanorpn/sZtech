<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Image;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\ProductResource;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $products = ProductResource::collection(Product::all());
        return response()->json([
        "success" => true,
        "message" => "Product List1",
        "val" => "2",
        "data" => $products
        ]);
    }

    public function index_limited()
    {
        //
        $products = ProductResource::collection(Product::all()->take(6));
        return response()->json([
        "success" => true,
        "message" => "Product List1",
        "val" => "2",
        "data" => $products
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

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreProductRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreProductRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateProductRequest  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateProductRequest $request, Product $product)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Product::destroy($id);
        $products = ProductResource::collection(Product::all());
        return response()->json([
        "success" => true,
        "message" => "Product List",
        "val" => "2",
        "data" => $products
        ]);
    }
    public function addProduct2(Request $request) {
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
        $product = new Product;
        $product->name = $request->name;
        $product->description = $request->description;
        $product->save();
        if ($file1 = $request->file('images')) {
            foreach($file1 as $file){

            $path = $file->store('public/files/'.date("Y-m-d"));
            $name = time().rand(0,3).'.'.$file->getClientOriginalName();
  
            //store your file into directory and db
            $save = new Image();
            $save->product_id =  $product->id;
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

    public function addProduct(Request $request)
        {
        // $this->validate($request, [
        //     'name' => 'required|string|max:255',
        //     'description' => 'required|string|max:855',
        // ]);
        $product = new Product;
        $product->name = $request->name;
        $product->description = $request->description;
        $product->save();
        $mImage= $request->images;
        if($mImage){
            return response()->json([
                'message' => 'No images ',
                'Product' => json_encode($mImage)
            ], 201);
        }else{
            // for($count=0; $count<count(mImage["name"]); $count++)
            // {
            //     return response()->json([
            //         'message' => ' images ',
            //         'images' =>  mImage["name"][$count]
            //     ], 201);
               
            // }
           
        }
        
  
        foreach ($mImage as $imagefile) {
            $image = new Image;
            
            $path = $imagefile->store('/images/resource', ['disk' =>   'my_files']);
            // $image->url = $path;
            // $image->product_id = $product->id;
            // $image->save();
            return response()->json([
                'message' => 'Product registered',
                'Product' => $path
            ], 201);
        }
        return response()->json([
            'message' => 'Product registered',
            'Product' => $product
        ], 201);

    }
}
