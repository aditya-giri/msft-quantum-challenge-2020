namespace Solution {

    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;

    operation Solve (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        
        for (q1 in 0 .. Length(inputs)-2) {
            for (q2 in q1+1 .. Length(inputs)-1) {
                CNOT(inputs[q1], output);
                CNOT(inputs[q2], output);
            }
        }
    }

    @EntryPoint()
    operation HelloQ() : Unit {
        Message("Hello quantum world!");
    }
}

