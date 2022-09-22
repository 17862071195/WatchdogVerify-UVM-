class c_10_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_10_3;
    c_10_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxz0x0x10011xzxz1x1x0zxz00xz00zzxzzzzzzzxzzzzxzxxxxxxxzxxxzzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
