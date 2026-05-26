TYPST=typst
ROOT_DIR:=$(abspath .)
FONT_PATH:=$(ROOT_DIR)/fonts
SRC=coca-cola.typ
OUT=coca-cola.pdf
PPTX_DIR=presentation
PPTX=$(PPTX_DIR)/coca-cola.pptx

.PHONY: all watch clean pptx

all: $(OUT)

$(OUT): $(SRC)
	$(TYPST) compile --font-path $(FONT_PATH) --ignore-system-fonts $< $@

watch:
	$(TYPST) watch --root $(ROOT_DIR) --font-path $(FONT_PATH) --ignore-system-fonts $(SRC) $(OUT)

pptx: $(PPTX)

$(PPTX): $(SRC)
	mkdir -p $(PPTX_DIR)
	poetry run typ2pptx $(SRC) -o $(PPTX) --root $(ROOT_DIR)

clean:
	rm -f $(OUT) $(PPTX)
