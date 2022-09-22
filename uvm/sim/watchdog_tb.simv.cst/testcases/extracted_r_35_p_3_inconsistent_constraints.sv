class c_35_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_35_3;
    c_35_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10zz0x0z00xzx101z1z1xx101x11011zzzzzzzxzzzxxzzxxzzxxzzzxxzzxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
