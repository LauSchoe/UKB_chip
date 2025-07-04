process UKB_SNP_POSITIONS {
    input:
    path bim_file
    output:
    path "*.txt", emit: output_chip_snp_pos
    """
    #!/usr/bin/env python
    import pandas as pd
    bim=pd.read_table("${bim_file}", index_col=False, header=None)
    bim=bim.replace(26, "MT")
    bim1=bim.iloc[0: , [0, 3]]
    bim1.to_csv("${bim_file.baseName}_snp_pos.txt", sep='\\t', index=False, header=None)
    """
}