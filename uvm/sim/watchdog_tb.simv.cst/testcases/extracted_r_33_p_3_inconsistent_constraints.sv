class c_33_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_33_3;
    c_33_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01xx1z101xx1zx100x11xx11xzzxzxz1xzxzzxzxzxzxzxxxzxzxxxxxxxzxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
