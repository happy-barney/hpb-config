
(use-package compile
	:ensure nil

	:preface
		(require 'ansi-color)

	:custom
		(compilation-ask-about-save         nil)
		(compilation-scroll-output          'first-error)

    :hook
		(compilation-filter . ansi-color-compilation-filter)
)
