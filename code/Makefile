Q := @

WC := wc.erl

CALC_TOKENIZER := calc_tokenizer.erl
CALC_PARSER := calc_parser.erl

JSON_TOKENIZER := json_tokenizer.erl
JSON_PARSER := json_parser.erl

UNI_TOKENIZER := uni_tokenizer.erl
UNI_PARSER := uni_parser.erl

default: shell

$(WC): wc.xrl
	$(Q) mkdir -p ebin
	$(Q) erlc -o $@ +'{verbose,true}' +'{report,true}' $<
	$(Q) erlc -o ebin $(WC)

calc: $(CALC_PARSER) $(CALC_TOKENIZER)

json: $(JSON_PARSER) $(JSON_TOKENIZER)

uni: $(UNI_TOKENIZER) $(UNI_PARSER)


$(UNI_TOKENIZER): uni_tokenizer.xrl
	$(Q) rm $@
	$(Q) erlc -o $@ +'{verbose,true}' +'{report,true}' $<

$(UNI_PARSER): uni_parser.yrl
	$(Q) rm $@
	$(Q) erlc -o $@ +'{verbose,true}' +'{report,true}' $<

unid:
	$(Q) rm -fr ebin/uni_*.beam
	$(Q) mkdir -p ebin
	$(Q) erlc +debug_info -o ebin $(UNI_TOKENIZER)
	$(Q) erlc +debug_info -o ebin $(UNI_PARSER)
	$(Q) erl -pa ebin

$(CALC_TOKENIZER): calc_tokenizer.xrl
	$(Q) mkdir -p ebin
	$(Q) erlc -o $@ +'{verbose,true}' +'{report,true}' $<
	$(Q) erlc -o ebin $(CALC_TOKENIZER)

$(CALC_PARSER): calc_parser.yrl
	$(Q) mkdir -p ebin
	$(Q) erlc -o $@ +'{verbose,true}' +'{report,true}' $<
	$(Q) erlc -o ebin $(CALC_PARSER)

$(JSON_TOKENIZER): json_tokenizer.xrl
	$(Q) mkdir -p ebin
	$(Q) erlc -o $@ +'{verbose,true}' +'{report,true}' $<
	$(Q) erlc -o ebin $(JSON_TOKENIZER)

$(JSON_PARSER): json_parser.yrl
	$(Q) mkdir -p ebin
	$(Q) erlc -o $@ +'{verbose,true}' +'{report,true}' $<
	$(Q) erlc -o ebin $(JSON_PARSER)


shell: $(WC) $(CALC_TOKENIZER) $(CALC_PARSER) $(JSON_TOKENIZER) $(JSON_PARSER)
	$(Q) erl -pa ebin

clean:
	$(Q) rm -fr ebin $(WC) $(CALC_PARSER) $(CALC_TOKENIZER) $(JSON_TOKENIZER) $(JSON_PARSER)
