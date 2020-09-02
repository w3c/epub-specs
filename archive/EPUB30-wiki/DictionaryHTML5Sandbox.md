# HTML5 Markup Sandbox: English Monolingual #

## English Monolingual Dictionary ##

Examples from Merriam-Webster Online Dictionary. Copyright (c) 2012, Merriam-Webster, Inc.

### Markup examples, Romain ###

See also the [rendered HTML](http://pagist.github.com/?4072659).

```
<?xml version="1.0" encoding="UTF-8"?>
<html xmlns:epub="http://www.idpf.org/2007/ops" xmlns:ssml="http://www.w3.org/2001/10/synthesis" xmlns="http://www.w3.org/1999/xhtml" profile="http://www.idpf.org/epub/30/profile/content/" ssml:alphabet="ipa" xml:lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <title>EPUB Dictionary Sample, Copyright © 2012 Merriam-Webster, Inc.</title>
        <style type="text/css">
/* Resets */
@import url(http://meyerweb.com/eric/tools/css/reset/reset.css);


/* Layout */
article {
    margin:0.5em;
    margin-bottom: 2em;
}
article section {
    margin: 0.5em 0em 0.5em 1.5em;
}
ol[epub\:type ~= senses] > li {
    margin: 0.375em 0em 0.375em 2.5em;
    text-indent: -1.5em;
}
[epub\:type ~= syn-group] p {
    margin: 0em 2.5em 0em 3em;
    text-indent: -2em;
}


/* Typography */
body {line-height:normal;}
sub, sup { font-size: .83em }
sub { vertical-align: sub }
sup { vertical-align: super }
i {font-style:italic}
b {font-weight:bold}
dfn {font-weight:bold;font-size:125%;}
[epub\:type ~= pos],[epub\:type ~= gram-info] {font-style:italic}
[epub\:type ~= etym] b {font-weight:normal}
article section [epub\:type ~= pos]:first-child:before {content:"▪ "}
[epub\:type ~= syn-group] p:before {content:"synonyms ";font-weight:bold;font-style:italic}
[epub\:type ~= syn-group] p > b {text-transform: uppercase;font-size: smaller;font-weight:normal}
article a {text-transform: uppercase;font-size: smaller;}
[epub\:type ~= ex]:before {content:"<";margin:0;padding:0}
[epub\:type ~= ex]:after {content:">";margin:0;padding:0}
[epub\:type ~= ex]{color:purple;margin:0;padding:0}
[epub\:type ~= ex] b[epub\:type ~= instance] {font-style:italic;font-weight:normal;}

/* List Numbering */
ol,li {list-style-type:none}
ol[epub\:type ~= senses] ol, ol[epub\:type ~= senses] ol li{display:inline}
li:before {font-weight:bold}
ol  { counter-reset: def }
ol[epub\:type ~= senses] > li:before { content: counter(def)" "; counter-increment: def;}
ol[epub\:type ~= senses] > li:only-of-type:before {content:""}
ol[epub\:type ~= senses] > li > ol > li:before { content: counter(def,lower-alpha)" "; counter-increment: def;}
ol[epub\:type ~= senses] > li > ol > li > ol > li:before { content: "("counter(def)") "; counter-increment: def;}
[epub\:type ~= def]:before {content:": "}
        </style>
    </head>

    <body epub:type="dictionary">

        <!--Contains the following entries:
            - color, homograph 1
            - colour (redirects to color)
            - kibosh
            - lie, homographs 1 to 4
            - light, homograph 1
        -->

        <article> 
            <dfn title="color"><sup>1</sup>col·or</dfn> <span epub:type="pron">\ˈkə-lər\</span>  
            <span epub:type="pos">n</span>,  
            <span epub:type="gram-info">often attrib</span> 
            <span epub:type="etym">[<b>ORIGIN</b>: ME <i>colour,</i> fr. AF, fr. L <i>color;</i> akin to L <i>celare</i> to conceal — more at <a href="#DUMMY">hell</a>]</span> 

            <section>(13c) 

                <ol epub:type="senses">
                    <li>
                        <ol>
                            <li>
                                <span epub:type="def">a phenomenon of light (as red, brown, pink, or gray) or visual perception that enables
                                    one to differentiate otherwise identical objects</span></li>
                            <li>
                                <ol>
                                    <li><span epub:type="def">the aspect of the appearance of objects and light sources that may be described in
                                            terms of hue, lightness, and saturation for objects and hue, brightness, and saturation
                                            for light sources <q epub:type="ex">the changing <b epub:type="instance">∼</b> of the sky</q></span>; <i>also</i> <span epub:type="def">a specific combination of hue, saturation, and lightness or brightness <q epub:type="ex">comes in six <b epub:type="instance">∼s</b></q></span></li>
                                    <li><span epub:type="def">a color other than and as contrasted with black, white, or gray</span></li>
                                </ol>
                            </li>
                        </ol>
                    </li>
                    <li>
                        <ol>
                            <li><span epub:type="def">an outward often deceptive show : <a href="#DUMMY">appearance</a> <q epub:type="ex">his story has the <b epub:type="instance">∼</b> of truth</q></span></li>
                            <li><span epub:type="def">a legal claim to or appearance of a right, authority, or office</span></li>
                            <li><span epub:type="def">a pretense offered as justification : <a href="#DUMMY">pretext</a> <q epub:type="ex">she could have drawn from the Versailles treaty the <b epub:type="instance">∼</b> of legality for any action she chose —Yale Rev.</q></span></li>
                            <li><span epub:type="def">an appearance of authenticity : <a href="#DUMMY">plausibility</a> <q epub:type="ex">lending <b epub:type="instance">∼</b> to this notion</q></span></li>
                        </ol>
                    </li>
                    <li><span epub:type="def">complexion tint:</span>
                        <ol>
                            <li><span epub:type="def">the tint characteristic of good health</span></li>
                            <li><span epub:type="def"><a href="#DUMMY">blush</a> </span></li>
                        </ol>
                    </li>
                    <li>
                        <ol>
                            <li><span epub:type="def">vividness or variety of effects of language</span></li>
                            <li><span epub:type="def"><a href="#DUMMY">local color</a></span></li>
                        </ol>
                    </li>
                    <li>
                        <ol>
                            <li><span epub:type="def">an identifying badge, pennant, or flag — usu. used in pl. <q epub:type="ex">a ship sailing under Swedish <b epub:type="instance">∼s</b></q></span></li>
                            <li><span epub:type="def">colored clothing distinguishing one as a member of a particular group or representative 
                                of a particular person or thing — usu. used in pl. <q epub:type="ex">a jockey wearing the <b epub:type="instance">∼s</b> of the stable</q></span></li>
                        </ol>

                    </li>
                    <li>
                        <ol>
                            <li><span epub:type="gram-info">pl</span> <span epub:type="def">position as to a question or course of action : <a href="#DUMMY">stand</a> <q epub:type="ex">the USSR changed neither its <b epub:type="instance">∼s</b> nor its stripes during all of this —Norman Mailer</q></span></li>
                            <li><span epub:type="def"><a href="#DUMMY">character</a>,  <a href="#DUMMY">nature</a> — usu. used in pl. <q epub:type="ex">showed himself in his true <b epub:type="instance">∼s</b></q></span></li>
                        </ol>
                    </li>
                    <li>
                         <ol>
                             <li><span epub:type="def">the use or combination of colors</span></li>
                             <li><span epub:type="def">two or more hues employed in a medium of presentation <q epub:type="ex">movies in <b epub:type="instance">∼</b></q></span></li>
                            </ol>
                    </li>
                    <li>
                         <span epub:type="gram-info">pl</span>
                         <ol>
                             <li><span epub:type="def">a naval or nautical salute to a flag being hoisted or lowered</span></li>
                             <li><span epub:type="def"><a href="#DUMMY">armed forces</a></span></li>
                         </ol>

                    </li>
                    <li>
                         <span epub:type="def"><a href="#DUMMY">vitality</a>,  <a href="#DUMMY">interest</a> <q epub:type="ex">the play had a good deal of <b epub:type="instance">∼</b> to it</q></span>

                    </li>
                    <li>
                         <span epub:type="def">something used to give color : <a href="#DUMMY">pigment</a></span>

                    </li>
                    <li>
                         <span epub:type="def">the quality of timbre in music <q epub:type="ex">the <b epub:type="instance">∼</b> and richness of the cello</q></span>

                    </li>
                    <li>
                         <span epub:type="def">skin pigmentation esp. other than white characteristic of race <q epub:type="ex">a person of <b epub:type="instance">∼</b></q></span>

                    </li>
                    <li>
                         <span epub:type="def">a b particle of gold in a gold miner's pan after washing</span>

                    </li>
                    <li>
                         <span epub:type="def">analysis of game action or strategy, statistics and background information on participants,
                            and often anecdotes provided by a sportscaster to give variety and interest to the
                            broadcast of a game or contest <q epub:type="ex">a <b epub:type="instance">∼</b> commentator</q></span>

                    </li>
                    <li>
                         <span epub:type="def">a hypothetical property of quarks that differentiates each type into three forms having
                            a distinct role in binding quarks together</span>

                    </li>
                </ol>
            </section>

        </article>

        <article>
            <dfn title="colour">col·our</dfn> 
            <span epub:type="pron">\ˈkə-lər\</span>
            <i>chiefly Brit var of</i> <a href="#DUMMY">color</a>

        </article>

        <article> 
            <dfn title="kibosh">ki·bosh</dfn> 
            <span epub:type="pron">\ˈkī-ˌbäsh, kī-ˈ; ki-ˈbäsh\</span>
            <span epub:type="pos">n</span>
            <span epub:type="etym">[<b>ORIGIN</b>: origin unknown]</span>

            <section>(1836) 

                <ol epub:type="senses">
                    <li>
                        <span epub:type="def">something that serves as a check or stop <q epub:type="ex">put the <b epub:type="instance">∼</b> on that</q></span>

                    </li>
                </ol>
            </section>

            <section>
                — <dfn>kibosh</dfn> 
                <span epub:type="pos">vt</span>

            </section>

        </article>

        <article> 
            <dfn title="lie"><sup>1</sup>lie</dfn> 
            <span epub:type="pron">\ˈlī\</span>
            <span epub:type="pos">vi</span>
            <b>lay</b> <span epub:type="pron">\ˈlā\</span>;
            <b>lain</b> <span epub:type="pron">\ˈlān\</span>;
            <b>ly·ing</b> <span epub:type="pron">\ˈlī-iŋ\</span>
            <span epub:type="etym">[<b>ORIGIN</b>: ME, fr. OE <i>licgan;</i> akin to OHG <i>ligen</i> to lie, L <i>lectus</i> bed, Gk <i>lechos</i>]</span>

            <section> (bef. 12c) 

                <ol epub:type="senses">
                    <li>
                        <ol>
                            <li><span epub:type="def">to be or to stay at rest in a horizontal position : be <a href="#DUMMY">prostrate</a> : <a href="#DUMMY">rest</a>,  <a href="#DUMMY">recline</a> <q epub:type="ex"><b epub:type="instance">∼</b> motionless</q> <q epub:type="ex"><b epub:type="instance">∼</b> asleep</q></span></li>
                            <li><span epub:type="def">to assume a horizontal position — often used with <i>down</i></span></li>
                            <li><i>archaic</i> <span epub:type="def">to reside temporarily : stay for the night : <a href="#DUMMY">lodge</a></span></li>
                            <li><span epub:type="def">to have sexual intercourse — used with <i>with</i></span></li>
                            <li><span epub:type="def">to remain inactive (as in concealment) <q epub:type="ex"><b epub:type="instance">∼</b> in wait</q></span></li>
                        </ol>
                    </li>
                    <li>
                         <span epub:type="def">to be in a helpless or defenseless state <q epub:type="ex"> the town lay at the mercy of the invaders </q></span>
                    </li>
                    <li>
                         <i>of an inanimate thing</i> <span epub:type="def">to be or remain in a flat or horizontal position upon a broad support <q epub:type="ex"> books lying on the table </q></span>

                    </li>
                    <li>
                         <span epub:type="def">to have direction : <a href="#DUMMY">extend</a> <q epub:type="ex"> the route lay to the west </q></span>
                    </li>
                    <li>
                        <ol>
                            <li><span epub:type="def">to occupy a certain relative place or position <q epub:type="ex">hills <b epub:type="instance">∼</b> behind us</q></span></li>  
                            <li><span epub:type="def">to have a place in relation to something else <q epub:type="ex">the real reason <b epub:type="instance">∼s</b> deeper</q></span></li>
                            <li><span epub:type="def">to have an effect through <a href="#DUMMY">mere</a> presence, weight, or relative position <q epub:type="ex"> remorse lay heavily on him </q></span></li>
                            <li><span epub:type="def">to be sustainable or admissible</span></li>
                        </ol>
                    </li>
                    <li>
                         <span epub:type="def">to remain at anchor or <a href="#DUMMY">becalmed</a></span>

                    </li>
                    <li>
                         <ol>
                             <li><span epub:type="def">to have place : <a href="#DUMMY">exist</a> <q epub:type="ex"> the choice lay between fighting or surrendering </q></span></li>
                             <li><span epub:type="def"><a href="#DUMMY">consist</a>,  <a href="#DUMMY">belong</a> <q epub:type="ex">the success of the book <b epub:type="instance">∼s</b> in its direct style</q> <q epub:type="ex"> responsibility lay with the adults </q></span></li>
                         </ol>
                    </li>
                    <li>
                        <span epub:type="def"><a href="#DUMMY">remain</a></span>; <i>esp</i> <span epub:type="def">to remain unused, unsought, or uncared for</span>
                    </li>
                </ol>
                <section>
                    <b><i>usage</i></b> see <a href="#DUMMY">lay</a>

                </section>
            </section> 

            <section>
                — <dfn title="lier">li·er</dfn> 
                <span epub:type="pron">\ˈlī(-ə)r\</span>
                <span epub:type="pos">n</span>

            </section> 

            <section epub:type="phrase-group">
                — <dfn epub:type="idiom">lie low</dfn>

                <section>
                    <ol epub:type="senses">
                        <li>
                             <span epub:type="def">to lie prostrate, defeated, or disgraced</span>

                        </li>
                        <li>
                             <span epub:type="def">to stay in hiding : strive to avoid notice</span>

                        </li>
                        <li>
                             <span epub:type="def">to <a href="#DUMMY">bide</a> one's time : remain secretly ready for action</span>

                        </li>
                    </ol>
                </section>

            </section>

        </article>

        <article>
            <dfn title="lie"><sup>2</sup>lie</dfn>
            <span epub:type="pron">\ˈlī\</span>
            <span epub:type="pos">n</span>
            <span epub:type="etym">[<b>ORIGIN</b>: — (see <a href="#DUMMY"><sup>1</sup>lie</a>)]</span>

            <section>(1697) 

                <ol epub:type="senses">
                    <li>
                         <i>chiefly Brit</i> <span epub:type="def"><a href="#DUMMY">lay 6</a></span>

                    </li>
                    <li>
                         <span epub:type="def">the position or situation in which something lies — (see <a href="#DUMMY"><sup>1</sup>lie</a>) <q epub:type="ex">a golf ball in a difficult <b epub:type="instance">∼</b></q></span>

                    </li>
                    <li>
                         <span epub:type="def">the <a href="#DUMMY">haunt</a> of an animal (as a fish) : <a href="#DUMMY">covert</a></span>

                    </li>
                    <li>
                         <i>Brit</i> <span epub:type="def">an act or instance of lying or resting</span>

                    </li>
                </ol>
            </section>

        </article>

        <article>
            <dfn title="lie"><sup>3</sup>lie</dfn>
            <span epub:type="pron">\ˈlī\</span>
            <span epub:type="pos">vb</span>
            <b>lied</b>; <b>ly·ing</b> <span epub:type="pron">\ˈlī-iŋ\</span>
            <span epub:type="etym">[<b>ORIGIN</b>: ME, fr. OE <i>lēogan;</i> akin to OHG <i>liogan</i> to lie, OCS <i>lŭgati</i>]</span> 

            <section>
                <span epub:type="pos">vi</span> (bef. 12c) 

                <ol epub:type="senses">
                    <li>
                         <span epub:type="def">to make an untrue statement with <a href="#DUMMY">intent</a> to deceive</span>

                    </li>
                    <li>
                         <span epub:type="def">to create a false or misleading impression</span>

                    </li>
                </ol>
            </section>

            <section>
                <span epub:type="pos">vt</span><ol epub:type="senses">
                    <li>
                        <span epub:type="def">to bring about by telling lies <q epub:type="ex"> lied his way out of trouble </q></span>

                    </li>
                </ol>
            </section>

            <section epub:type="syn-group">

                <p>
                     <b>Lie</b>, <b>prevaricate</b>, <b>equivocate</b>, <b>palter</b>, <b>fib</b> mean to tell an untruth. 
                    <b>lie</b> is the blunt term, imputing dishonesty <q epub:type="ex"><b epub:type="instance">lied</b> about where he had been</q>. 
                    <b>prevaricate</b> softens the bluntness of <b>LIE</b> by implying quibbling or confusing the issue <q epub:type="ex">during the hearings the witness did his best to <b epub:type="instance">prevaricate</b></q>.
                    <b>equivocate</b> implies using words having more than one sense so as to seem to say one thing but
                    intend another <q epub:type="ex"><b epub:type="instance">equivocated</b> endlessly in an attempt to mislead her inquisitors</q>.
                    <b>palter</b> implies making unreliable statements of fact or intention or insincere promises <q epub:type="ex">a swindler <b epub:type="instance">paltering</b> with his investors</q>.
                    <b>fib</b> applies to a telling of a trivial untruth <q epub:type="ex"><b epub:type="instance">fibbed</b> about the price of the new suit</q>.

                </p>
            </section>

        </article>

        <article>
            <dfn title="lie"><sup>4</sup>lie</dfn>
            <span epub:type="pron">\ˈlī\</span>
            <span epub:type="pos">n</span>
            <span epub:type="etym">[<b>ORIGIN</b>: ME <i>lige, lie,</i> fr. OE <i>lyge;</i> akin to OHG <i>lugī,</i> OE <i>lēogan</i> to lie]</span>

            <section>(bef. 12c) 

                <ol epub:type="senses">
                    <li>
                        <ol>
                            <li><span epub:type="def">an assertion of something known or believed by the speaker to be untrue with <a href="#DUMMY">intent</a> to deceive</span></li>
                            <li><span epub:type="def">an untrue or inaccurate statement that may or may not be believed true by the speaker</span></li>
                        </ol>
                    </li>
                    <li>
                         <span epub:type="def">something that <a href="#DUMMY">misleads</a> or deceives</span>

                    </li>
                    <li>
                         <span epub:type="def">a charge of lying — (see <a href="#DUMMY"><sup>3</sup>lie</a>)</span>
                    </li>
                </ol>
            </section>
        </article>

        <article>
            <dfn title="light"><sup>1</sup>light</dfn>
            <span epub:type="pron">\ˈlīt\</span>
            <span epub:type="pos">n</span>
            <span epub:type="etym">[<b>ORIGIN</b>: ME, fr. OE <i>lēoht;</i> akin to OHG <i>lioht</i> light, L <i>luc-, lux</i> light, <i>lucēre</i> to shine, Gk <i>leukos</i> white]</span>

            <section>(bef. 12c) 

                <ol epub:type="senses">
                    <li>
                        <ol>
                            <li><span epub:type="def">something that makes vision possible</span></li>
                            <li><span epub:type="def">the sensation aroused by stimulation of the visual receptors</span></li>
                            <li><span epub:type="def">electromagnetic radiation of any wavelength that travels in a vacuum with a speed
                                of about 186,281 miles (300,000 kilometers) per second</span>; <i>specif</i> <span epub:type="def">such radiation that is visible to the human eye</span></li>
                        </ol>
                    </li>
                    <li>
                        <ol>
                            <li><span epub:type="def"><a href="#DUMMY">daylight</a></span></li>  
                            <li><span epub:type="def"><a href="#DUMMY">dawn</a></span></li>
                        </ol>
                    </li>
                    <li>
                        <span epub:type="def">a source of light: as</span>
                        <ol>
                            <li><span epub:type="def">a celestial body</span></li>
                            <li><span epub:type="def"><a href="#DUMMY">candle</a></span></li>
                            <li><span epub:type="def">an electric light </span></li>
                        </ol>
                    </li>
                    <li>
                         <i>archaic</i> <span epub:type="def"><a href="#DUMMY">sight 4a</a></span>

                    </li>
                    <li>
                        <ol>
                            <li><span epub:type="def">spiritual illumination</span></li>
                            <li><span epub:type="def"><a href="#DUMMY">inner light</a></span></li>
                            <li><span epub:type="def"><a href="#DUMMY">enlightenment</a></span></li>
                            <li><span epub:type="def"><a href="#DUMMY">truth</a></span></li>
                        </ol>
                    </li>
                    <li>
                        <ol>
                            <li><span epub:type="def">public knowledge <q epub:type="ex">facts brought to <b epub:type="instance">∼</b></q></span></li>
                            <li><span epub:type="def">a particular aspect or appearance presented to view <q epub:type="ex">saw the matter in a different <b epub:type="instance">∼</b></q></span></li>
                        </ol>
                    </li>
                    <li>
                         <span epub:type="def">a particular illumination</span>
                    </li>
                    <li>
                         <span epub:type="def">something that enlightens or informs <q epub:type="ex">shed some <b epub:type="instance">∼</b> on the problem</q></span>
                    </li>
                    <li>
                         <span epub:type="def">a medium (as a window) through which light is admitted</span>
                    </li>
                    <li>
                         <span epub:type="gram-info">pl</span> <span epub:type="def">a set of principles, standards, or opinions <q epub:type="ex">worship according to one's <b epub:type="instance">∼s</b> —Adrienne Koch</q></span>
                    </li>
                    <li>
                         <span epub:type="def">a noteworthy person in a particular place or field <q epub:type="ex">a leading <b epub:type="instance">∼</b> among current writers</q></span>
                    </li>
                    <li>
                         <span epub:type="def">a particular expression of the eye</span>
                    </li>
                    <li>
                        <ol>
                            <li><span epub:type="def"><a href="#DUMMY">lighthouse</a>,  <a href="#DUMMY">beacon</a></span></li>
                            <li><span epub:type="def"><a href="#DUMMY">traffic light</a></span></li>
                        </ol>
                    </li>
                    <li>
                         <span epub:type="def">the representation of light in art</span>
                    </li>
                    <li>
                         <span epub:type="def">a flame for lighting something (as a cigarette)</span>
                    </li>
                </ol>
            </section> 

            <section epub:type="phrase-group">
                — <dfn epub:type="idiom">in the light of</dfn> 

                <section>
                    <ol epub:type="senses">
                        <li>
                             <span epub:type="def">from the point of view of</span>

                        </li>
                        <li>
                             <i>or</i> <dfn epub:type="idiom">in light of</dfn> <span epub:type="def">in view of <q epub:type="ex"><b epub:type="instance">in light of</b> their findings, new procedures were established</q></span>

                        </li>
                    </ol>
                </section>

            </section>

        </article>

    </body>

</html>

```

### Markup example, Karen ###

```
<?xml version="1.0" encoding="UTF-8"?>
<html xmlns:epub="http://www.idpf.org/2007/ops" xmlns:ssml="http://www.w3.org/2001/10/synthesis" xmlns="http://www.w3.org/1999/xhtml" profile="http://www.idpf.org/epub/30/profile/content/" 
lang="en-US" ssml:alphabet="ipa">
<head>
<title>Dictionary of English, Company X</title>
</head>

<body epub:type="MonolingualDictionary">

<dl>
<div epub:type="divTitle">C</div>
<article>
<p epub:type="entry" title="Color">  
      <dfn epub:type="preferredVar"><sup>1</sup>col·or</dfn> 
      <dfn epub:type="termVar" lang="en-GB"><sup>2</sup>col·our</dfn> 
      <dfn epub:type="phoneticVar" lang="en-fonipa" ssml:ph="ˈkələr">\ˈkə-lər\</dfn>
</p>
          <p>
          <span epub:type="partOfSpeech">noun</span>
          <span epub:type="GrammarNote">often attrib</span>
          <span epub:type="etymology">[ORIGIN: ME colour, fr. AF, fr. L color; akin to L <em>celare</em> to conceal] (13c)</span>
          </p>
          <p epub:type="shortDef">a phenomenon of light (as red, brown, pink, or gray) or visual perception that enables one to differentiate otherwise identical objects.</p>
          <p epub:type="longDef">
            <ol>
               <li>the aspect of the appearance of objects and light sources that may be described in terms of hue, lightness, and saturation for objects and hue, brightness, and saturation for light sources &lt;the changing ∼ of the sky&gt;; also: a specific combination of hue, saturation, and lightness or brightness, Ex. &lt;comes in six ∼&gt;</li>
                <li> a color other than and as contrasted with black, white, or gray</li>
            </ol>
          </p>
          <p epub:type="senseLabel">Appearance</p>
            <ol epub:type="senseList" order="1">
                <li>an outward often deceptive show.</li>
                <li>(Example) &lt;his story has the ∼ of truth&gt;</li>
                <li>a legal claim to or appearance of a right, authority, or office</li>
            </ol>
          </div>
 	  </dd>
</dl>
</article>
</body>
</html>
```

## Learner's English Monolingual Dictionary ##

TBC