function loadenv
    set -l envFiles .envrc .env.local .env

    for file in $envFiles
        if test -e "$PWD/$file"
            echo "Loading from $file"

            for line in (cat "$PWD/$file" | grep -v -e '^#' -e '^[[:space:]]*$')
                set item (string split -m 1 '=' $line)

                if set -q argv[1]; and test "$item[1]" != "$argv[1]"
                    continue
                end

                set -gx $item[1] $item[2]
                echo "+ $item[1]"
            end

            return 0
        end
    end

    echo "no env file found"
    return 1
end
