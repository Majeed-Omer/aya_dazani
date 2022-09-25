<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class myInformations extends Model
{
    use HasFactory;
    protected $fillable = [
        'information',
        'image',
        'user_id'
    ];
}
