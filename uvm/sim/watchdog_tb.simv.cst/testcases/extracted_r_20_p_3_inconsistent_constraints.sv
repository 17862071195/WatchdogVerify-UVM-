class c_20_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_20_3;
    c_20_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x11xzzxz100x110011z1z11xx1110z0xxzxzzzxzxxzzxzzxzzzxzzxzzzxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
