from fairseq.criterions.fairseq_criterion import FairseqCriterion

class MyCriterion(FairseqCriterion):
    def __init__(self, task):
        super().__init__(task)