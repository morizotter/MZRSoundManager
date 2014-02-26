MZRSoundManager
==============

This is a simple sound manager for iOS Application. Simultaneous play supported. This uses [Octave Sounds](http://raisedbeaches.com/octave/).

Installation
-------------

**Cocoapods**

`pod '/path/to/MZRSoundManager', '~> 0.0.1'`

*This library is not listed in Cocoapods spec.*

**Manually**

Just copy **Classes** directory and contents of *Resources* directory to your project.

Usage
------

**Play sound**

`[[MZRSoundManager sharedInstance] playSoundWithSoundName:soundName ofType:nil];`

**Stop all sounds**

`[[MZRSoundManager sharedInstance] stopAllSounds];`

Requirement
-----------

- ARC
- iOS7 and later

LISENSE
-------

**MZRSoundManager**

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

**Octave-Sounds**

You are free to use Octave (the "sound set") or any part thereof (the "sounds") in any personal, open-source or commercial work without obligation of payment (monetary or otherwise) or attribution. Do not sell the icon set, host the icon set or rent the icon set (either in existing or modified form).

While attribution is optional, it is always appreciated.

Intellectual property rights are not transferred with the download of the sounds.

EXCEPT TO THE EXTENT REQUIRED BY APPLICABLE LAW, IN NO EVENT WILL FRED SHOWELL BE LIABLE TO YOU ON ANY LEGAL THEORY FOR ANY SPECIAL, INCIDENTAL, CONSEQUENTIAL, PUNITIVE, EXEMPLARY OR TEARJERKING DAMAGES ARISING OUT OF THE USE OF THE SOUNDS, EVEN IF LICENSOR HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

Author
-------

Morita Naoki / [Twitter](http://twitter.com/morizotter) / [Facebook](http://facebook.com/morizotter) / [HP](http://moritanaoki.org)