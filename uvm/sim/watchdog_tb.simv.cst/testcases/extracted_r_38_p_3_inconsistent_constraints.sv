class c_38_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_38_3;
    c_38_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zxx01zxxz10111x1z10010z0zx111zzxxxxzxxzxzzzzxzxzzzzzxzxzxxxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
