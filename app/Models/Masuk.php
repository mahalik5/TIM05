<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Masuk extends Model
{
    use HasFactory;
    protected $fillable = [
    'user_id',
    'barang_id',
   // 'name_barang',
    'tgl',
    'stok',
];
}
