<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    protected $fillable = [

        'eventName',
        'eventDesc',
        'user_id',
        'eventLocation',
        'timeSlot',
        'totalHours',
        'numberOfGuests',
        'numberOfValetsNeeded',
        'visibleAfter',
        'eventDate',
    ];
    public function applications(){
        return $this->hasOne('App\Application');
    }
    public function hasApplied(){
        return $this->hasOne('App\Application');
    }
}
