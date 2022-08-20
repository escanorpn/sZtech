<?php

    namespace App\Http\Middleware;

    use Closure;
    use JWTAuth;
    use Exception;
    use Tymon\JWTAuth\Http\Middleware\BaseMiddleware;
    use Illuminate\Support\Facades\Auth;

    class Role extends BaseMiddleware
    {

        /**
         * Handle an incoming request.
         *
         * @param  \Illuminate\Http\Request  $request
         * @param  \Closure  $next
         * @return mixed
         */
        public function handle($request, Closure $next, ... $roles)
        {
            try {
                $user = JWTAuth::parseToken()->authenticate();
            } catch (Exception $e) {
                if ($e instanceof \Tymon\JWTAuth\Exceptions\TokenInvalidException){
                    return response()->json(['message' => 'Token is Invalid','code'=>401,'status'=>3],401);
                }else if ($e instanceof \Tymon\JWTAuth\Exceptions\TokenExpiredException){
                    return response()->json(['message' => 'Token is Expired','code'=>401,'status'=>3]);
                }else{
                    return response()->json(['user_not_found'], 401);
                    // return response()->json(['message' => 'Authorization Token not found','code'=>401,'error'=>3]);
                }
            }
            $user = Auth::user();
            // return response()->json(['message' => 'Not authorised role','code'=>$user,'status'=>3]);
            if($user->role=="admin")
            return $next($request);

        foreach($roles as $role) {
            // Check if user has the role This check will depend on how your roles are set up
            //  return response()->json(['message' => 'Not authorised role','code'=>$role,'status'=>3]);
            if($user->role==$role)
                return $next($request);
        }
        return response()->json(['message' => 'Not authorised role','code'=>401,'status'=>3],401);
            // return $next($request);
        }

    
    }