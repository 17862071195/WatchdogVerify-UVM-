class c_8_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_8_3;
    c_8_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10101xxxxzx1001x100x1xzxxz011001zzzxzxzxxxxzxzzxxxxxxzzxzxzzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
