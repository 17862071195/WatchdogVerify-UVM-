class c_30_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_30_3;
    c_30_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1zxxx0z10x1x00x11xx0zxz10z1zxx1xzzxzzzxxzzzxzzxzzxxxxzxzzzzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
