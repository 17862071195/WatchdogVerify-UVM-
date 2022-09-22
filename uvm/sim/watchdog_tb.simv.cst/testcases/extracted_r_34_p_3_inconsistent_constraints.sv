class c_34_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_34_3;
    c_34_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00zxxz1z10x11xxz1z110zzx1xx1x1xzxzzxzxxzzxzxzxzzxzzxxxzxzzzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
