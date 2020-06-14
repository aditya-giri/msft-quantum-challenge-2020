// You are given two qubits in state |00⟩. Your task is to prepare the following state on them:
// 1/sqrt(3)[(|01⟩+|10⟩+|11⟩)]
// This task is very similar to problem A1 of the Winter 2019 contest, but this time you are not allowed to use any gates except the Pauli gates (X, Y and Z), the Hadamard gate and the controlled versions of those. However, you are allowed to use measurements.

namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Measurement;

    operation Solve_c (qs : Qubit[]) : Unit {
        using (q = Qubit()) {
            mutable fin = false;
            repeat {
                X(qs[0]);
                X(qs[1]);
                CCNOT(qs[0], qs[1], q);
                X(qs[0]);
                X(qs[1]);

                let res = M(q);
            }
            until (fin)
            fixup {
                if (res == Zero) {
                    set fin = true;
                }
                else {
                    H(qs[0]);
                    H(qs[1]);
                    X(q);
                }
            }
            Reset(q);
        }
    }
}