class c_47_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_47_3;
    c_47_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0011000z0zxzz01x0xx000100z1xzxzzzzzzzzzxzzzxzzzxxzzxzxxxzzxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
