# Define the target file path
TARGET_FILE="$HOME/.set_env_vars.sh"

eval $(op signin)
# Run the 'op' commands and capture their output
OPENAI_API_KEY=$(op item get "OPENAI_API_KEY" --vault "PERSONAL_ENV" --field "password" --reveal)
GITHUB_TOKEN=$(op item get "GITHUB_TOKEN" --vault "PERSONAL_ENV" --field "password" --reveal)

# Check if the 'op' command succeeded for both variables
if [[ -z "$OPENAI_API_KEY" || -z "$GITHUB_TOKEN" ]]; then
  echo "Error: Failed to retrieve one or both environment variables using 'op'."
  exit 1
fi

sudo rm "$TARGET_FILE"


# Write the output to the shell file
cat <<EOL > "$TARGET_FILE"
#!/bin/bash
export OPENAI_API_KEY="$OPENAI_API_KEY"
export GITHUB_TOKEN="$GITHUB_TOKEN"
EOL

# Make the file executable, but not readble and writeable by anyone
chmod 700 "$TARGET_FILE"

# Print success message
echo "Environment variables written to: $TARGET_FILE"


#gcloud auth login

#rm ~/.zshrc

stow .

echo '## Execute `source ~/.zshrc`.' | gum format

