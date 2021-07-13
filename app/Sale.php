<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    // mapping relationship model
    public function saleDetails(){
        return $this->hasMany(saleDetail::class);
    }

}
