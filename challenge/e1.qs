namespace Solution {

    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arithmetic;

    operation Solve_e1 (p : Int, inputRegister : LittleEndian) : Unit is Adj+Ctl {
        for (index in 0 .. (p%4)-1) {
            QFTLE(inputRegister);
        }
    }
]