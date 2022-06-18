Q := @

WC := wc.erl

CALC_TOKENIZER := calc_tokenizer.erl
CALC_PARSER := calc_parser.erl

default: shell

$(WC): wc.xrl
	$(Q) mkdir -p ebin
	$(Q) erlc -o $@ +'{verbose,true}' +'{report,true}' $<
	$(Q) erlc -o ebin $(WC)

calc: $(CALC_PARSER) $(CALC_TOKENIZER)

$(CALC_TOKENIZER): calc_tokenizer.xrl
	$(Q) mkdir -p ebin
	$(Q) erlc -o $@ +'{verbose,true}' +'{report,true}' $<
	$(Q) erlc -o ebin $(CALC_TOKENIZER)

$(CALC_PARSER): calc_parser.yrl
	$(Q) mkdir -p ebin
	$(Q) erlc -o $@ +'{verbose,true}' +'{report,true}' $<
	$(Q) erlc -o ebin $(CALC_PARSER)

shell: $(WC) $(CALC_TOKENIZER) $(CALC_PARSER)
	$(Q) erl -pa ebin

clean:
	$(Q) rm -fr ebin $(WC) $(CALC_PARSER) $(CALC_TOKENIZER)
