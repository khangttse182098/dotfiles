#!/bin/bash

CURRENT_ENGINE=$(ibus engine)

if [ "$CURRENT_ENGINE" = "Unikey" ]; then
    ibus engine xkb:us::eng
else
    ibus engine Unikey
fi
