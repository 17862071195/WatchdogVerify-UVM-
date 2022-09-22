class c_13_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_13_3;
    c_13_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx0zz110z1xz0xz101xx01z01zzz01z0zzzzxzxzzzzzzxxzzzxxxzxxxzxxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
