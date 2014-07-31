NBPickerModal
=============

A picker inside a mini modal window

Demo
====

The demo/ folder contains a demo project showing NBPickerModal in use. Open and run it.

Usage
=====

In your view controller .h file, import "UIViewController+MiniModal.h" and conform to NBMiniModalDelegate.

In your view controller .m file, imported "NBPickerModal.h". Alloc and init a NBPickerModal, then on your view controller call [self displayMiniModal:modal]. Implement the following method to handle when a value is picked:

-(void)completedMiniModal:(NBMiniModal *)modal

You can cast that NBMiniModal to a NBPickerModal, and retrieve the value from it.

Compatibility
=============

This class has been tested back to iOS 6.0.

Implementation
==============

This class is implemented by adding a UIPickerView into a NBMiniModal.

License
=======

This code is released under the MIT License. See the LICENSE file for details.
