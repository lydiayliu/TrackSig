## LOAD
simulated_data <- FALSE
cancer_type_signatures <- TRUE
compute_bootstrap <- FALSE

source("src/header.R")

## DATA
exposures <- compute_overall_exposures_for_all_examples()

write.table(exposures, '/output/sample_overall_exposures.txt', sep='\t', quote=F, row.names=T, col.names=T)

# 5% threshold
exposures[exposures < 0.05] <- 0
exposures[exposures >= 0.05] <- 1

# sanity
print(rowSums(exposures))
print(colSums(exposures))

# format
exposures <- cbind(tumor_type = 'HNSC', ID = rownames(exposures), exposures)

write.table(exposures, '/output/sample_active_signatures.txt', sep='\t', quote=F, row.names=F, col.names=T)
