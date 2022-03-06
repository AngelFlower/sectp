<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\FishTank>
 */
class FishTankFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->name,
            'image' => $this->faker->imageUrl(),
            'min_temperature' => $this->faker->randomFloat(1, 15, 25),
            'max_temperature' => $this->faker->randomFloat(1, 25, 35),
            'capacity' => $this->faker->numberBetween(10, 50),
            'user_id' => $this->faker->numberBetween(1, 10),
        ];
    }
}
