namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Measurement;

    operation Solve_b2 (register : LittleEndian) : Unit is Adj+Ctl {
        let n = Length(register!);
        for (target in n-1 .. -1 .. 1) {
            ApplyToEachCA(X, register![0 .. 1 .. target-1]);
            Controlled X(register![0 .. 1 .. target-1], register![target]);
            ApplyToEachCA(X, register![0 .. 1 .. target-1]);
        }
        X(register![0]);
    }
}