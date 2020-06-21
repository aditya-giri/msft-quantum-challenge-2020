// INCOMPLETE

namespace Solution {

    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arithmetic;    
    
    operation Solve_b1 (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {

        if (Length(inputs) == 2) {
            X(inputs[0]);
            CCNOT(inputs[0], inputs[1], output);
            X(inputs[0]);

            X(inputs[1]);
            CCNOT(inputs[0], inputs[1], output);
            X(inputs[1]);
        }
        else {
            for (q1 in 0 .. Length(inputs)-2) {
                for (q2 in q1+1 .. Length(inputs)-1) {
                    Solve([inputs[q1], inputs[q2]], output);
                }
            }
            if (Length(inputs) % 2 == 0) {
                X(output);
                Controlled X(inputs, output);
                ApplyToEachCA(X, inputs);
                Controlled X(inputs, output);
                ApplyToEachCA(X, inputs);
            }            
        }
    }
}