#!/bin/bash

# Define session name
SESSION_NAME="Dev"

# Check if the session already exists
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    # Check if the session is already attached
    if tmux list-clients | grep -q $SESSION_NAME; then
        echo "Session $SESSION_NAME is already attached."
    else
        echo "Session $SESSION_NAME exists but is not attached. Attaching..."
        tmux attach-session -t $SESSION_NAME
    fi
else
    echo "Session $SESSION_NAME does not exist. Creating a new session..."

    if [ -d "$HOME/Projects/Claro/app-ios" ]; then
	tmux new-session -d -s $SESSION_NAME -n CF -c ~/Projects/Claro/app-ios
    elif [ -d "$HOME/Projects/detranApp" ]; then
	tmux new-session -d -s $SESSION_NAME -n Detran-SP -c ~/Projects/detranApp
    else
	tmux new-session -d -s $SESSION_NAME -c ~/
    fi	

    # Create the third window without a name (defaults to directory name)
    tmux new-window -t $SESSION_NAME -c ~/

    tmux select-window -t $SESSION_NAME:1

    # Attach to the session
    tmux attach-session -t $SESSION_NAME
fi
