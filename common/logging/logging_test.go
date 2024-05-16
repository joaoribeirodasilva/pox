package logging

import (
	"testing"
)

func TestLoggingSimpleError(t *testing.T) {
	logging := New()

	err := logging.Log(LOG_ENTRY_ERROR, "logging::TestLoggingError", "Simple error string")
	if err == nil {
		t.Fatalf("No error message returned")
	}
}

func TestLoggingVariadicError(t *testing.T) {
	logging := New()

	err := logging.Log(LOG_ENTRY_ERROR, "logging::TestLoggingError", "Variadic error %d", 1)
	if err == nil {
		t.Fatalf("No error message returned")
	}
}
