<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
// use App\Models\Image;
use App\Models\Role;
// use App\Http\Requests\StoreRecipeRequest;
// use App\Http\Requests\UpdateRecipeRequest;
// use App\Http\Resources\RecipeResource;
use Illuminate\Support\Facades\Validator;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
              //
              $roles = Role::all();
              return response()->json([
              "success" => true,
              "message" => "Recipe List",
              "val" => "2",
              "data" => $roles
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
    
            $item = new Role;
            $item->name = $request->name;
            $item->code = $request->code;
            $item->save();
    
            return response()->json([
                    "success" => true,
                    "message" => "Roles successfully uploaded",
                    // "file" => $file
                ]);
            return response()->json($response);
        }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreRecipeRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreRecipeRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Recipe  $recipe
     * @return \Illuminate\Http\Response
     */
    public function show(Recipe $recipe)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Recipe  $recipe
     * @return \Illuminate\Http\Response
     */
    public function edit(Recipe $recipe)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateRecipeRequest  $request
     * @param  \App\Models\Recipe  $recipe
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateRecipeRequest $request, Recipe $recipe)
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
        Role::destroy($id);
        $items = Role::all();
        return response()->json([
        "success" => true,
        "message" => "Role List",
        "val" => "2",
        "data" => $items
        ]);
    }
}
