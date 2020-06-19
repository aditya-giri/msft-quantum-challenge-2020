// Implement a unitary operation on a register of N qubits that decrements the number written in the register modulo 2N.

// Your operation should take a register of type LittleEndian - an array of qubits that encodes an unsigned integer in little-endian format, with the least significant bit written first (corresponding to the array element with index 0). The "output" of your solution is the state in which it left the input qubits.

// For example, if the qubits passed to your operation are in the state 12√(|00⟩+|01⟩)=12√(|0⟩+|2⟩), they should be transformed to the state 12√(|(0−1)mod22⟩+|(2−1)mod22⟩)=12√(|3⟩+|1⟩)=12√(|11⟩+|10⟩).

namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

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