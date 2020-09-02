# SMIL Overlay for Text/Audio Synchronization #

This image depicts an example fileset for using SMIL to synchronize audio with eBook text.  It uses pseudocode markup.

See below for a description of this image.  Note that, for some strange reason, this image doesn't appear on chrome/safari, so click the link below to see it.

<img src='http://dl.dropbox.com/u/5509213/epub_wiki_images/SMILOverlayFileset.png' height='60%' width='60%' />


<a href='http://dl.dropbox.com/u/5509213/epub_wiki_images/SMILOverlayFileset.png'>click to enlarge</a>

## Description ##

There are four main items, represented by boxes: the OPF file, the text content document file(s), the SMIL file(s), and the audio file(s).

There is an arrow going from the OPF's manifest item element to the text content document, and an arrow going from another item element to the SMIL file.  The arrows match up the files referenced by the item elements.

There is an arrow going from the SMIL file to an audio file, and an arrow going from the SMIL file to the text content document.  The arrows match the media (text, audio) referred to in a SMIL par element.

Each box, except for that representing audio files, contains an XML snippet showing markup.

The OPF XML snippet says:
```
<manifest>
  <item id="ch1"
     href="chapter1.html"/>
  <item id="ch1_smil"
     href="chapter1.smil"/>
  ...
</manifest>

<spine>
  <item idref="ch1" 
     audio="ch1_smil"/>
  ...
</spine>
```

_Note: the OPF file in this example contains a reference to SMIL in the manifest.  In the spine, the item element refers to its text and the corresponding SMIL._

The text content document XML snippet contains a heading, two paragraphs, and nonsense lorem ipsum text:
```
<h1 id="id1">Lorem ipsum</h1>

<p id="id2">Lorem ipsum dolor sit amet, 
consectetur adipisicing elit, 
sed do eiusmod tempor</p>

<p id="id3">Duis aute irure dolor in 
reprehenderit in voluptate 
velit esse cillum dolore 
eu fugiat nulla pariatur.</p>
...
```
_Note: The text content document is unchanged by the presence of SMIL, which acts as a transparent overlay._

The SMIL file contains:
```
<par>
  <text src="chapter1.html#id1"/>
  <audio src="aud.mp3" 
     clipBegin="0" clipEnd="0:32"/>
</par>
<par>
  <text src="chapter1.html#id2"/>
  <audio src="aud.mp3" 
     clipBegin="0:32" clipEnd="1:00"/>
</par>
...
```
_Note: The SMIL synchronization points associate text fragments with audio clips.  In this way, the audio can be played while preserving structure in the text._

## Notes about this example ##
  * Fragment identifiers are used as the mechanism for linking from SMIL to text chunk here.  There are other options (XPath, XPointer).
  * Here the SMIL file corresponding to a text document is given via a made-up attribute in the OPF called "audio".  There are other ways of making this association.