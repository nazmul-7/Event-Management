<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Application extends Model
{
    protected $fillable = [
        'event_id','user_id','totalHoursApplied'
    ];

    public function event(){
        return $this->belongsTo('App\Event','event_id','id');
    }
}
