package t

import (
	"testing"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

func TestDummySourceService(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "TESTAUTO Suite")
}
