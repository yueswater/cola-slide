TYPST=typst
FONT_PATH=fonts
SRC=coca-cola.typ
OUT=coca-cola.pdf

.PHONY: all watch clean

all: $(OUT)

$(OUT): $(SRC)
	$(TYPST) compile --font-path $(FONT_PATH) --ignore-system-fonts $< $@

watch:
	$(TYPST) watch --font-path $(FONT_PATH) --ignore-system-fonts $(SRC) $(OUT)

clean:
	rm -f $(OUT)
