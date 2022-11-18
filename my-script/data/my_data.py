from fairseq.data.fairseq_dataset import FairseqDataset

class MyDataset(FairseqDataset):
    def __init__(self) -> None:
        super().__init__()
