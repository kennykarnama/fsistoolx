// gofunct.go
package main

/*
#include <stdint.h>
*/
import "C"
import (
	"fmt"
	"math"
	"unsafe"

	"github.com/montanaflynn/stats"
)

//export MajorityScoreF64
func MajorityScoreF64(values *C.double, length C.int) C.int {
	// Convert C array → Go slice
	n := int(length)
	slice := unsafe.Slice((*float64)(unsafe.Pointer(values)), n)

	counts := [6]int{} // index 1..5

	for _, v := range slice {
		iv := int(math.Round(v))
		if iv >= 1 && iv <= 5 {
			counts[iv]++
		}
	}

	half := n / 2

	cumulative := 0
	for i := 1; i <= 5; i++ {
		cumulative += counts[i]
		if cumulative > half {
			return C.int(i)
		}
	}

	return 0
}

// Go wrapper for testing - not exported to C
func majorityScoreF64Wrapper(values []float64) int {
	if len(values) == 0 {
		return 0
	}
	result := MajorityScoreF64((*C.double)(unsafe.Pointer(&values[0])), C.int(len(values)))
	return int(result)
}

//export PearsonCorrelationF64
func PearsonCorrelationF64(arr1 *C.double, arr2 *C.double, lengthArr C.int) C.double {
	n := int(lengthArr)

	if n == 0 {
		return C.double(0.0)
	}

	// Convert C arrays → Go slices
	slice1 := unsafe.Slice((*float64)(unsafe.Pointer(arr1)), n)
	slice2 := unsafe.Slice((*float64)(unsafe.Pointer(arr2)), n)

	result, err := stats.Correlation(slice1, slice2)
	if err != nil {
		return C.double(0.0)
	}

	return C.double(result * 1.0)
}

// Go wrapper for testing - not exported to C
func pearsonCorrelationF64Wrapper(arr1, arr2 []float64) (float64, error) {
	if len(arr1) != len(arr2) {
		return 0, fmt.Errorf("PearsonCorrelation: arr1 and arr2 must have the same length")
	}

	if len(arr1) == 0 {
		return 0, fmt.Errorf("PearsonCorrelation: arrays cannot be empty")
	}

	result := PearsonCorrelationF64(
		(*C.double)(unsafe.Pointer(&arr1[0])),
		(*C.double)(unsafe.Pointer(&arr2[0])),
		C.int(len(arr1)),
	)

	if result != result {
		return 0, fmt.Errorf("PearsonCorrelation: calculation error")
	}

	return float64(result), nil
}

//export MinimumScoreF64
func MinimumScoreF64(values *C.double, length C.int) C.double {
	n := int(length)

	if n == 0 {
		return C.double(0.0)
	}

	// Convert C array → Go slice
	slice := unsafe.Slice((*float64)(unsafe.Pointer(values)), n)

	result, err := stats.Min(slice)
	if err != nil {
		return C.double(0.0)
	}

	return C.double(result)
}

// Go wrapper for testing - not exported to C
func minimumScoreF64Wrapper(values []float64) (float64, error) {
	if len(values) == 0 {
		return 0, fmt.Errorf("MinimumScore: array cannot be empty")
	}

	result := MinimumScoreF64(
		(*C.double)(unsafe.Pointer(&values[0])),
		C.int(len(values)),
	)

	return float64(result), nil
}

func main() {}
