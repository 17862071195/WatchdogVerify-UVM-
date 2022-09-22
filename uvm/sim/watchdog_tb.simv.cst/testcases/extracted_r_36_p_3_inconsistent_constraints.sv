class c_36_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_36_3;
    c_36_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxz1xx0z1x111x0z10zz110z100zx10zzxzxxxzzxxzzzzxxzxxzxxzxzxxxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
