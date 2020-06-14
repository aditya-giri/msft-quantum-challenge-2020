
namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation TestSolve() : Int {
        return Solve_a1(Z);
    }
}