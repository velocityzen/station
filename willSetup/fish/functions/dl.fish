function dl -d "Download video from url with max available quality"
  youtube-dl -f bestvideo+bestaudio --merge-output-format mkv
end
