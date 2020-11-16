Plugin project :firebase_core_web not found. Please update settings.gradle.
To solve this error:
In your android/app/build.gradle, update the following:

android {
    // ...
    defaultConfig {
        // ...
        minSdkVersion 16
    }
}
into:

android {
    // ...
    defaultConfig {
        // ...
        minSdkVersion 23
    }
}
Note:

You need to use minSdkVersion 23 when using firebase in flutter.

From the docs:

By default, Flutter supports Android SDK v16 (Jelly Bean, released 2012), but multidex doesn't really work with Jelly Bean (though, it's possible). Configuring Jelly Bean to work is beyond the scope of this codelab, so we'll change the minimum target SDK version from v16 to v21 (Lollipop, released 2014).

To change the minimum target SDK version:

Open android/app/build.gradle, then find the line that says minSdkVersion 16.
Change that line to minSdkVersion 21.
Save the file.