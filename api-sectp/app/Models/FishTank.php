<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class FishTank extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'image',
        'min_temperature',
        'max_temperature',
        'capacity',
        'user_id'
    ];

    /**
     * Get the user for this fish tank.
     */
    function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Get the temperatures for this fish tank.
     */
    function temperature()
    {
        return $this->hasMany(Temperature::class);
    }
}
