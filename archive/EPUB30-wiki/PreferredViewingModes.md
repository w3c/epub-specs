# Introduction #

It is argued that EPUB3 does not allow authors/publishers to indicate which viewing mode is appropriate for Japanese manga thus making EPUB manga authoring too expensive.  It is proposed to create some additional metadata vocabularies for authors/publishers to indicate which viewing mode is appropriate for fixed layout publications.

As in the case of the fixed layout vocabulary, no working groups need to be established for developing such additional metadata vocabularies.  The IDPF board may register vocabularies created by volunteers.

## Members ##

Murata, Jim, Brady, Koji, Matthieu

## Requirement ##

## Strawman proposal ##

Jim Lester  provided a [simplified  version of the available  ‘PDF view mode options’](https://groups.google.com/forum/?fromgroups=#!topic/epub-working-group/74CdN-gP4VQ).

Publishers would like to specify different view options for different screen size.  One possible solution is to combine media queries of CSS and view options.

Other view options have been suggested.

  1. The gap between the recto-page image and the verso-page image in a spread (See [Request not to draw anything between two pages spread](https://github.com/readium/readium/issues/218))
  1. Whether or not the header/footer should be displayed

Koji's summary of interviews with Shuueisha [View Modes, Actions, View Mode State Machine, and Miscellaneous properties](http://www.google.com/url?q=https%3A%2F%2Fgroups.google.com%2Fforum%2F%3Ffromgroups%23!topic%2Fepub-working-group%2FZ3krgHNE6jo)