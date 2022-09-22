class c_29_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_29_3;
    c_29_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "000z1x00xz10000x01zxx11000110110zxxxxzzzzzzxzzzzzzzxxzxzxxzxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
