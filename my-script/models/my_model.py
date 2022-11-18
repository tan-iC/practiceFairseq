
from fairseq.models.fairseq_model import FairseqModel

class MyModel(FairseqModel):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
