class c_50_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_50_3;
    c_50_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z01z11xxz11x0zx1zx0z0z10z01xz1z0xxzzzxxzzzxxzzzzxxxxxzxzxxzxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
