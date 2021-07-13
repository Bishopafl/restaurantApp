<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SaleDetail extends Model
{
    // belongs to sale class. Sale details need a sale id
    public function sale(){
        return $this->belongsTo(Sale::class);
    }
}
