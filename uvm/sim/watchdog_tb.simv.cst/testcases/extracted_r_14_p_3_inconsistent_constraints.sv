class c_14_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_14_3;
    c_14_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz001xzz111zzxz00xxz11110x01zz1zzzxxxxxxxzzxzxzzxzzxxxxzxxzxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
