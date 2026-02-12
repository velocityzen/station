function loadsecrets -d "Add secrets from .github.secrets file to GitHub repository"
    set -l secrets_file ".github.secrets"

    # Check for .github.secrets file
    if not test -e "$PWD/$secrets_file"
        echo "No $secrets_file file found in current directory"
        return 1
    end

    # Check if gh CLI is installed
    if not command -q gh
        echo "gh CLI is not installed"
        return 1
    end

    # Check if we're in a git repo
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Not a git repository"
        return 1
    end

    set -l count 0

    for line in (cat "$PWD/$secrets_file" | grep -v -e '^#' -e '^[[:space:]]*$')
        set -l item (string split -m 1 '=' $line)
        set -l key $item[1]
        set -l value $item[2]

        if set -q argv[1]; and test "$key" != "$argv[1]"
            continue
        end

        if test -n "$key" -a -n "$value"
            echo -n "Setting $key... "

            # If value is a .p12 file path, base64 encode the file
            if string match -q "*.p12" "$value"
                if test -e "$value"
                    set value (base64 -i "$value")
                else
                    echo "failed (file not found: $value)"
                    continue
                end
            end

            if echo -n "$value" | gh secret set "$key" 2>/dev/null
                echo "done"
                set count (math $count + 1)
            else
                echo "failed"
            end
        end
    end

    echo "Set $count secret(s)"
end
