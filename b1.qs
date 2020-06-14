namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Measurement;

    operation Solve_b1 (register : LittleEndian) : Unit is Adj+Ctl {
        let n = Length(register!);
        for (target in n-1 .. -1 .. 1) {
            Controlled X(register![0 .. 1 .. target-1], register![target]);
        }
        X(register![0]);
    }
}    