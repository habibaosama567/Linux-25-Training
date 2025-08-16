FLAG{D4T4_GH0ST_C4UGHT}
Stage 1:
    cd data_stream
    find . -type f -empty > ../stage1_answer.txt
    cd ..
Stage 2:
    mkdir tools
    tar -xvzf backups/system_tools.tar.gz -C tools
Stage 3:
    cd tools
    bash diagnostics.sh 2> ../stage3_answer.txt
    cd ..
Stage 4:
    cd asset_links
    find . -xtype l > ../stage4_answer.txt
    cd ..
Stage 5:
    bash system/system_check.sh | tee flag.txt
