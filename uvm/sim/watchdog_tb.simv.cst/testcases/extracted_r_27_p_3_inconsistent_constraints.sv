class c_27_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_27_3;
    c_27_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zz0x1x00x1x0x1x11xx1xzx0101z01zxzzzxzxzxxzxzxzxzxxxzzxxxxzzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
