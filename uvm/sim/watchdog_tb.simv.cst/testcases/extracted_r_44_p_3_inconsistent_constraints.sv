class c_44_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_44_3;
    c_44_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz1zz001z0zx0xx11001z10x1zz0zz1zxxxzxxxxxzzxzxxzxzxxxxzzzxzzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
