<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Models\Barang;
use App\Models\Masuk;
use App\Http\Resources\MasukResource;
use App\Http\Resources\BarangResource;

class MasukController extends BaseController
{
    public function index(Request $request)
    {
        $user = auth()->guard()->user();

        $latest = $request->query('latest') === 'true';

        $masuksQuery = Masuk::where('user_id', $user ? $user->id : null);

        if ($latest) {
            $masuksQuery->latest();
        }

        $masuks = $masuksQuery->get();
        return $this->sendResponse(MasukResource::collection($masuks), 'List Data Masuk');
    }
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'barang_id' => 'nullable',
          //  'name_barang' => 'required',
            'tgl' => 'required',
            'stok' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $Masuk = new Masuk;
        $Masuk->barang_id = $request->barang_id;
//$Masuk->name_barang = $request->name_barang;
        $Masuk->tgl = $request->tgl;
        $Masuk->stok = $request->stok;
        $Masuk->user_id = Auth::user()->id;
        $barangs = Barang::where('id',$request->barang_id)->firstOrFail();
        $stok = $barangs->stok + $request->stok;
        $params['stok'] = $stok;

        $barangs->update($params);


        $Masuk->save();

       return $this->sendResponse(new BarangResource($barangs), 'Masuk added successfully');
    }

    public function destroy(Masuk $masuk)
    {

        if (!$masuk) {
            return $this->sendError('Product not found.', [], 404);
        }

        $masuk->delete();

        return $this->sendResponse([], 'Data has been successfully deleted');
    }
}
