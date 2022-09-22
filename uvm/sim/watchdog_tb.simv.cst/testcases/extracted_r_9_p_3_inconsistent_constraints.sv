class c_9_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_9_3;
    c_9_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1x11x00z0zz01x1z1x111010011zzz1zzxxzxxzxxxzzzzzxzzzxzzzxxxxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
