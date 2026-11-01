;;; -*- Mode: Emacs-Lisp -*-

(require 'hpb-tempo)

(tempo-define-template "hpb-perl-guess-package"
  '("package " (hpb-perl--guess-package-name) ";" n
    ))

;;
(tempo-define-template "hpb-perl-use-pragma"
  '("use strict;" n
    "use warnings;" n
    "use feature ':5.10';" n
    n
    "our $AUTHORITY = 'cpan:BARNEY';" n
    n
    ))

;;
(tempo-define-template "hpb-perl-test-prologue"
  '(n
    "use strict;" n
    "use warnings;" n
    n
    "use require::relative q (test-helper.pl);" n
    n
    ))

;;
(tempo-define-template "hpb-perl-pod-name"
    '("=head1 NAME" n n (hpb-perl--guess-package-name) n n))

(tempo-define-template "hpb-perl-pod-version"
  '("=head1 VERSION"
    n n
    (hpb-perl-detect-version-number)
    n n
    ))

;;
(tempo-define-template "hpb-perl-feature-5"       '("use feature ':5.10';" n))
(tempo-define-template "hpb-perl-pod-synopsis"    '("=head1 SYNOPSIS"    n n "   " ))
(tempo-define-template "hpb-perl-pod-description" '("=head1 DESCRIPTION" n n ))
(tempo-define-template "hpb-perl-pod-methods"     '("=head1 METHODS"     n n ))
(tempo-define-template "hpb-perl-pod-variables"   '("=head1 VARIABLES"   n n ))
(tempo-define-template "hpb-perl-pod-see-also"    '("=head1 SEE ALSO"    n n ))
(tempo-define-template "hpb-perl-pod-repository"  '("=head1 REPOSITORY"  n n ))
(tempo-define-template "hpb-perl-pod-head1"       '("=head1 " ~ n n ))
(tempo-define-template "hpb-perl-pod-head2"       '("=head2 " ~ n n ))
(tempo-define-template "hpb-perl-pod-item"        '("=item " ))
(tempo-define-template "hpb-perl-pod-back"        '("=back" n n ))
(tempo-define-template "hpb-perl-pod-over"        '("=over" n n "=item "))

;;
(tempo-define-template "hpb-perl-pod-author"
  '("=head1 AUTHOR" n
    n
    "Branislav Zahradník <barney@cpan.org>" n
    n))

(tempo-define-template "hpb-perl-pod-copyright-and-licence"
  '("=head1 COPYRIGHT AND LICENCE" n
    n
	;(hpb-perl-guess-distribution-name)
    "This distribution is distributed under Artistic Licence 2.0." n
    n))

;;;
(provide 'hpb-perl-templates)
