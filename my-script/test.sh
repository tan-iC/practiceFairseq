###
### test
###

./clean.sh

# 前処理
fairseq-preprocess \
        --user-dir my-script \
        --source-lang ja --target-lang en \
        --task my_translation \
        --trainpref data/dummy/train \
        --validpref data/dummy/dev \
        --testpref data/dummy/test \
        --destdir data/dummy/binarized \
        --bpe=sentencepiece \
        --workers 8

# train
fairseq-train \
        --user-dir my-script \
        data/dummy/binarized \
        --source-lang ja --target-lang en \
        --alpha 0.5 \
        --task my_translation \
        --arch transformer --share-decoder-input-output-embed --activation-fn relu \
        --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 1.0 \
        --lr 7e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 --warmup-init-lr 1e-7 \
        --weight-decay 0.0001 --dropout 0.0 \
        --criterion cross_entropy \
        --batch-size 10 --patience 10 \
        --save-dir data/checkpoints/dummy \
        --max-epoch 1 --keep-best-checkpoints 2 \
        --bpe=sentencepiece \
        --cpu
