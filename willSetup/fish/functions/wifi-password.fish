function wifi-password --description 'Print the saved password for the current or named Wi-Fi network'
  if not command -sq security
    echo "wifi-password: security is not available on this system" >&2
    return 1
  end

  set -l ssid

  if test (count $argv) -gt 0
    set ssid (string join ' ' -- $argv)
  else
    if command -sq networksetup
      set -l device (networksetup -listallhardwareports 2>/dev/null | awk '/Hardware Port: (Wi-Fi|AirPort)/ {getline; print $2; exit}')

      if test -n "$device"
        set -l current_network (networksetup -getairportnetwork "$device" 2>/dev/null)
        set -l parsed_ssid (string replace -r '^Current (Wi-Fi|AirPort) Network: ' '' -- "$current_network")

        if test -n "$parsed_ssid" -a "$parsed_ssid" != "$current_network"
          set ssid "$parsed_ssid"
        end
      end
    end

    if test -z "$ssid"
      set -l saved_ssids (security dump-keychain 2>/dev/null | awk '
        /"acct"<blob>=/ {
          line = $0
          sub(/^.*"acct"<blob>=/, "", line)
          gsub(/^"|"$/, "", line)
          if (line != "") print line
        }
      ' | sort -u)

      if test (count $saved_ssids) -eq 0
        echo "wifi-password: could not determine the active Wi-Fi network and found no saved Wi-Fi entries" >&2
        return 1
      end

      echo "Select a Wi-Fi network:"
      for i in (seq (count $saved_ssids))
        printf '%2d. %s\n' $i $saved_ssids[$i]
      end

      read -P 'SSID number: ' selection

      if not string match -rq '^[0-9]+$' -- "$selection"
        echo "wifi-password: invalid selection" >&2
        return 1
      end

      if test "$selection" -lt 1 -o "$selection" -gt (count $saved_ssids)
        echo "wifi-password: selection out of range" >&2
        return 1
      end

      set ssid $saved_ssids[$selection]
    end
  end

  set -l password

  set password (security find-generic-password -D "AirPort network password" -w -a "$ssid" 2>/dev/null)
  if test $status -eq 0 -a -n "$password"
    printf '%s\n' "$password"
    return 0
  end

  set password (security find-generic-password -D "AirPort network password" -w -s "$ssid" 2>/dev/null)
  if test $status -eq 0 -a -n "$password"
    printf '%s\n' "$password"
    return 0
  end

  set password (security find-generic-password -w -a "$ssid" 2>/dev/null)
  if test $status -eq 0 -a -n "$password"
    printf '%s\n' "$password"
    return 0
  end

  set password (security find-generic-password -w -s "$ssid" 2>/dev/null)
  if test $status -eq 0 -a -n "$password"
    printf '%s\n' "$password"
    return 0
  end

  echo "wifi-password: no saved Keychain password found for SSID: $ssid" >&2
  return 1
end
