class c_17_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_17_3;
    c_17_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0x001zxz111x011x00zzz1zzzz11z01xxxxxxxxzxxzzzzxxzzzzzzxzxxzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
