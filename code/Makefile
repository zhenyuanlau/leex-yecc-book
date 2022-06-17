Q := @

WC := wc.erl

default: shell

$(WC): wc.xrl
	$(Q) mkdir -p ebin
	$(Q) erlc -o $@ +'{verbose,true}' +'{report,true}' $<
	$(Q) erlc -o ebin $(WC)

shell: $(WC)
	erl -pa ebin

clean:
	$(Q) rm -fr ebin $(WC)
