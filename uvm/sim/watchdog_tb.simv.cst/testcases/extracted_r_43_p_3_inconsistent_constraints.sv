class c_43_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_43_3;
    c_43_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz1z1x000101z0x0z1x1zxx1z111zx0zzzzzzzzxxzzxzzzxzzzzxzzzxxxxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
