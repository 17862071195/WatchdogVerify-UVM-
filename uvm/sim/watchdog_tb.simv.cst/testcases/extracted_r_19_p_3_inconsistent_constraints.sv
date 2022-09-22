class c_19_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_19_3;
    c_19_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0xz00xxzxx101xxxz1x1x0000x0zxx0zzxxxxzzxzzxzzxxzzzxxzzxzzzzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
