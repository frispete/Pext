#!/bin/sh -x

# lupdate-qt5 does not support Python and pylupdate5 does not support QML
pylupdate5 pext/__main__.py -ts pext/i18n/pext.py.ts
lupdate-qt5 pext/qml/* -ts pext/i18n/pext.qml.ts

# Sed fixes for pylupdate5's broken behaviour (fixed lately)
sed -i 's#<location filename="__main__.py"#<location filename="../__main__.py"#g' pext/i18n/pext.py.ts

# Merge both together in a new dummy file
lconvert -i pext/i18n/pext.py.ts pext/i18n/pext.qml.ts -o pext/i18n/pext.ts

# Remove tmp files
rm -f pext/i18n/pext.py.ts pext/i18n/pext.qml.ts
