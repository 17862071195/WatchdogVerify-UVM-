class c_25_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_25_3;
    c_25_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzxxz1zxzzxz1010zzz0xxzz0z1z11xzzzzzzxxzxxzzzxxxxxxxxzxzxzzxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
