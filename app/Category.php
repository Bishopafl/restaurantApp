<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    // one category can have many menus
    public function menus(){
        return $this->hasMany(Menu::class);
    }
}
