class c_42_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_42_3;
    c_42_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "110x11xx100z10x0111zz0zxzx01z1x1zzzzxxxzzzxxzzzzzxxxxzxxxxzxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
