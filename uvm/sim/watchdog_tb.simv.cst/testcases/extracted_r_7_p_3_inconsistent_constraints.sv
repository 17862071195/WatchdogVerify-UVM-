class c_7_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_7_3;
    c_7_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01z0xz001111z1xz1xz0x0zxx0x1z0xzxxzxxxzxxzzxzzxzzzzzzxzzxzzzxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
