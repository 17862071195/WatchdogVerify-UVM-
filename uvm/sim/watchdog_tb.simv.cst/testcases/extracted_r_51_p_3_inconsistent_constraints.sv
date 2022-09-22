class c_51_3;
    rand integer delay; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/watchdog_resen_virtual_sequence.sv:21)
    {
       (delay inside {[5:3]});
    }
endclass

program p_51_3;
    c_51_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zz0x1xxxxz1zzx100x1z1xz000010zxxxzxxzxxxxxzxxxzzxzxzxzxzxxxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
