## LOAD
simulated_data <- FALSE
source("src/header.R")
source("src/compute_overall_exposures.R")

## DATA
exposures <- compute_overall_exposures_for_all_examples()

# 5% threshold
exposures[exposures < 0.05] <- 0
exposures[exposures >= 0.05] <- 1

# format
exposures <- cbind(tumor_type = 'HNSC', ID = rownames(exposures), exposures)

write.table(exposures, '/output/sample_active_signatures.txt', sep='\t', quote=F, row.names=F, col.names=T)
