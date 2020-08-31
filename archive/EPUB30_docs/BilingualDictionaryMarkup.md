# Sample Bilingual Dictionary Publication #

**French-English Bilingual Dictionary**

Examples from Merriam-Webster's French-English Dictionary. Copyright (c) 2012, Merriam-Webster, Inc.



## package.opf ##

TBC

## french-to-english.xhtml ##

```
<?xml version="1.0" encoding="UTF-8"?>
<html xmlns:epub="http://www.idpf.org/2007/ops" xmlns:ssml="http://www.w3.org/2001/10/synthesis" xmlns="http://www.w3.org/1999/xhtml" profile="http://www.idpf.org/epub/30/profile/content/" ssml:alphabet="ipa" xml:lang="fr">
<head>
<style type="text/css">
/* Layout */
article {
    margin:0.5em;
    margin-bottom: 2em;
}

ol { 
    margin-bottom: 0em;
}

ol[epub\:type ~= part-of-speech-list] {
    margin-top: 0.375em;
}

ol[epub\:type ~= sense-list] {
    margin-top: 0.25em;
}

ol[epub\:type ~= phrase-list] {
    margin-top: 0em;
}

section {
    margin-top: 0.25em;
    margin-left: 2em;
    text-indent: 0em;
}

ol > li > ol > li {
    margin-left: 0em;
    margin-top: 0em;
    text-indent: -2em;
}

ol > li {
    margin-left: 1em;
    margin-top: 0.25em;
    text-indent: -1.5em;
}

/* Typography */
body {line-height:normal;}
sub, sup { font-size: .83em }
sub { vertical-align: sub }
sup { vertical-align: super }
i {font-style:italic}
b {font-weight:bold}
dfn {font-weight:bold;font-style:normal;font-size:125%;}
[epub\:type ~= part-of-speech],[epub\:type ~= gram-info],[epub\:type ~= trans-info] {font-style:italic}
article a {text-transform: uppercase;font-size: smaller;}
[epub\:type ~= ex]{color:purple;margin:0;padding:0}

/* List Numbering */
ol[epub\:type ~= part-of-speech-list] { list-style-type:none; }
ol[epub\:type ~= sense-list] {
   list-style-type:decimal;
   list-style-position: inside;
}
ol[epub\:type ~= phrase-list] { list-style-type:none; }
ol[epub\:type ~= sense-list] > li:only-of-type {list-style-type:none;display:inline;}
ol ol[epub\:type ~= sense-list] > li:only-of-type {list-style-type:none;display:inline;}
</style>
</head>

<body epub:type="dictionary">

<article id="à">
  <dfn>à</dfn> 
  <span epub:type="phonetic-transcription">[a]</span> 
  <span epub:type="part-of-speech">prep</span>
  <ol epub:type="sense-list">
    <li>
      <span epub:type="trans" xml:lang="en"> : to</span>
      <ol epub:type="phrase-list">
        <li>
          &lt;<span epub:type="ex" xml:lang="fr">je vais à Montréal</span> : <span epub:type="trans">I am going to Montreal</span>&gt;
        </li>
        <li>
          &lt;<span epub:type="ex" xml:lang="fr">as-tu téléphoné à ton père?</span> : <span epub:type="trans">did you call your dad?</span>&gt;
        </li>
        <li>
          &lt;<span epub:type="ex" xml:lang="fr">il a donné la clé à son frère</span> : <span epub:type="trans">he gave the key to his brother</span>&gt;
        </li>
      </ol>
    </li>
    <li>
      <span epub:type="trans" xml:lang="en"> : at</span>
      <ol epub:type="phrase-list">      
        <li>
          &lt;<span epub:type="ex" xml:lang="fr">à deux heures</span> : <span epub:type="trans">at two o'clock</span>&gt;
        </li>
        <li>
          &lt;<span epub:type="ex" xml:lang="fr">nous sommes à l'aéroport</span> : <span epub:type="trans">we are at the airport</span>&gt;
        </li>
      </ol>
    </li>
    <li>
      <span epub:type="trans" xml:lang="en"> : on</span>
      <ol epub:type="phrase-list">      
        <li>
          &lt;<span epub:type="ex" xml:lang="fr">à pied</span> : <span epub:type="trans">on foot, by foot</span>&gt;
        </li>
        <li>
          &lt;<span epub:type="ex" xml:lang="fr">à temps</span> : <span epub:type="trans">on time</span>&gt;
        </li>
      </ol>
    </li>
    <li>
      <span epub:type="trans" xml:lang="en"> : with </span>
      <span epub:type="phrase-group">
        &nbsp;&lt;<span epub:type="ex" xml:lang="fr">la fille aux cheveux blonds</span> : <span epub:type="trans">the girl with blond hair</span>&gt;
      </span>
    </li> 
    <li>
      <span epub:type="gram-info" xml:lang="en">(with infinitive)</span> 
      <span epub:type="trans" xml:lang="en"> : to</span>
      <ol epub:type="phrase-list">      
        <li>
          &lt;<span epub:type="ex" xml:lang="fr">ils ont appris à lire</span> : <span epub:type="trans">they learned how to read</span>&gt;
        </li>
        <li>
          &lt;<span epub:type="ex" xml:lang="fr">problèmes à résoudre</span> : <span epub:type="trans">problems to be solved</span>&gt;
        </li>
      </ol>
    </li>
    <li>
      <span epub:type="trans" xml:lang="en"> : from</span>
      <span epub:type="phrase-group">      
        &nbsp;&lt;<span epub:type="ex" xml:lang="fr">voler aux riches</span> : <span epub:type="trans">to steal from the rich</span>&gt;
      </span>
    </li>
    <li>
      <span epub:type="trans" xml:lang="en"> : per</span>
      <span epub:type="phrase-group">      
        &nbsp;&lt;<span epub:type="ex" xml:lang="fr">60 kilomètres à l'heure</span> : <span epub:type="trans">60 kilometers per hour</span>&gt;
      </span>
    </li> 
    <li>
      <span epub:type="trans" xml:lang="en"> : in, according to</span>
      <span epub:type="phrase-group">
        &nbsp;&lt;<span epub:type="ex" xml:lang="fr">à leur avis</span> : <span epub:type="trans">in their opinion</span>&gt;
      </span>
    </li>
  </ol>
</article>

<article id="abandon">
  <dfn>abandon</dfn> 
  <span epub:type="phonetic-transcription">[ab&#x0251;&#x0303;d&#x0254;&#x0303;]</span>
  <span epub:type="part-of-speech">nm</span> 
  <ol epub:type="sense-list">
    <li>
      <span epub:type="trans" xml:lang="en"> : state of neglect</span>
    </li> 
    <li>
      <span epub:type="trans" xml:lang="en"> : desertion, abandonment</span>
    </li> 
    <li>
      <span epub:type="trans" xml:lang="en"> : abandon, freedom</span>
    </li> 
    <li>
       <span epub:type="trans" xml:lang="en"> : surrender, renunciation</span>
    </li> 
    <li>
      <span epub:type="trans" xml:lang="en"> : withdrawal, retirement (in sports)</span>
    </li>
    <li epub:type="phrase-group">
      <dfn epub:type="idiom">laisser à l'abandon</dfn> 
      <span epub:type="trans" xml:lang="en"> : to neglect, to abandon</span>
    </li>
  </ol>
</article>

<article id="abandonner">
  <dfn>abandonner</dfn> 
  <span epub:type="phonetic-transcription">[ab&#x0251;&#x0303;d&#x0254;ne]</span>
  <ol epub:type="part-of-speech-list">
    <li>
      ▪ <span epub:type="part-of-speech">vt</span> 
      <ol epub:type="sense-list">
        <li>
          <span epub:type="trans" xml:lang="en"> : to abandon</span>
        </li> 
        <li>
          <span epub:type="trans" xml:lang="en"> : to surrender, to renounce</span>
        </li>
      </ol>
    </li>
    <li>
      ▪ <span epub:type="part-of-speech">vi</span> 
      <ol epub:type="sense-list">
        <li>
          <span epub:type="trans" xml:lang="en"> : to give up</span>
        </li>
      </ol>
    </li>
    <li>
      ▪ <dfn>s'abandonner</dfn> 
      <span epub:type="part-of-speech">vr</span> 
      <ol epub:type="sense-list">
        <li>
          <span epub:type="trans" xml:lang="en"> : to let oneself go, to neglect oneself</span>
        </li> 
        <li epub:type="phrase-group">
          <dfn epub:type="idiom">abandonner à</dfn>
          <span epub:type="trans" xml:lang="en"> : to give oneself up to (pleasures, etc.)</span>
        </li>
      </ol>
    </li>
  </ol>
</article>

<article id="abject">
  <dfn>abject</dfn>, 
  <!--The following would not have to be treated as a <dfn>. If it is to be one, the full form should be provided in the title attribute.--> 
  <dfn title="abjecte" ssml:ph="ab&#x0292;&#x03B5;kt">-jecte</dfn>
  <span epub:type="phonetic-transcription">[ab&#x0292;&#x03B5;kt]</span>
  <span epub:type="part-of-speech">adj</span>
  <ol epub:type="sense-list">
    <li><span epub:type="trans" xml:lang="en"> : despicable, contemptible</span>
    </li> 
    <li><span epub:type="trans" xml:lang="en"> : abject</span>
    </li>
  </ol> 
  <!--Example of derived headword at end of entry with no translations-->
  <section>
    — <dfn>abjectement</dfn> 
    <span epub:type="phonetic-transcription">[-&#x0292;&#x03B5;kt&#0259;m&#x0251;&#x0303;]</span>
    <span epub:type="part-of-speech">adv</span>
  </section>
</article>

<article id="aboie">
  <!--An example of a cross-ref stub entry, which is a print artifact. A publisher can use 
      the search-index to point directly to the entry for "aboyer".-->
  <dfn>aboie</dfn> 
  <span epub:type="phonetic-transcription">[abwa]</span>, 
  <dfn>aboiera</dfn>
  <span epub:type="phonetic-transcription">[abwara]</span>
  <i>etc.</i>
  <a href="#aboyer"><b>aboyer</b></a>
</article>

<article id="abois">
  <dfn>abois</dfn> 
  <span epub:type="phonetic-transcription">[abwa]</span> 
  <span epub:type="part-of-speech">nmpl</span> 
  <!--Example where the entry's only sense is a phrase-group (an idiom and its translation).-->
  <ol epub:type="sense-list">
    <li epub:type="phrase-group">
      <dfn epub:type="idiom">être aux abois</dfn> 
      <span epub:type="trans" xml:lang="en"> : to be at bay, to be desperate</span>
    </li>
  </ol>
</article>

<article id="abord">
  <dfn>abord</dfn> 
  <span epub:type="phonetic-transcription">[abɔr]</span> 
  <span epub:type="part-of-speech">nm</span> 
  <ol epub:type="sense-list">
    <li>
      <span epub:type="trans" xml:lang="en">
        <a epub:type="def" xml:lang="fr" href="#accès">accès</a> : access, approach
      </span>
    </li> 
    <li>
      <span epub:type="trans" xml:lang="en">
        : manner 
        <span epub:type="phrase-group">
          &lt;<span epub:type="ex" xml:lang="fr">il est d'un abord facile</span> : <span epub:type="trans">he's very approachable</span>&gt;
        </span>
      </span>
    </li> 
    <li>
      <!--Example of gram-info usage: the information here pertains to this form of the headword, rather than its translation. Contrast actif[2] below. -->
      <dfn>abords</dfn> 
      <span epub:type="gram-info">nmpl</span> 
      <span epub:type="trans" xml:lang="en"> : surroundings</span>
    </li> 
    <li epub:type="phrase-group">
      <dfn epub:type="idiom" title="d'abord">d'abord</dfn> 
      <span epub:type="trans" xml:lang="en"> : at first, firstly</span>
    </li>
    <li epub:type="phrase-group">
      <dfn epub:type="idiom">de prime abord</dfn>  
      <em xml:lang="en">or</em> 
      <dfn epub:type="idiom">au premier abord</dfn> 
      <span epub:type="trans" xml:lang="en"> : at first glance</span>
    </li>
  </ol>
</article>

<article id="actif_1">
  <dfn title="actif">actif<sup>1</sup></dfn>, 
  <dfn title="active" ssml:ph="aktiv">-tive</dfn> 
  <span epub:type="phonetic-transcription">[aktif, -tiv]</span> 
  <span epub:type="part-of-speech">adj</span> 
  <ol epub:type="sense-list">
    <li>
      <span epub:type="trans" xml:lang="en"> : active</span>
    </li> 
    <li>
      <span epub:type="trans" xml:lang="en"> : working 
        <span epub:type="phrase-group">
          &lt;<span epub:type="ex" xml:lang="fr">les mères actives</span> : <span epub:type="trans">working mothers</span>&gt;
        </span>
      </span>
    </li>
  </ol>
</article>

<article id="actif_2">
  <dfn title="actif">actif<sup>2</sup></dfn> 
  <span epub:type="part-of-speech">nm</span> 
  <ol epub:type="sense-list"> 
<!--Example of trans-info usage: here the grammatical info pertains to the translation, not the headword-->
    <li>
      <span epub:type="trans" xml:lang="en">
        : assets <span epub:type="trans-info">pl</span>, credits <span epub:type="trans-info">pl</span>
      </span>
    </li> 
    <li>
      <span epub:type="trans" xml:lang="en"> : active voice (in grammar)</span>
    </li>
  </ol>
</article>

</body>
</html>

```

