class c_23_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_23_3;
    c_23_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xxz10xzz1zx1xx0xx1x0z01xzx1z00zzzzxzzxxxzzxxzzxzxxxzzxxxzzxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
