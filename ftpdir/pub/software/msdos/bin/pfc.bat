	@if exist objfile del objfile
	@if "%2"=="" goto one
	@if "%1"=="-uf" goto unfair
	@echo pfc:  %1 not available
	@goto end
:unfair
	@if exist %2 goto comp2
	@echo pfc:  file %2 does not exist
	@goto end
:comp2
	@pfccomp %2 listfile objfile
	@if not exist objfile goto end
	@ufpint objfile pmdfile
	@goto end
:one
	@if exist %1 goto comp1
	@echo pfc:  file %1 does not exist
	@goto end
:comp1
	@pfccomp %1 listfile objfile
	@if not exist objfile goto end
	@pint objfile pmdfile
:end
