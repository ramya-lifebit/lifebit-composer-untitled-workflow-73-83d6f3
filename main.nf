nextflow.enable.dsl=2

include { download_reads_1 } from './modules/download_reads_1/module.nf'

workflow {
input1 = Channel.fromPath(params.download_reads_1.accessions).splitCsv(sep: ';').map { row -> tuple(evaluate(row[0]), evaluate(row[1])) }
download_reads_1(input1)
}
