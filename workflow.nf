dir = projectDir

process load {
    output:
    path "results.txt"

    script:
    template "load.sh"
}

process parseRow {
    input:
    val row

    output:
    tuple val(id), val(current_value)

    exec:
    (id, current_value) = row.tokenize(",")*.trim()
}

process transform {
    input:
    tuple val(id), val(current_value)

    output:
    tuple val(id), val(new_value)

    exec:
    new_value = (current_value as Integer) + 100
}

process store {
    input:
    tuple val(id), val(new_value)

    output:
    stdout

    """
    $dir/templates/store.sh $id $new_value
    """
}

workflow {
    load | splitText | parseRow | transform | store | view
}
