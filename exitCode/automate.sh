#!/bin/bash

# Path to the C++ source file
SOURCE_FILE="prog1.cpp"

# Iterate over a smaller range for demonstration purposes
for i in {-2147483649,-2147483648,-2147483647,-2147483646,-1,0,1,2147483646,2147483647,4294967295,4294967296}
# for i in $(seq -256 256)
do
    # Update the return value in the source file
    sed -i "s/return .*/return $i;/" $SOURCE_FILE
    
    # Compile the program
    g++ $SOURCE_FILE -o prog1
    
    # Check if the compilation was successful
    if [ $? -eq 0 ]; then
        # Run the compiled program
        ./prog1
        # Print the return code
        echo "status code is $? for return value $i"
        
    else
        # Print the error message if compilation fails
        echo "Compilation failed for return value $i"
    fi
done
