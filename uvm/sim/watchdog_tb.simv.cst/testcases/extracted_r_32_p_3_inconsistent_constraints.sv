class c_32_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_32_3;
    c_32_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zz0z0z1z0100xz00z00xzz10xxz0xz0zxxzzzzxxzxxzxxxzzzzzzxxzzxxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
