# Makefile za kreiranje direktorijuma i fajlova za dodatne konfiguracije

# Definišemo glavne direktorijume
BASE_DIR = dodatne_konfiguracije
SUBDIRS = SRAM DRAM EEPROM cache_memorija

# Definišemo fajlove za svaki direktorijum
FILES = uvod.md konfiguracija.md primeri_upotrebe.md

# Podciljevi za svaki direktorijum
.PHONY: all clean

# Podrazumevani cilj za kreiranje strukture
all: $(SUBDIRS)

# Pravilo za kreiranje direktorijuma i fajlova
$(SUBDIRS):
	@mkdir -p $(BASE_DIR)/$@
	@touch $(addprefix $(BASE_DIR)/$@/, $(FILES))
	@echo "Kreiran direktorijum i fajlovi za $@"

# Specifična pravila za imenovane fajlove u svakom direktorijumu
$(BASE_DIR)/SRAM/konfiguracija.md:
	@mv $@ $(BASE_DIR)/SRAM/konfiguracija_sram.md

$(BASE_DIR)/DRAM/konfiguracija.md:
	@mv $@ $(BASE_DIR)/DRAM/konfiguracija_dram.md

$(BASE_DIR)/EEPROM/konfiguracija.md:
	@mv $@ $(BASE_DIR)/EEPROM/konfiguracija_eeprom.md

$(BASE_DIR)/cache_memorija/konfiguracija.md:
	@mv $@ $(BASE_DIR)/cache_memorija/konfiguracija_cache.md

# Komanda za čišćenje svih direktorijuma i fajlova
clean:
	@rm -rf $(BASE_DIR)
	@echo "Struktura direktorijuma i fajlova je uklonjena!"

