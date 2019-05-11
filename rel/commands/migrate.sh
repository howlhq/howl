#!/bin/sh

release_ctl eval --mfa "Howl.ReleaseTasks.migrate/1" --argv -- "$@"
