<?php

namespace App\Models;

use App\Support\Localized;
use App\Support\MediaUrl;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Profile extends Model
{
    /**
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'phone',
        'phone_tel',
        'years_experience',
        'location',
        'headline',
        'tagline',
        'bio',
        'availability',
        'cv_path',
        'photo_path',
        'job_title',
        'address_locality',
        'address_country',
        'knows_about',
    ];

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'location' => 'array',
            'headline' => 'array',
            'tagline' => 'array',
            'bio' => 'array',
            'availability' => 'array',
            'knows_about' => 'array',
        ];
    }

    public function highlights(): HasMany
    {
        return $this->hasMany(ProfileHighlight::class)->orderBy('sort_order');
    }

    public function stats(): HasMany
    {
        return $this->hasMany(ProfileStat::class)->orderBy('sort_order');
    }

    public function socialLinks(): HasMany
    {
        return $this->hasMany(ProfileSocialLink::class)->orderBy('sort_order');
    }

    /**
     * @return array<string, mixed>
     */
    public function toApiPayload(): array
    {
        return [
            'name' => $this->name,
            'email' => $this->email,
            'phone' => $this->phone,
            'phoneTel' => $this->phone_tel,
            'location' => Localized::normalize($this->location),
            'headline' => Localized::normalize($this->headline),
            'yearsExperience' => $this->years_experience,
            'tagline' => Localized::normalize($this->tagline),
            'bio' => Localized::normalize($this->bio),
            'highlights' => $this->highlights->map(
                fn (ProfileHighlight $item): array => Localized::normalize($item->text),
            )->values()->all(),
            'social' => $this->socialLinks->map(
                fn (ProfileSocialLink $item): array => $item->toApiPayload(),
            )->values()->all(),
            'stats' => $this->stats->map(
                fn (ProfileStat $item): array => $item->toApiPayload(),
            )->values()->all(),
            'cvUrl' => MediaUrl::publicUrl($this->cv_path) ?? '/cv-ahmad-fadilah.pdf',
            'photoUrl' => MediaUrl::publicUrl($this->photo_path),
            'availability' => Localized::normalize($this->availability),
        ];
    }
}
