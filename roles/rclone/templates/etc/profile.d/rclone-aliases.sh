#!/bin/bash

alias gdrive-pull='rclone sync --interactive gdrive: ~/GDrive/'
alias gdrive-push='rclone sync --interactive ~/GDrive/ gdrive:'
alias gdrive-diff='rclone check gdrive: ~/GDrive/'
