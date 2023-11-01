<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class KeluarResource extends JsonResource
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
            'barang_id' => $this->barang_id,
            //'name_barang' => $this->name_barang,
            'tgl' => $this->tgl,
            'stok' => $this->stok,
        ];
    }

    private function getFeaturedImage()
    {
        return ($this->tgl) ? asset('storage/'.$this->tgl) : null;
       
    }
}
