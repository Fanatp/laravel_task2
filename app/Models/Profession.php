<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profession extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'name',
    ];

    public function skills(){
        return $this->belongsToMany(Skill::class);
    }

    public function instituts(){
        return $this->belongsToMany(Institut::class);
    }



}
