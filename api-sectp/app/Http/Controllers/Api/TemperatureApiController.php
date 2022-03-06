<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\ApiController;
use App\Models\Temperature;
use Illuminate\Http\Request;

class TemperatureApiController extends ApiController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $temperatures = Temperature::all();
        return $this->showAll($temperatures);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $tempeture = Temperature::create($request->all());
        return $this->showOne($tempeture, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $tempeture = Temperature::findOrFail($id);
        return $this->showOne($tempeture);
    }
}
