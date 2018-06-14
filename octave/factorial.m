1

function result = factorial( ip )
    if( ip == 0 )
        result = 1;
        return;
    else
        result = prod( 1:ip );
    endif
endfunction

n = 4 ;

display(factorial(n));