#!/usr/bin/fish

# a quick script that starts up dmenu, takes inline latex input, renders it out to a JPEG image and copies it to the clipboard

set -g temp_dir '/tmp/quicklatex/'
set -g template '
\documentclass[margin=5pt,varwidth]{standalone}
\usepackage{mathtools}

\begin{document}

\begin{math}
REPLACE_ME
\end{math}

\end{document}
'
# grab user input from wofi
set -g latex_input (string join \n $_quicklatex_expression_store | wofi -dG)

# save user input to array for future display
set -Ua _quicklatex_expression_store $latex_input

# latex template ready to be consumed by pdflatex
set -g template_ready (string replace 'REPLACE_ME' $latex_input $template)

# create temp dir and output latex into a .tex file (pdflatex is braindead and cannot utilize stdin/stdout)
mkdir -p /tmp/quicklatex/
echo -n $template_ready > "$temp_dir/quicklatex.tex"

# generate a PDF with pdflatex
pdflatex -output-directory $temp_dir -shell-escape "$temp_dir/quicklatex.tex" &>/dev/null

# convert said PDF to jpeg image and copy it to clipboard
pdftoppm -png -r 600 "$temp_dir/quicklatex.pdf" | tee "$temp_dir/img.png" | wl-copy --type 'image/png'

# send notification with the preview as the icon
notify-send -i "$temp_dir/img.png" Formula 'Image successfully copied to clipboard'

# remove the temporary directory, including any residual files in it
rm -r $temp_dir
