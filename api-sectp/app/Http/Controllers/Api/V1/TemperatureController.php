<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\TemperatureResource;
use App\Models\Temperature;
use Illuminate\Http\Request;

class TemperatureController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return TemperatureResource::collection(Temperature::latest()->paginate());
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
            'temperature' => 'required|numeric',
            'date_time' => 'required|date',
            'fish_tank_id' => 'required|numeric'
        ]);
        // store temperature
        $temperature = Temperature::create($request->all());

        // return response
        return response()->json([
            'message' => 'Temperature created successfully',
            'temperature' => new TemperatureResource($temperature),
        ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Temperature  $temperature
     * @return \Illuminate\Http\Response
     */
    public function show(Temperature $temperature)
    {

        return new TemperatureResource($temperature);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Temperature  $temperature
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Temperature $temperature)
    {
        // update temperature
        $temperature->update($request->all());

        // return response
        return response()->json([
            'message' => 'Temperature updated successfully',
            'temperature' => new TemperatureResource($temperature),
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Temperature  $temperature
     * @return \Illuminate\Http\Response
     */
    public function destroy(Temperature $temperature)
    {
        $temperature->delete();

        return response()->json(['message' => 'Success'], 204);
    }

    public function getByFishTank($fish_tank_id)
    {
        return TemperatureResource::collection(Temperature::where('fish_tank_id', $fish_tank_id)->latest()->paginate());
    }
}
