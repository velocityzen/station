function copyskill -d "Copy Claude skills/commands from a source folder to .claude in the current project"
    if test (count $argv) -lt 2
        echo "Usage: copyskill <source-folder> <*|name...>"
        return 1
    end

    set -l source_dir $argv[1]

    if not test -d "$source_dir"
        echo "Source directory not found: $source_dir"
        return 1
    end

    set -l skills_src "$source_dir/skills"
    set -l commands_src "$source_dir/commands"

    if not test -d "$skills_src"; and not test -d "$commands_src"
        echo "No skills/ or commands/ found in: $source_dir"
        return 1
    end

    set -l copied 0
    set -l skipped 0

    for pattern in $argv[2..-1]
        set -l found 0

        # Try skills first, then commands
        for type in skills commands
            if test $found -eq 1
                break
            end

            set -l src "$source_dir/$type"
            if not test -d "$src"
                continue
            end

            for dir in $src/*/
                set -l name (basename "$dir")
                if string match -q -- "$pattern" "$name"
                    set found 1
                    set -l target_dir "$PWD/.claude/$type"
                    mkdir -p "$target_dir"

                    if test -d "$target_dir/$name"
                        echo "Already exists, skipping $type: $name"
                        set skipped (math $skipped + 1)
                    else
                        cp -R "$dir" "$target_dir/$name"
                        echo "Copied $type: $name"
                        set copied (math $copied + 1)
                    end
                end
            end
        end

        if test $found -eq 0
            echo "Not found: $pattern"
            set skipped (math $skipped + 1)
        end
    end

    echo "Copied $copied, skipped $skipped"
end
