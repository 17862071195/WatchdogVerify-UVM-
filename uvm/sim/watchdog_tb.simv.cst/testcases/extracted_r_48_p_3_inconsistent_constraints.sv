class c_48_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_48_3;
    c_48_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzz01xz0x0zzx1xx00011xzx101zx10xzxxxxxxzzxzxxzxxxzxzzxxxzxzzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
