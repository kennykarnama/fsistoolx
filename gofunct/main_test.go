package main

import (
	"math"
	"testing"
)

func TestMajorityScoreF64(t *testing.T) {
	// Test data: 1.00, 3.00, 2.00, 2.00, 3.00, 1.00, 2.00
	// Score counts: 1→2, 2→3, 3→2
	// Cumulative: i=1: cum=2, 2 > 3 (no), i=2: cum=5, 5 > 3 (yes) → return 2
	values := []float64{1.00, 3.00, 2.00, 2.00, 3.00, 1.00, 2.00}
	result := majorityScoreF64Wrapper(values)

	if result != 2 {
		t.Errorf("majorityScoreF64Wrapper() = %d, want 2", result)
	}
}

func TestMajorityScoreF64_PerfectMajority(t *testing.T) {
	// Test with clear majority: 5.00 appears 4 times out of 5
	values := []float64{5.00, 5.00, 5.00, 5.00, 1.00}
	result := majorityScoreF64Wrapper(values)

	if result != 5 {
		t.Errorf("majorityScoreF64Wrapper() = %d, want 5", result)
	}
}

func TestMajorityScoreF64_NoStrictMajority(t *testing.T) {
	// Test with equal distribution [1,2,3,4,5]
	// Half=2, Cumulative: i=1: 1 <= 2, i=2: 2 <= 2, i=3: 3 > 2 → return 3
	// This is actually a cumulative majority (first 3 scores cover > half)
	values := []float64{1.00, 2.00, 3.00, 4.00, 5.00}
	result := majorityScoreF64Wrapper(values)

	if result != 3 {
		t.Errorf("majorityScoreF64Wrapper() = %d, want 3", result)
	}
}

func TestMajorityScoreF64_SingleValue(t *testing.T) {
	// Test with single value
	values := []float64{3.00}
	result := majorityScoreF64Wrapper(values)

	// Single value: half=0, cumulative=1 > 0 → return 3
	if result != 3 {
		t.Errorf("majorityScoreF64Wrapper() = %d, want 3", result)
	}
}

// Test: PearsonCorrelationF64 function with given data
func TestPearsonCorrelationF64GivenData(t *testing.T) {
	x := []float64{
		-0.1,
		0.05263157895,
		0.02702702703,
		-0.02631578947,
		0.1176470588,
		0.4166666667,
		-0.3684210526,
		-0.05,
		0.08108108108,
		-0.02631578947,
		-0.05,
		0.05263157895,
	}

	y := []float64{
		36.0,
		44.0,
		20.0,
		40.0,
		36.0,
		44.0,
		20.0,
		40.0,
		36.0,
		44.0,
		20.0,
		40.0,
	}

	want := 0.5261105818327818
	got, err := pearsonCorrelationF64Wrapper(x, y)

	if err != nil {
		t.Errorf("pearsonCorrelationWrapper() error = %v, want no error", err)
		return
	}

	if math.Abs(got-want) > 1e-9 {
		t.Errorf("pearsonCorrelationWrapper() = %.15f, want %.15f", got, want)
	}
}

// Test: PearsonCorrelationF64 with perfect positive correlation
func TestPearsonCorrelationF64PerfectPositive(t *testing.T) {
	x := []float64{1.0, 2.0, 3.0, 4.0, 5.0}
	y := []float64{2.0, 4.0, 6.0, 8.0, 10.0}

	want := 1.0
	got, err := pearsonCorrelationF64Wrapper(x, y)

	if err != nil {
		t.Errorf("pearsonCorrelationWrapper() error = %v, want no error", err)
		return
	}

	if math.Abs(got-want) > 1e-9 {
		t.Errorf("pearsonCorrelationWrapper() = %.15f, want %.15f", got, want)
	}
}

// Test: PearsonCorrelationF64 with perfect negative correlation
func TestPearsonCorrelationF64PerfectNegative(t *testing.T) {
	x := []float64{1.0, 2.0, 3.0, 4.0, 5.0}
	y := []float64{10.0, 8.0, 6.0, 4.0, 2.0}

	want := -1.0
	got, err := pearsonCorrelationF64Wrapper(x, y)

	if err != nil {
		t.Errorf("pearsonCorrelationWrapper() error = %v, want no error", err)
		return
	}

	if math.Abs(got-want) > 1e-12 {
		t.Errorf("pearsonCorrelationWrapper() = %.15f, want %.15f", got, want)
	}
}

// Test: PearsonCorrelationF64 with zero length
func TestPearsonCorrelationF64ZeroLength(t *testing.T) {
	x := []float64{}
	y := []float64{}

	_, err := pearsonCorrelationF64Wrapper(x, y)

	if err == nil {
		t.Error("pearsonCorrelationWrapper() expected error for empty arrays, got nil")
	}
}

// Test: PearsonCorrelationF64 with mismatched lengths throws error
func TestPearsonCorrelationF64MismatchedLengths(t *testing.T) {
	x := []float64{1.0, 2.0, 3.0}
	y := []float64{1.0, 2.0}

	_, err := pearsonCorrelationF64Wrapper(x, y)

	if err == nil {
		t.Error("pearsonCorrelationWrapper() expected error for mismatched lengths, got nil")
	}
}

