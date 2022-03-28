<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\FishTankResource;
use App\Models\FishTank;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class FishTankController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return FishTankResource::collection(FishTank::latest()->paginate());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {


        $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'nullable|string',
            'min_temperature' => 'required|numeric',
            'max_temperature' => 'required|numeric',
            'capacity' => 'required|numeric',
        ]);

        if ($request->image != null && $request->image != '') {
           
        $image = $request->image;  // your base64 encoded
        $image = str_replace('data:image/png;base64,', '', $image);
        $image = str_replace(' ', '+', $image);
        $imageName = $request->name .'_'. Str::random(10) . '.png';
    
        Storage::disk('public')->put($imageName, base64_decode($image));
        //set request image as imagename
        $request->merge(['image' => env('APP_URL').'/storage/'.$imageName]);
        
        }
        
        /*
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/fishtank_images');
            $image->move($destinationPath, $name);
            $fishtank->image = $name;
            $fishtank->save();
        }
        */
        $fishtank = auth()->user()->fishTanks()->create($request->all());
        // return response
        return response()->json([
            'message' => 'Fishtank created successfully',
            'fishtank' => new FishTankResource($fishtank),
        ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\FishTank  $fishTank
     * @return \Illuminate\Http\Response
     */
    public function show(FishTank $fishtank)
    {
        return new FishTankResource($fishtank);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\FishTank  $fishTank
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // update fishtank
        $fishTank = FishTank::findOrFail($id);
        $fishTank->update($request->all());

        // return response
        return response()->json([
            'message' => 'Fishtank updated successfully',
            'fishtank' => new FishTankResource($fishTank),
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\FishTank  $fishTank
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $fishtank = FishTank::findOrFail($id);
        $fishtank->delete();
        return response()->json([
            'message' => 'Fishtank deleted successfully',
        ], 200);
    
    }

    public function getByUser()
    {
        $fishtank = auth()->user()->fishTanks()->latest()->paginate();

        return FishTankResource::collection($fishtank);
    }

}
