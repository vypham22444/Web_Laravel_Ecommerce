<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ThongKe extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'ngay_order', 'doanh_so', 'quatity', 'tong_order'
    ];
    protected $table = 'thong_kes';
    protected $primaryKey = 'id';
}
