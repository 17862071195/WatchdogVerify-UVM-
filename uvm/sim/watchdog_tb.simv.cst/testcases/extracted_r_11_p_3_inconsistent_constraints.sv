class c_11_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_11_3;
    c_11_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0zx11110xzzzz01zzxz101xx1x10x11xzzzxzzzzxxzzxzzxxxzzzxxxxxzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
