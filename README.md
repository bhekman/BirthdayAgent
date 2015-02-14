# BirthdayAgent

***

OVERVIEW:  
A command-line tool for creating an OS X user agent to wish people a happy birthday.

***

DETAILS:  
This repository contains a script, setupHappyBirthday.sh, that autogenerates necessary files for wishing happy birthdays. The other files in this repository are examples of those necessary files.

The files work by creating and loading an [OS X launch user agent](http://launchd.info/). This user agent runs in the background continuously. On each hour of the specified birthday, the user agent triggers the generated happybirthday.sh script. This script increases the computer's volume to max and uses the built-in [say command](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/say.1.html) to wish a slightly personalized happy birthday.

**Note**: I obviously don't support using this script on other peoples' computers *without permission*.

***

USAGE (Mac-only):  

To Set-up:

- In terminal:
> ```
> curl https://raw.githubusercontent.com/bhekman/BirthdayAgent/master/setupHappyBirthday.sh > setupHappyBirthday.sh
  chmod +x setupHappyBirthday.sh
  ./setupHappyBirthday.sh
> ```

- Answer the prompts from the script
- ...
- Profit

To Get Rid Of:

- In terminal (TODO: this lies):  
```launchctl unload "com.bhekman.happybirthday"```

***

