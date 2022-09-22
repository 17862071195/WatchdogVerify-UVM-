class c_28_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_28_3;
    c_28_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz0z1x001x0x0zxxx010z11xzx11zx1zxxzxzxzxzzzxxxxzzzzxxxxxxxzxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
