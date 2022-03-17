<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Temperature extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'temperature',
        'fish_tank_id',
        'date_time'
    ];  
    
    /**
     * Get the fish tank for this temperature.
     */
    public function fishTank()
    {
        return $this->belongsTo(FishTank::class);
    }
}
