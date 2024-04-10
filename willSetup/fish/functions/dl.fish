function dl -d "Download video from url with max available quality"
  yt-dlp -f bestvideo+bestaudio --merge-output-format mkv $argv
end
