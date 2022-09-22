class c_40_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_40_3;
    c_40_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx1z00zzzx1zz001001z01xz00101zxxzzxzzxxzxzxxxxxzxxxzzxzzzxzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
