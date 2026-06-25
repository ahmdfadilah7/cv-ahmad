<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UiTranslation extends Model
{
    /**
     * @var list<string>
     */
    protected $fillable = ['group', 'key', 'value_id', 'value_en'];
}
