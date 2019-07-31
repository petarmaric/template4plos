LATEX_MAINFILE = paper.tex

BUILD_DIR = build
EXPORT_DIR = export


# Please don't touch the following settings
PDF_FILENAME := $(LATEX_MAINFILE:.tex=.pdf)
MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
FILES_DIR := $(shell realpath --relative-to $(MAKEFILE_DIR) $(CURDIR)/$(BUILD_DIR))


.PHONY: help
help: ## Display this help message
	@echo "Usage: make \033[36m[TARGET]\033[0m...\n\nTargets:"
	@awk -F ':|##' '/^[^\t].+?:.*?##/ { \
		printf "  \033[36m%-16s\033[0m %s\n", $$1, $$NF \
	}' $(MAKEFILE_LIST)


.PHONY: .FORCE_MAKE build
build: .FORCE_MAKE ## Build the paper
	latexmk -pdf -interaction=nonstopmode -aux-directory=$(BUILD_DIR) -output-directory=$(BUILD_DIR) $(LATEX_MAINFILE)
	@echo "Build finished, files have been saved to the '$(FILES_DIR)' directory"


.PHONY: export
export: clean-exported build ## Prepare the paper for journal submission
	latex2plos --build-dir $(BUILD_DIR) --export-dir $(EXPORT_DIR) --quiet $(LATEX_MAINFILE)
	make -C $(EXPORT_DIR) -f ../Makefile build
	@echo "Export finished, files have been saved to the '$(EXPORT_DIR)' directory"


.PHONY: clean-built
clean-built: ## Remove the papers build directory
	rm -rf $(BUILD_DIR)

.PHONY: clean-exported
clean-exported: ## Remove the papers export directory
	rm -rf $(EXPORT_DIR)

.PHONY: clean
clean: clean-built clean-exported ## Remove both the build and export directories


.PHONY: view-built
view-built: build ## View the papers built PDF file (runs 'build' if needed)
	xdg-open $(BUILD_DIR)/$(PDF_FILENAME)

.PHONY: view-exported
view-exported: export ## View the papers exported PDF file (runs 'export' if needed)
	xdg-open $(EXPORT_DIR)/$(BUILD_DIR)/$(PDF_FILENAME)

.PHONY: view
view: view-exported view-built ## View both the built and exported PDF files
