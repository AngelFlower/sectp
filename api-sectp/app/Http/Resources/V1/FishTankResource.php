<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Resources\Json\JsonResource;

class FishTankResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        // if temperature is null, set it to 0
        if ($this->temperature->last() == null) {
            $last_temperature = 0;
        }
        else {
            $last_temperature = $this->temperature->last()->temperature;
        }
        $status = $last_temperature < $this->max_temperature && $last_temperature > $this->min_temperature ? 'ok' : 'danger';

        return [
            'id' => $this->id,
            'name' => $this->name,
            'image' => $this->image,
            'min_temperature' => $this->min_temperature,
            'max_temperature' => $this->max_temperature,
            'capacity' => $this->capacity,
            'latest_temperature' => $last_temperature,
            'status' => $status,
            'user_id' => $this->user_id,
        ];
    }
}
