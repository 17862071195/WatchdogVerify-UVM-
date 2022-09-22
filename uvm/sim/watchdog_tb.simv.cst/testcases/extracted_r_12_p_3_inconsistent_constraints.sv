class c_12_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_12_3;
    c_12_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xzzz010xx0011z1xx000111x10x0xx0zxzzzzzzzzxzxzzzxxxzxzxxxxxzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
