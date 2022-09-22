class c_37_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_37_3;
    c_37_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx11z100x0z01zzz1x0001x0111xx000xxzxzzzxzzxxzzxzzxxzzzxzzzxzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
