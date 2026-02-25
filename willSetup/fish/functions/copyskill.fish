function copyskill -d "Copy Claude skills from a source folder to .claude/skills in the current project"
    if test (count $argv) -lt 2
        echo "Usage: copyskill <source-skills-folder> <*|skill-name...>"
        return 1
    end

    set -l source_dir $argv[1]
    set -l target_dir "$PWD/.claude/skills"

    if not test -d "$source_dir"
        echo "Source directory not found: $source_dir"
        return 1
    end

    mkdir -p "$target_dir"

    set -l skills
    if test "$argv[2]" = "*"
        for dir in $source_dir/*/
            set -a skills (basename "$dir")
        end
    else
        set skills $argv[2..-1]
    end

    if test (count $skills) -eq 0
        echo "No skills found"
        return 1
    end

    set -l copied 0
    set -l skipped 0

    for skill in $skills
        set -l src "$source_dir/$skill"

        if not test -d "$src"
            echo "Skill not found: $skill"
            set skipped (math $skipped + 1)
            continue
        end

        if test -d "$target_dir/$skill"
            echo "Already exists, skipping: $skill"
            set skipped (math $skipped + 1)
            continue
        end

        cp -R "$src" "$target_dir/$skill"
        echo "Copied: $skill"
        set copied (math $copied + 1)
    end

    echo "Copied $copied, skipped $skipped"
end
