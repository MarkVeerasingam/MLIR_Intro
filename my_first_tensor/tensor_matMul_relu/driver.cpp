#include <iostream>
#include <cstdint>

// Represent a 2D matrix buffer descriptor
extern "C"
{
    struct MemRefDescriptor
    {
        float *allocated;   // pointer to allocated buffer
        float *aligned;     // pointer to aligned buffer (usually same as allocated)
        int64_t offset;     // offset from aligned pointer (usually 0)
        int64_t sizes[2];   // sizes of the 2 dimensions (rows, cols)
        int64_t strides[2]; // strides of the 2 dimensions
    };

    // Matrix multiply function: result = lhs * rhs
    // lhs is MxK, rhs is KxN, result is MxN
    MemRefDescriptor tensor_multiply(float *allocated, float *aligned,
                                     int64_t offset,
                                     int64_t M, int64_t K, int64_t N,
                                     int64_t lhs_stride0, int64_t lhs_stride1,
                                     int64_t rhs_stride0, int64_t rhs_stride1);
}

// Helper to print a matrix from a MemRefDescriptor
void printMatrix(const MemRefDescriptor &m)
{
    std::cout << "[\n";
    for (int64_t i = 0; i < m.sizes[0]; ++i)
    {
        std::cout << "  [";
        for (int64_t j = 0; j < m.sizes[1]; ++j)
        {
            int64_t idx = i * m.strides[0] + j * m.strides[1];
            std::cout << m.aligned[idx];
            if (j + 1 < m.sizes[1])
                std::cout << ", ";
        }
        std::cout << "]\n";
    }
    std::cout << "]\n";
}

int main()
{
    constexpr int64_t M = 2, K = 2, N = 2;
    float *buffer = new float[M * N];
    int64_t strides[2] = {N, 1}; // row-major strides for output matrix

    auto result = tensor_multiply(buffer, buffer, 0,
                                  M, K, N,
                                  K, 1,  // lhs strides (M x K)
                                  N, 1); // rhs strides (K x N)

    std::cout << "Result of matrix multiplication:\n";
    printMatrix(result);

    std::cout << "\nExpected result:\n[[58.0, 64.0],\n [139.0, 154.0]]\n";

    delete[] buffer;
    return 0;
}
