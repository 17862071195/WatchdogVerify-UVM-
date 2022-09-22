class c_5_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_5_3;
    c_5_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x110zx0z0x01xx00z01xz0x10zzz1111zxzzzxzzzxxxzxzxxzzzxzxxzxxzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
