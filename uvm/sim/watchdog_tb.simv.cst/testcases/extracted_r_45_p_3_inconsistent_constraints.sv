class c_45_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_45_3;
    c_45_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11xx11100x11zx0zzxxxz0zxzx00011xxxxxxxxzzxxxzxzxzxxzxxzzxzxxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
