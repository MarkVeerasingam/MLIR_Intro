#include <iostream>
#include <cstdint>

extern "C"
{
    struct MemRefDescriptor
    {
        float *allocated;
        float *aligned;
        int64_t offset;
        int64_t sizes[2];
        int64_t strides[2];
    };

    MemRefDescriptor tensor_matmul(float *allocated, float *aligned,
                                   int64_t offset, int64_t size0, int64_t size1,
                                   int64_t stride0, int64_t stride1);
}

void printMatrix(const MemRefDescriptor &m)
{
    std::cout << "[\n";
    for (int64_t i = 0; i < m.sizes[0]; ++i)
    {
        std::cout << "  [";
        for (int64_t j = 0; j < m.sizes[1]; ++j)
        {
            std::cout << m.aligned[i * m.strides[0] + j * m.strides[1]];
            if (j + 1 < m.sizes[1])
                std::cout << ", ";
        }
        std::cout << "]\n";
    }
    std::cout << "]\n";
}

int main()
{
    constexpr int64_t rows = 2, cols = 2;
    float *buffer = new float[rows * cols];
    int64_t strides[2] = {cols, 1};

    auto result = tensor_matmul(buffer, buffer, 0, rows, cols, strides[0], strides[1]);

    std::cout << "Result of tensor addition:\n";
    printMatrix(result);

    std::cout << "\nExpected:\n[[19.0, 22.0],\n [6.0, 8.0]]\n";

    delete[] buffer;
    return 0;
}
