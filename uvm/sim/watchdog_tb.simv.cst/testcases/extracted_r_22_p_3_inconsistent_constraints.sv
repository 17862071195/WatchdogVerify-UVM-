class c_22_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_22_3;
    c_22_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1x000x0z00z00xxz111xz001xxxz0zzxzxzzxzzzxxxzzxxxzxxzzzxxzxxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
