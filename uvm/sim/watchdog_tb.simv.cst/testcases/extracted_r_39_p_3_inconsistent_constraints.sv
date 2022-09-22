class c_39_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_39_3;
    c_39_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzz1xxxx0x1zz0xx0x11z00z0zz0zz01zzxxxzxzzzxxxxzzxzxxzzxxzzxxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
