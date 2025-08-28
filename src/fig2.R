prior_file <- "/Users/nohelia/Documents/GitHub/BayesianBrainMapping-Templates/priors/PROFUMO/prior_combined_PROFUMO_noGSR.rds"
prior <- readRDS(prior_file)

out_dir <- "~/Desktop"

# prior$template_parc_table <- subset(prior$template_parc_table, prior$template_parc_table$Key > 0)

files_written <- plot(
    prior,
    what = "maps",
    stat  = "sd",
    idx   = 8,
    title = "",cex.title = 1e-6,
    legend_embed = FALSE,                                 
    fname = file.path(out_dir, "Yeo17_comp2_mean"),      
    legend_fname = file.path(out_dir, "Yeo17_comp2_legend.png")
)

# map_png    <- files_written$surface[1]  
# legend_png <- files_written$surface[2] 


map_png    <- files_written[1]  
legend_png <- files_written[2] 

ciftiTools::view_comp(
    img    = map_png,title=NULL,
    legend = legend_png,
    legend_height = 0.5,
    fname  = file.path(out_dir, "Figure2", "PROFUMO_8_sd.png")
) 

# PARCELLATION 

GICA <- read_cifti(file.path(dir_data, "inputs", sprintf("GICA%d.dscalar.nii", 15)))

files_written <- plot(
        GICA,
        idx   = 2,
        title = "",cex.title = 1e-6,
        legend_embed = FALSE,                                 
        fname = file.path(out_dir, "GICA50"),      
        legend_fname = file.path(out_dir, "GICA25_legend.png")
)

map_png    <- files_written$surface[1]  
legend_png <- files_written$surface[2] 


# map_png    <- files_written[1]  
# legend_png <- files_written[2] 

ciftiTools::view_comp(
    img    = map_png,title=NULL,
    legend = legend_png,
    legend_height = 0.5,
    fname  = file.path(out_dir, "Figure2", "GICA15_IC2.png")
) 


profumo_mw <- readRDS(file.path(dir_data, "outputs", "PROFUMO_simplified_mwall.rds"))



files_written <- plot(
        profumo_mw,
        idx   = 8,
        title = "",cex.title = 1e-6,
        legend_embed = FALSE,                                 
        fname = file.path(out_dir, "PROFUMO"),      
        legend_fname = file.path(out_dir, "PROFUMO_legend.png")
)

    # map_png    <- files_written$surface[1]  
    # legend_png <- files_written$surface[2] 


map_png    <- files_written[1]  
legend_png <- files_written[2] 

ciftiTools::view_comp(
    img    = map_png,title=NULL,
    legend = legend_png,
    legend_height = 0.5,
    fname  = file.path(out_dir, "Figure2", "PROFUMO_8.png")
) 













