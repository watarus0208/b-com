#!/bin/sh

files="/home/wataru/code/b-com/b-com/crawling/*"

# search birds directory 
for bird_dir_path in $files; do
  if [ -d $bird_dir_path ] ; then
    echo "鳥名ファイル: {$bird_dir_path}"
    # search bird barks directory
    bark_type_dirs="${bird_dir_path}/*" 

    for bark_type_dir in $bark_type_dirs; do
      if [ -d $bark_type_dir ] ; then
        echo "鳴き声ファイル: {$bark_type_dir}"
        wma_file_dir="${bark_type_dir}/*"
        for wma_file in $wma_file_dir; do
          # transform wma to wav
          echo "wmaファイル名: {$wma_file}"
          echo "拡張子: ${wma_file##*.}"
          if [ ${wma_file##*.} = "wma" ] ; then
            echo "変換後ファイル名: ${wma_file%.*}.wav"
            if [ -e ${wma_file%.*}.wav ] ; then
              echo "already file exists."
            else
              ffmpeg -i $wma_file "${wma_file%.*}.wav"
            fi
          fi
        done
      # no bird barks directory
      elif [ -f $bark_type_dir ] ; then
        # transform wma to wav
        echo "wmaファイル名: ${bark_type_dir}"
        echo "拡張子: ${bark_type_dir##*.}"
        echo "変換後ファイル名: ${bark_type_dir%.*}.wav"
          if [ -e ${bark_type_dir%%.*}.wav ] ; then
            echo "already file exists."
          else
            ffmpeg -i $bark_type_dir "${bark_type_dir%.*}.wav"
          fi
      fi
    done
  fi
done
