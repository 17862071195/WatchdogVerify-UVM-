class c_24_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_24_3;
    c_24_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xxxz10zz00z1110xx1x0xx11z11x00zzzxzxzzxxzxxxzxzxzzzxzzxxxxxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
