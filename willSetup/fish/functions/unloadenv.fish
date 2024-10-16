function unloadenv
    set -l envFiles .envrc .env.local .env

    for file in $envFiles
        if test -e "$PWD/$file"
            echo "Unloading of $file"

            for line in (cat "$PWD/$file" | grep -v -e '^#' -e '^[[:space:]]*$')
                set item (string split -m 1 '=' $line)
                set -ge $item[1]
                echo "- $item[1]"
            end

            return 0
        end
    end

    echo "no env file found"
    return 1
end
