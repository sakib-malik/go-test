package main

import (
	"testing"
)

func TestCmd(t *testing.T) {
	t.Run("Coverage Test 1", func(t *testing.T) {
		if true {
			Fun()
			t.Logf("2 == 2")
		} else {
			t.Error("2 != 2")
		}
	})
	t.Run("Coverage Test 2", func(t *testing.T) {
		if false {
			t.Logf("3 == 3")
		} else {
			t.Error("3 != 3")
		}
	})
}
