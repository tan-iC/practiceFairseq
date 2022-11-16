# Practice Fairseq Extension

## Extension

### CLI

1. Add `__init__.py` in each directory
1. Add your model, task, and criterion, then register them to Fairseq.
1. Add `--user-dir {$dir_your_script}` in your command.

### args

1. args -> [add_args()](https://speakerdeck.com/tktkbohshi/fairseqchu-xin-zhe-xiang-ketiyutoriaru?slide=41)

1. cfg -> `cfg.{$arg_name}`

    ```python
    type(cfg) = dict
    ```

    If you add a new arg(=`additional_arg_name`), following factors are required.

    type, default value, metadata description and so on.

    ```python
    @dataclass
    class YourNewConfig(FairseqDataclass):
        additional_arg_name: type = field(
            default=None, metadata={"help": "You write help here"}
        )
    ```

    For example, you add `alpha`, float type, default value is 0.1...

    ```python
    @dataclass
    class MyTranslationConfig(FairseqDataclass):
        """
        Conventional args here...
        """

        # Additional arg
        alpha: float = field(
            default=0.1, metadata={"help": "Additional hyper-parameter Alpha"}
        )
    ```

## Reference

1. <https://fairseq.readthedocs.io/en/v0.7.0/command_line_tools.html>
1. <https://speakerdeck.com/tktkbohshi/fairseqchu-xin-zhe-xiang-ketiyutoriaru>
