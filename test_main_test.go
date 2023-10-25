package t

import (
	"test-auto/lib"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

var _ = Describe("Source Service", func() {

	Describe("should return `HAHA`", func() {
		It("When called", func() {
			res := lib.FUN()
			Expect(res).To(Equal("HAHA"))

		})
	})

	Describe("should not return `HAHA`", func() {
		It("When called", func() {
			res := lib.FUN()
			Expect(res).To(Equal("NANA"))
		})
	})
})
