<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Temperature>
 */
class TemperatureFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'temperature' => $this->faker->randomFloat(1, 15, 35),
            'fish_tank_id' => $this->faker->numberBetween(1, 10),
            'date_time' => $this->faker->dateTimeBetween('-1 years', 'now'),
        ];
    }
}
