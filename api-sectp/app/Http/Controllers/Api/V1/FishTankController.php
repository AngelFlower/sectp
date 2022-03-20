<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\FishTankResource;
use App\Models\FishTank;
use Illuminate\Http\Request;

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
        // store fishtank
        $fishtank = FishTank::create($request->all());

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/fishtank_images');
            $image->move($destinationPath, $name);
            $fishtank->image = $name;
            $fishtank->save();
        }

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
    public function update(Request $request, FishTank $fishTank)
    {
        // update fishtank
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
    public function destroy(FishTank $fishTank)
    {
        $fishTank->delete();

        return response()->json(['message' => 'Success'], 204);
    }

    public function getByUser()
    {
        return FishTankResource::collection(auth()->user()->fishtanks);
    }

    protected function validateStore(Request $request)
    {
        return $this->validate($request, [
            'name' => 'required|string|max:255',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'min_temperature' => 'required|double',
            'max_temperature' => 'required|double',
            'capacity' => 'required|double',
            'user_id' => 'required|integer',
        ]);
    }

}
