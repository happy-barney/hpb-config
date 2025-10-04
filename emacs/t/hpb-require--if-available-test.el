
(require 'hpb-require--if-available)

(ert-deftest test-hpb-require--if-available-existing-feature ()
	"Should successfully require an existing feature and return t"
	(should (eq t (hpb-require--if-available 'cl-lib)))
)

(ert-deftest test-hpb-require--if-available-non-existing-feature ()
	"Should return nil for non-existing feature"
	(should (eq nil (hpb-require--if-available 'non-existing-package-xyz-123)))
)

(ert-deftest test-hpb-require--if-available-already-loaded ()
	"Should return t for already loaded feature"
	(require 'seq)
	(should (eq t (hpb-require--if-available 'seq)))
)