// Test: PearsonCorrelationF64 with no variance (constant values)
func TestPearsonCorrelationF64NoVariance(t *testing.T) {
	x := []float64{5.0, 5.0, 5.0, 5.0}
	y := []float64{1.0, 2.0, 3.0, 4.0}

	got, err := pearsonCorrelationF64Wrapper(x, y)

	if err != nil {
		t.Errorf("pearsonCorrelationWrapper() error = %v, want no error", err)
		return
	}

	if !math.IsNaN(got) && got != 0.0 {
		t.Errorf("pearsonCorrelationWrapper() = %.15f, want NaN or 0.0", got)
	}
}

// Test: PearsonCorrelationF64 with single pair
func TestPearsonCorrelationF64SinglePair(t *testing.T) {
	x := []float64{1.0}
	y := []float64{2.0}

	got, err := pearsonCorrelationF64Wrapper(x, y)

	if err != nil {
		t.Errorf("pearsonCorrelationWrapper() error = %v, want no error", err)
		return
	}

	if !math.IsNaN(got) && got != 0.0 {
		t.Errorf("pearsonCorrelationF64Wrapper() = %.15f, want NaN or 0.0 for single pair", got)
	}
}

// Test: PearsonCorrelationF64 with uncorrelated data
func TestPearsonCorrelationF64Uncorrelated(t *testing.T) {
	x := []float64{1.0, 2.0, 1.0, 2.0, 1.0}
	y := []float64{1.0, 1.0, 2.0, 2.0, 1.5}

	got, err := pearsonCorrelationF64Wrapper(x, y)

	if err != nil {
		t.Errorf("pearsonCorrelationWrapper() error = %v, want no error", err)
		return
	}

	if math.Abs(got) > 0.5 {
		t.Errorf("pearsonCorrelationWrapper() = %.15f, want value close to 0", got)
	}
}

func TestMinimumScoreF64Basic(t *testing.T) {
	values := []float64{5.0, 2.0, 8.0, 1.0, 9.0}
	want := 1.0

	got, err := minimumScoreF64Wrapper(values)

	if err != nil {
		t.Errorf("minimumScoreF64Wrapper() error = %v, want no error", err)
		return
	}

	if got != want {
		t.Errorf("minimumScoreF64Wrapper() = %.2f, want %.2f", got, want)
	}
}

func TestMinimumScoreF64NegativeValues(t *testing.T) {
	values := []float64{-5.0, -2.0, -8.0, -1.0, -9.0}
	want := -9.0

	got, err := minimumScoreF64Wrapper(values)

	if err != nil {
		t.Errorf("minimumScoreF64Wrapper() error = %v, want no error", err)
		return
	}

	if got != want {
		t.Errorf("minimumScoreF64Wrapper() = %.2f, want %.2f", got, want)
	}
}

func TestMinimumScoreF64MixedValues(t *testing.T) {
	values := []float64{10.5, -3.2, 7.8, 0.0, -15.7, 22.1}
	want := -15.7

	got, err := minimumScoreF64Wrapper(values)

	if err != nil {
		t.Errorf("minimumScoreF64Wrapper() error = %v, want no error", err)
		return
	}

	if got != want {
		t.Errorf("minimumScoreF64Wrapper() = %.2f, want %.2f", got, want)
	}
}

func TestMinimumScoreF64SingleValue(t *testing.T) {
	values := []float64{42.0}
	want := 42.0

	got, err := minimumScoreF64Wrapper(values)

	if err != nil {
		t.Errorf("minimumScoreF64Wrapper() error = %v, want no error", err)
		return
	}

	if got != want {
		t.Errorf("minimumScoreF64Wrapper() = %.2f, want %.2f", got, want)
	}
}

func TestMinimumScoreF64EmptyArray(t *testing.T) {
	values := []float64{}

	_, err := minimumScoreF64Wrapper(values)

	if err == nil {
		t.Error("minimumScoreF64Wrapper() expected error for empty array, got nil")
	}
}

func TestMinimumScoreF64AllSameValues(t *testing.T) {
	values := []float64{7.5, 7.5, 7.5, 7.5}
	want := 7.5

	got, err := minimumScoreF64Wrapper(values)

	if err != nil {
		t.Errorf("minimumScoreF64Wrapper() error = %v, want no error", err)
		return
	}

	if got != want {
		t.Errorf("minimumScoreF64Wrapper() = %.2f, want %.2f", got, want)
	}
}

func TestMinimumScoreF64DecimalValues(t *testing.T) {
	values := []float64{3.14159, 2.71828, 1.41421, 1.73205}
	want := 1.41421

	got, err := minimumScoreF64Wrapper(values)

	if err != nil {
		t.Errorf("minimumScoreF64Wrapper() error = %v, want no error", err)
		return
	}

	if math.Abs(got-want) > 1e-5 {
		t.Errorf("minimumScoreF64Wrapper() = %.5f, want %.5f", got, want)
	}
}
