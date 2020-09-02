# Introduction #

This wiki page covers an implementation proposal for the "Rich Media" part of the revision of the ePUB standard. It addressess the "Rich Media, Ads and Interactivity" requirements listed in http://code.google.com/p/epub-revision/wiki/RichMediaAndInteractivity. Specifically, it targets the requirement RM-2 which concerns about "the need for rich media and interactivity support" listed in the charter of this working group. In order for the content provider to generate ePUB v3.0 with embedded rich media and for the reader system vendor to support rich media, it is necessary to at least enumerate a list of recommended audio and video formats. Without this basic information, it is next to impossible to perform any interoperable test for any rich media enabled ePUB v3.0 compliant content on the compliant reader system.

# Contributor(s) #
  * King-Wai Chow

# Corresponding requirement #
  * RM-1
  * RM-2
  * RM-3

# Proposal #
## Audio ##
If the ePUB v3.0 reading system supports audio, it MUST support MPEG-1 Layer 3 (mp3). As such, mp3 will be one of the core media types.
  * It is up to the content provider and the reader system to decide the range of supported parameters such as bit rate, sampling frequency etc.
  * MIME media type: audio/mpeg
  * Reference: [IETF/RFC3003](http://tools.ietf.org/html/rfc3003) and [ISO/IEC 11172-3:1993](http://www.iso.org/iso/iso_catalogue/catalogue_t/catalogue_detail.htm?csnumber=22412)(MPEG-1 audio)
  * Description: Used for compressed audio
  * Here is an HTML5-like fragment sample for audio

```
<audio id="MyAudioExample">
   <source src="idpf.mp3" type="audio/mp3" />
</audio>
```

## Video ##
If the ePUB v3.0 reading system supports video, it MUST support compressed video coded in H.264/MPEG-4 AVC baseline profile format (h264). As such, h264 will be one of the core media types.
  * The raw H.264 bitstream MUST NOT be present in the ePUB v3.0 package by itself. It MUST be embedded inside the MPEG-4 file. The file format is is defined by ISO/IEC 14496 Part 12 and Part 15
  * If only the video stream is present in the multimedia file, the MIME media type will be: video/mp4; codecs=avc1.42E01E
  * The codecs parameter must adhere to [IETF/RFC 4281](http://tools.ietf.org/html/rfc4281)(The Codecs Parameter for "Bucket" Media Types)
  * Reference:
    * [ITU H.264](http://www.itu.int/rec/T-REC-H.264-201003-I/en)
    * [ISO 14496-10:2009](http://www.iso.org/iso/iso_catalogue/catalogue_ics/catalogue_detail_ics.htm?csnumber=52974): MPEG-4 Advanced Video Coding
  * Description: Used for compressed video

## Container ##
If the ePUB v3.0 reading system supports video, it MUST support the MPEG-4 file format. The MPEG-4 file format is defined by ISO/IEC 14496 Part 12 and Part 15. The MPEG-4 file format supports multiplexing of audio track(s), video track and/or auxiliary data track (e.g. closed caption and/or subtitle) with embedded timing information for synchronized presentation. In addition, if one or multiple audio tracks are present in the multimedia file, the audio MUST be coded in MPEG-4 Advanced Audio Coding - Low Complexity (AAC-LC) format.
  * If the MPEG-4 multimedia file consists of some video and audio streams, the MIME media type will be: type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'
    * Reference of MPEG-4 file format:
      * [IETF/RFC4337](http://www.rfc-editor.org/rfc/rfc4337.txt): MIME Type Registration for MPEG-4
      * [ISO/IEC 14496-12:2008](http://www.iso.org/iso/iso_catalogue/catalogue_ics/catalogue_detail_ics.htm?csnumber=51533): ISO base media file format
      * [ISO/IEC 14496-15:2010](http://www.iso.org/iso/catalogue_detail.htm?csnumber=55980): Advanced Video Coding (AVC) file format
    * Reference of MPEG-4 Audio: [ISO/IEC 14496-3:2009](http://www.iso.org/iso/iso_catalogue/catalogue_ics/catalogue_detail_ics.htm?csnumber=53943)
    * Here is an HTML5-like fragment sample for video
```
<video id="MyVideoExample" width="320" height="240">
   <source src="idpf.mp4" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"' />
</video>
```
  * Description: Used as a container for multiplexed video and/or audio

As an ePUB v3.0 reading system which supports video MUST support some audio streams coded in MPEG-4 AAC-LC audio format embedded inside the MPEG-4 file, it MUST also support raw audio file by itself coded in MPEG-4 AAC-LC audio format.