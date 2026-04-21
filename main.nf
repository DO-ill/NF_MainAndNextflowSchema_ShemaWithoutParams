nextflow.enable.dsl = 2

// Define parameters (defaults) in the script
params.outdir   = params.outdir   ?: 'results'
params.repeat   = params.repeat   ?: 3
params.greeting = params.greeting ?: 'Hello'
params.name     = params.name     ?: 'World'

process SAY_HELLO {
  publishDir "${params.outdir}", mode: 'copy'

  output:
    path "message.txt"

  script:
  """
  for i in \$(seq 1 ${params.repeat}); do
    echo "${params.greeting}, ${params.name}! (\$i/${params.repeat})"
  done > message.txt
  """
}

workflow {
  SAY_HELLO()
}
