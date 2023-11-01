<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class BarangResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name_barang' => $this->name_barang,
            'image_barang' => $this->getFeaturedImage(),
            'stok' => $this->stok,
        ];
    }
    private function getFeaturedImage()
    {
        return ($this->image_barang) ? asset('storage/' . $this->image_barang) : null;
    }
}
