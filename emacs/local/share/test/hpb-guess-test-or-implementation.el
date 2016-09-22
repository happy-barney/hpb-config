
(require 'hpb-perl-find-related-file)

(ert-deftest test-hpb-perl-looks-like-test-file-p ()
  "Does it properly recognize test file from its name?"

  (should-not (hpb-perl-looks-like-test-file-p "foo/bar/foo-bar.t"))
  (should-not (hpb-perl-looks-like-test-file-p "foo-bar.t"))
  (should-not (hpb-perl-looks-like-test-file-p "foo/bar/t/foo-bar.pm"))
  (should     (hpb-perl-looks-like-test-file-p "foo/bar/t/foo-bar.t"))
  (should     (hpb-perl-looks-like-test-file-p "foo/bar/t/foo/bar.t"))
)

(ert-deftest test-hpb-perl-looks-like-play-file-p ()
  "Does it properly recognize test file from its name?"

  (should-not (hpb-perl-looks-like-play-file-p "foo/bar/foo-bar.t"))
  (should-not (hpb-perl-looks-like-play-file-p "foo-bar.pm"))
  (should-not (hpb-perl-looks-like-play-file-p "foo/bar/t/foo-bar.pm"))
  (should-not (hpb-perl-looks-like-play-file-p "foo/bar/t/lib/foo-bar.pm"))
  (should     (hpb-perl-looks-like-play-file-p "foo/bar/lib/foo-bar.pm"))
  (should     (hpb-perl-looks-like-play-file-p "foo/bar/lib/foo/bar.pm"))
)

(ert-deftest test-hpb-perl-make-test-file-path ()
  "Conversion of implementation file to test file"
  (should (s-equals?
           (hpb-perl-make-test-file-path "a/lib/b/lib/A/B/C.pm")
           "a/lib/b/t/A-B-C.t"))
  )

(ert-deftest test-hpb-perl-make-play-file-path ()
  "Conversion of test file to implementation file"
  (should (s-equals?
           (hpb-perl-make-play-file-path "a/lib/b/t/A-B-C.t")
           "a/lib/b/lib/A/B/C.pm"))
  )

(ert-deftest test-hpb-perl-guess-test-or-implementation-path ()
  "Conversion of file into related file"
  (should (s-equals?
           (hpb-perl-guess-test-or-implementation-path "a/lib/b/t/A-B-C.t")
           "a/lib/b/lib/A/B/C.pm"))
  (should (s-equals?
           (hpb-perl-guess-test-or-implementation-path "a/lib/b/t/A-B-C.t")
           "a/lib/b/lib/A/B/C.pm"))
  (should-not (hpb-perl-guess-test-or-implementation-path "a/t/lib/A/B.pm"))
)

