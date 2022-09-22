class c_15_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_15_3;
    c_15_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z0111zx01x01101xz0xx0xx0zxzzx0xxzzxxxzxzzxxxxxzxxzxxxzxxzzzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
