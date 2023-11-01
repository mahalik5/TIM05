<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Models\Barang;
use App\Http\Resources\BarangResource;

class BarangController extends BaseController
{
    public function index(Request $request)
    {
        $user = auth()->guard()->user();

        $latest = $request->query('latest') === 'true';

        $barangsQuery = Barang::where('user_id', $user ? $user->id : null);

        if ($latest) {
            $barangsQuery->latest();
        }

        $barangs = $barangsQuery->get();
        return $this->sendResponse(BarangResource::collection($barangs), 'List Data Barang');
    }
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name_barang' => 'required',
            'image_barang' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'stok' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $Barang = new Barang;
        $Barang->name_barang = $request->name_barang;
        $Barang->stok = $request->stok;
        $Barang->user_id = Auth::user()->id;


        $image = $request->file('image_barang');
        $imagePath = $image->store('barang_images', 'public');
        $Barang->image_barang = $imagePath;


        $Barang->save();

        return $this->sendResponse(new BarangResource($Barang), 'Barang added successfully');
    }

    public function update(Request $request, Barang $barang)
    {
        if (!$barang) {
            return $this->sendError('Product not found.', [], 404);
        }

        $params = $request->except('_token');
        $images = $request->file('image_barang');

        if ($images !== null) {
            Storage::disk('public')->delete($barang->image_barang);
            $image = $request->file('image_barang');
            $imagePath = $image->store('barang_images', 'public');
            $params['image_barang'] = $imagePath;
        }

        $barang->update($params);
        return $this->sendResponse(new BarangResource($barang), 'The Barang has been successfully updated');
    }

    public function destroy(Barang $barang)
    {

        // $barangs = Barang::where('name_barang', $Barang)->firstOrFail();
        // if (!$barangs) {
        //     return $this->sendError('Barang not found.', [], 404);
        // }

        // if (!empty($barangs->image_barang)) {
        //     Storage::delete('public/barangs/' . $barangs->image_barang);
        // }

        // $barangs->delete();

        // return $this->sendResponse([], 'Barang has been successfully deleted');

        if (!$barang) {
            return $this->sendError('Product not found.', [], 404);
        }

        if (!empty($barang->barang_images)) {
            Storage::delete('public/products/' . $barang->barang_images);
        }

        $barang->delete();

        return $this->sendResponse([], 'Barang has been successfully deleted');
    }
public function show(Barang $barang)
        {
        return $this->sendResponse(new BarangResource($barang), 'Data Barang ditampilkan.');
    }
}
