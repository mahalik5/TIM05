<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Models\Barang;
use App\Models\Keluar;
use App\Http\Resources\KeluarResource;
use App\Http\Resources\BarangResource;

class KeluarController extends BaseController
{
    public function index(Request $request)
    {
        $user = auth()->guard()->user();

        $latest = $request->query('latest') === 'true';

        $keluarsQuery = Keluar::where('user_id', $user ? $user->id : null);

        if ($latest) {
            $keluarsQuery->latest();
        }

        $keluars = $keluarsQuery->get();
        return $this->sendResponse(KeluarResource::collection($keluars), 'List Data Keluar');
    }
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'barang_id' => 'required',
            // 'name_barang' => 'required',
            'tgl' => 'required',
            'stok' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $Keluar = new Keluar;
        $Keluar->barang_id = $request->barang_id;
      //  $Keluar->name_barang = $request->name_barang;
        $Keluar->tgl = $request->tgl;
        $Keluar->stok = $request->stok;
        $Keluar->user_id = Auth::user()->id;
        $barangs = Barang::where('id', $request->barang_id)->firstOrFail();
        $stok = $barangs->stok - $request->stok;
        $params['stok'] = $stok;

        $barangs->update($params);


        $Keluar->save();

        return $this->sendResponse(new BarangResource($barangs), 'Keluar added successfully');
    }
    public function destroy(Keluar $keluar)
    {

        if (!$keluar) {
            return $this->sendError('Product not found.', [], 404);
        }

        $keluar->delete();

        return $this->sendResponse([], 'Data has been successfully deleted');
    }
}
