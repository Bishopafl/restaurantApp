<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    // menu belongs to at least one category
    public function category(){
        return $this->belongsTo(Category::class);
    }
}
