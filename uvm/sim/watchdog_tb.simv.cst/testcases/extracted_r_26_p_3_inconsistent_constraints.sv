class c_26_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_26_3;
    c_26_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zzx01zxxxx011xz10xz0xxz1xx111xzzxzxxxzxxzzxzxxzzzzxzxxzzzxzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
