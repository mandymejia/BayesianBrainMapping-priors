run_brainmap_for_subject <- function(prior_path, subject) {

  base_dir <- "/N/project/clubneuro/MSC/washu_preproc/surface_pipeline"
  output_dir <- "/N/u/ndasilv/Quartz/Documents/GitHub/BayesianBrainMapping-Templates/data_OSF/outputs"
  
  bm_dir <- file.path(output_dir, paste0("brainmaps_", subject))
  eng_dir <- file.path(output_dir, paste0("engagements_", subject))
  dir.create(bm_dir, recursive = TRUE, showWarnings = FALSE)
  dir.create(eng_dir, recursive = TRUE, showWarnings = FALSE)
  
   for (i in 1:10) {
    session <- sprintf("ses-func%02d", i)
    bold_file <- file.path(
      base_dir, subject,
      "processed_restingstate_timecourses", session, "cifti",
      paste0(subject, "_", session, "_task-rest_bold_32k_fsLR.dtseries.nii")
    )

    if (!file.exists(bold_file)) {
      cat("Missing file: ", bold_file)
      next
    }
    
    cat("Running BrainMap for", session, "\n")
    
    bMap <- BrainMap(
      BOLD = bold_file,
      prior = prior_path,
      TR = 2.2,
      drop_first = 15
    )

    saveRDS(bMap, file.path(bm_dir, paste0(subject, "_", session, "_bMap.rds")))

    eng <- engagements(bMap = bMap)

    saveRDS(eng, file.path(eng_dir, paste0(subject, "_", session, "_engagements.rds")))
  }
  
  cat("Finished subject", subject, "with prior", basename(prior_path), "\n")
}
