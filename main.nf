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


    folder_to_pseudo_mzxml(params.dia_folder,
			   params.diau_se_params)
}
