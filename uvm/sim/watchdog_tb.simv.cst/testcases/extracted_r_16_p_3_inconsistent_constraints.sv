class c_16_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_16_3;
    c_16_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01x00x0110z1xxz00zz001x0z1xz1z11xzxzxxxzzzxxxzxzxzxxxxxzzxxzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
