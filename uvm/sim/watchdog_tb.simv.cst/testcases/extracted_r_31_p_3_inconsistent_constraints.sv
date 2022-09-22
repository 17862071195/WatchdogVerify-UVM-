class c_31_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_31_3;
    c_31_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z00011z01x01101xz01zx100x000zzzzxxzxzxxxzxzxzxzxxxxzzxxzxzxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
