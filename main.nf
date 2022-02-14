nextflow.enable.dsl=2

include {folder_to_pseudo_mzxml} from './nfmodule_diaumpire/diaumpire_workflows.nf'

workflow {
    main:
    log.info("==================================================")
    log.info("Executing $params.workflow_type DIAUmpire workflow")
    log.info("")
    log.info("Parameters:")
    log.info(" DIA folder:\t $params.dia_folder")
    log.info(" DIA folder:\t $params.diau_se_params")
    log.info("==================================================")
}

if(params.help) {
    log.info ""
    log.info "DIA-Umpire workflow"
    log.info "--------------------"
    log.info ""
    log.info "Generates pseudo-DDA mzXML files from DIA MS runs via DIA-Umpire."
    log.info ""
    log.info "Options:"
    log.info "  --help:           show this message and exit"
    log.info "  --dia_folder:     folder with DIA mzXML files to be parsed (default: $params.dia_folder)"
    log.info "  --diau_se_params: DIA-Umpire_SE parameter file (default: $params.diau_se_params)"
    log.info ""
    log.info "Results will be stored in Results/DIAUmpire"
    log.info ""
    exit 1

    folder_to_pseudo_mzxml(params.dia_folder,
			   params.diau_se_params)
}
