<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\SoftDeletes;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable,SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function roles()
    {
        return $this->belongsToMany(Role::class, 'role_user', 'user_id', 'role_id');
    }

    public function checkPermissionAccess($permissionCheck)
    {
        // use login co quyen add, sua danh muc va xem menu
       // B1 lay duoc tat ca cac quyen cua user dang login he thong
        // B2 So sanh gia tri dua vao cua router hien tai xem co ton tai trong cac quyen ma minh lay dc hay khong
        $roles = auth()->user()->roles; // lấy đc tất cả vai trò của user đang login vào hệ thống thông qua phương thức trung gian
        foreach ($roles as $role) { // user có nhiều quyền nên foreach
            $permissions = $role->permissions; // phương thức trung gian permissions
            if ($permissions->contains('key_code', $permissionCheck)) { // trong những quyền mà mình lấy đc từ vai trò, so sánh key_code vs $pemissionCheck truyền từ bên kia
                return true;
            }
        }
        return false;
    }


}
