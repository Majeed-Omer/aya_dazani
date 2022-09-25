<?php

namespace App\Http\Controllers;

use App\Models\myInformations;
use Illuminate\Http\Request;

class MyInformationsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $my_informations = myInformations::all();
        return response()->json($my_informations);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input = $request->validate([
            'information' => 'required',
            'image' => 'required',
            'user_id' => 'required'
        ]);
        $my_informations = new myInformations();
        $my_informations->$information = input['information'];
        $my_informations->$image = input['image'];
        $my_informations->$user_id = input['user_id'];
        $my_informations->save();
        return response()->json($my_informations);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\myInformations  $myInformations
     * @return \Illuminate\Http\Response
     */
    public function show(myInformations $myInformations)
    {
        return response()->json($myInformations);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\myInformations  $myInformations
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, myInformations $myInformations)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\myInformations  $myInformations
     * @return \Illuminate\Http\Response
     */
    public function destroy(myInformations $myInformations)
    {
        return response()->json($myInformations->delete());
    }
}