## english-to-french.xhtml ##

```

<?xml version="1.0" encoding="UTF-8"?>
<html xmlns:epub="http://www.idpf.org/2007/ops" xmlns:ssml="http://www.w3.org/2001/10/synthesis" xmlns="http://www.w3.org/1999/xhtml" profile="http://www.idpf.org/epub/30/profile/content/" ssml:alphabet="ipa" xml:lang="en">
<head>
<style type="text/css">
/* Layout */
article {
    margin:0.5em;
    margin-bottom: 2em;
}

ol { 
    margin-bottom: 0em;
}

ol[epub\:type ~= part-of-speech-list] {
    margin-top: 0.375em;
}

ol[epub\:type ~= sense-list] {
    margin-top: 0.25em;
}

ol[epub\:type ~= phrase-list] {
    margin-top: 0em;
}

section {
    margin-top: 0.25em;
    margin-left: 2em;
    text-indent: 0em;
}

ol > li > ol > li {
    margin-left: 0em;
    margin-top: 0em;
    text-indent: -2em;
}

ol > li {
    margin-left: 1em;
    margin-top: 0.25em;
    text-indent: -1.5em;
}

/* Typography */
body {line-height:normal;}
sub, sup { font-size: .83em }
sub { vertical-align: sub }
sup { vertical-align: super }
i {font-style:italic}
b {font-weight:bold}
dfn {font-weight:bold;font-style:normal;font-size:125%;}
[epub\:type ~= part-of-speech],[epub\:type ~= gram-info],[epub\:type ~= trans-info] {font-style:italic}
article a {font-size: smaller;}
[epub\:type ~= ex]{color:purple;margin:0;padding:0}

/* List Numbering */
ol[epub\:type ~= part-of-speech-list] { list-style-type:none; }
ol[epub\:type ~= sense-list] {
   list-style-type:decimal;
   list-style-position: inside;
}
ol[epub\:type ~= phrase-list] { list-style-type:none; }
ol[epub\:type ~= sense-list] > li:only-of-type {list-style-type:none;display:inline;}
ol ol[epub\:type ~= sense-list] > li:only-of-type {list-style-type:none;display:inline;}
</style>
</head>

<body epub:type="dictionary">

<article id="abacus"> 
  <dfn>abacus</dfn> 
  <span epub:type="phonetic-transcription">[ˈæbəkəs]</span> 
  <span epub:type="part-of-speech">n</span>,  
  <span epub:type="gram-info">pl</span> <b>abaci</b> <span epub:type="phonetic-transcription">[ˈæbəˌsɑɪ, -kɪː]</span> <em>or</em> <b>abacuses</b> 
  <ol epub:type="sense-list">
    <li>
      <span epub:type="trans" xml:lang="fr"> : boulier <span epub:type="trans-info">m</span></span>
    </li>
  </ol>
</article>

<article id="absent_1"> 
  <dfn ssml:ph="æbˈsεnt" title="absent">absent<sup>1</sup></dfn> 
  <span epub:type="phonetic-transcription">[æbˈsεnt]</span> 
  <span epub:type="part-of-speech">vt</span> 
  <ol epub:type="sense-list">
    <li>
      <dfn epub:type="idiom">to absent oneself</dfn> 
      <span epub:type="trans" xml:lang="fr"> : s'absenter</span>
    </li>
  </ol>
</article>

<article id="absent_2"> 
  <dfn ssml:ph="ˈæbsənt" title="absent">absent<sup>2</sup></dfn>
  <span epub:type="phonetic-transcription">[ˈæbs<i>ə</i>nt]</span>
  <span epub:type="part-of-speech">adj</span>
  <ol epub:type="sense-list">
    <li>
      <span epub:type="trans" xml:lang="fr"> : absent</span>
    </li>
  </ol>
</article>

<article id="accordionist"> 
  <dfn>accordionist</dfn> 
  <span epub:type="phonetic-transcription">[əˈkɔrdiənɪst]</span> 
  <span epub:type="part-of-speech">n</span> 
  <ol epub:type="sense-list">
    <li>
      <span epub:type="trans" xml:lang="fr"> : accordéoniste <span epub:type="trans-info">mf</span></span>
    </li>
  </ol>
</article>

<article id="account_1"> 
  <dfn title="account">account<sup>1</sup></dfn> 
  <span epub:type="phonetic-transcription">[əˈkant]</span> 
  <ol epub:type="part-of-speech-list">
    <li>
      ▪ <span epub:type="part-of-speech">vt</span> 
      <ol epub:type="sense-list"> 
        <li>
          <span epub:type="trans" xml:lang="fr"><a epub:type="def" xml:lang="en" href="#consider">CONSIDER</a> : estimer, juger</span>
        </li>
      </ol>
    </li>
    <li>
      ▪ <span epub:type="part-of-speech">vi</span> 
      <ol epub:type="sense-list"> 
        <li epub:type="phrase-group"> 
          <dfn epub:type="idiom">to account for</dfn> 
          <span epub:type="trans" xml:lang="fr"><a epub:type="def" xml:lang="en" href="#explain">EXPLAIN</a> : justifier, expliquer</span>
        </li> 
        <li epub:type="phrase-group"> 
          <dfn epub:type="idiom">to account for</dfn> 
          <span epub:type="trans" xml:lang="fr"><a epub:type="def" xml:lang="en" href="#represent">REPRESENT</a> : représenter</span>
        </li>
      </ol>
    </li>
  </ol>
</article>

<article id="account_2"> 
  <dfn title="account">account<sup>2</sup></dfn> 
  <span epub:type="part-of-speech">n</span> 
  <ol epub:type="sense-list">
    <li> 
      <span epub:type="trans" xml:lang="fr"> : compte <span epub:type="trans-info">m</span></span>
      <span epub:type="phrase-group">
        &lt;<span epub:type="ex">bank account</span> : <span epub:type="trans" xml:lang="fr">compte bancaire</span>&gt;
      </span>
    </li> 
    <li> 
      <span epub:type="trans" xml:lang="fr"> <a epub:type="def" xml:lang="en" href="#report">REPORT</a> : compte <span epub:type="trans-info">m</span> rendu, exposé <span epub:type="trans-info">m</span></span>
    </li> 
    <li>
      <span epub:type="trans" xml:lang="fr"> <a epub:type="def" xml:lang="en" href="#worth">WORTH</a> : importance <span epub:type="trans-info">f</span></span>
      <span epub:type="phrase-group">
        &lt;<span epub:type="ex">to be of little account</span> : <span epub:type="trans" xml:lang="fr">avoir peu d'importance</span>&gt;
      </span>
    </li>
    <li epub:type="phrase-group">
      <dfn epub:type="idiom">on account of</dfn>
      <span epub:type="trans" xml:lang="fr"> <a epub:type="def" xml:lang="en" href="#because of">BECAUSE OF</a> : à cause de</span>
    </li>
    <li epub:type="phrase-group">
      <dfn epub:type="idiom">on no account</dfn> 
      <span epub:type="trans" xml:lang="fr"> : en aucun cas, sous aucun prétexte</span>
    </li> 
    <li epub:type="phrase-group"> 
      <dfn epub:type="idiom">on one's account</dfn> 
      <span epub:type="trans" xml:lang="fr"> : à cause de soi, à son sujet</span>
      <span epub:type="phrase-group">
        &lt;<span epub:type="ex">don't worry on my account</span> : <span epub:type="trans" xml:lang="fr">ne t'inquiète pas à mon sujet</span>&gt;
        </span>
      </span>
    </li> 
    <li epub:type="phrase-group"> 
      <dfn epub:type="idiom">to take into account</dfn> 
      <span epub:type="trans" xml:lang="fr"> : tenir compte de</span>
    </li>
  </ol>
</article>

<article id="acoustic"> 
  <dfn>acoustic</dfn> 
  <span epub:type="phonetic-transcription">[əˈkuːstɪk]</span> 
  <em>or</em> 
  <dfn>acoustical</dfn> 
  <span epub:type="phonetic-transcription">[əˈkuːstɪk<i>ə</i>l]</span> 
  <span epub:type="part-of-speech">adj</span> 
  <ol epub:type="sense-list">
    <li>
      <span epub:type="trans" xml:lang="fr"> : acoustique</span>
    </li>
  </ol> 
  <section>
    — <dfn>acoustically</dfn> 
    <span epub:type="part-of-speech">adv</span>
  </section>
</article>

<article id="afraid"> 
  <dfn>afraid</dfn> 
  <span epub:type="phonetic-transcription">[əˈfreɪd]</span> 
  <span epub:type="part-of-speech">adj</span> 
  <ol epub:type="sense-list">
    <li epub:type="phrase-group"> 
      <dfn epub:type="idiom">to be afraid of</dfn> 
      <span epub:type="trans" xml:lang="fr"> <a epub:type="def" xml:lang="en" href="#fear">FEAR</a> : avoir peur de, craindre</span>
      <span epub:type="phrase-group">
        &lt;<span epub:type="ex">he's afraid of falling</span> : <span epub:type="trans" xml:lang="fr">il a peur de tomber</span>&gt;
      </span>
    </li>
    <li>
      <!--this particular sense-group does not have a direct translation, but only a contextual label (def) followed by phrases that have translations-->
      <span epub:type="def" xml:lang="en">(<i>indicating regret</i>)</span>
      <ol epub:type="phrase-list">
        <li>
          &lt;<span epub:type="ex">I'm afraid I can't come</span> : <span epub:type="trans" xml:lang="fr">je regrette de ne pas pouvoir venir</span>&gt;
        </li> 
        <li>
          &lt;<span epub:type="ex">I'm afraid not</span> : <span epub:type="trans" xml:lang="fr">hélas, non</span>&gt;
        </li>
      </ol>
    </li>
  </ol>
</article>

<article id="afterward"> 
  <dfn>afterward</dfn> 
  <span epub:type="phonetic-transcription">[ˈæftərwərd]</span> 
  <em>or</em> 
  <dfn>afterwards</dfn> 
  <span epub:type="phonetic-transcription">[-wərdz]</span> 
  <span epub:type="part-of-speech">adv</span> 
  <ol epub:type="sense-list">
    <li>
      <span epub:type="trans" xml:lang="fr"> : après, ensuite</span>
      <span epub:type="phrase-group">
        &lt;<span epub:type="ex" xml:lang="en">soon afterward</span> : <span epub:type="trans" xml:lang="fr">peu après</span>&gt;
      </span>
    </li>
  </ol>
</article>

</body>
</html>
```


## search-index\_french.xml ##

TBC


## search-index\_english.xml ##

TBC