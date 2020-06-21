namespace Solution {
 
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Canon;
 
    operation Solve (theta : Double, unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable multiple_of_pi = Truncate(PI()/theta);
 
        let unitary_pow = OperationPowCA(unitary, multiple_of_pi);
        
        mutable res = 0;
 
        using (q = Qubit()) {
            for (index in 0 .. 15) {
                unitary_pow(q);
                let m = M(q);
                if (m == One) {
                    set res = 1;
                    X(q);
                }
            }
            return res;
        }
    }
}