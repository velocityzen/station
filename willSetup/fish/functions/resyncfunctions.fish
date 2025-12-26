function resyncfunctions -d "Sync fish functions from station repo to ~/.config/fish/functions"
    set -l source_dir "$HOME/Github/station/willSetup/fish/functions"
    set -l target_dir "$HOME/.config/fish/functions"

    if not test -d "$source_dir"
        echo "Source directory not found: $source_dir"
        return 1
    end

    set -l removed 0
    set -l added 0

    # Remove symlinks that point to non-existent files in source
    for link in $target_dir/*.fish
        if test -L "$link"
            set -l target (readlink "$link")
            if string match -q "$source_dir/*" "$target"
                if not test -e "$target"
                    echo "Removing $link (target no longer exists)"
                    rm "$link"
                    set removed (math $removed + 1)
                end
            end
        end
    end

    # Add symlinks for new files
    for file in $source_dir/*.fish
        set -l filename (basename "$file")
        set -l link "$target_dir/$filename"

        if not test -e "$link"
            echo "Adding $filename"
            ln -s "$file" "$link"
            set added (math $added + 1)
        end
    end

    echo "Removed $removed, added $added"
end
