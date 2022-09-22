class c_21_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_21_3;
    c_21_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z1x00xzx0zx1xz01x1z011z110000x1zxxzxxzxzxzzzxzzxxxxxzzzxzzzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
