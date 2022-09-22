class c_18_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_18_3;
    c_18_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z01000z1z1x0010z0z1z00011xzzx0x1xzzxzxzzzxzzzzxxzzxxzzzzzxxzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
