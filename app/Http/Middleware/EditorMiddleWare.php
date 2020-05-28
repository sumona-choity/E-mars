<?php

namespace App\Http\Middleware;

use Closure;

class EditorMiddleWare
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(Auth::user()->userType =="Admin" || Auth::user()->userType =="Editor" ){
            
             return $next($request);
        }
        return back();
        
    }
}
