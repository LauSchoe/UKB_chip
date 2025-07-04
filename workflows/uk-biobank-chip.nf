ref_pan_ch = Channel.fromPath(params.ref_pan)
snp_positions_ch = Channel.fromPath(params.files)

include {UKB_SNP_POSITIONS} from '../modules/local/ukb-snp-pos'
include {UKB_CHIP} from '../modules/local/ukb-chip-generation'


workflow CHIP_GENERATION {

    UKB_SNP_POSITIONS(snp_positions_ch)
    UKB_CHIP(ref_pan_ch, UKB_SNP_POSITIONS.out.output_chip_snp_pos)
}