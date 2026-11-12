function release -d "Tag, push and create a GitHub release from release.md"
    # release v1.2.3
    if test (count $argv) -ne 1
        echo "Usage: release <tag>" >&2
        return 1
    end

    set -l tag $argv[1]
    git tag -a $tag -m $tag
    and git push origin $tag
    and gh release create $tag --title $tag --notes-file release.md --verify-tag
end
