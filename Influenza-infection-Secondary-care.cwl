cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  influenza-infection-secondary-care-bronchitis---secondary:
    run: influenza-infection-secondary-care-bronchitis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  influenza-infection-secondary-care-unidentified---secondary:
    run: influenza-infection-secondary-care-unidentified---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: influenza-infection-secondary-care-bronchitis---secondary/output
  influenza-infection-secondary-care-haemophilus---secondary:
    run: influenza-infection-secondary-care-haemophilus---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: influenza-infection-secondary-care-unidentified---secondary/output
  influenza-infection-secondary-care-pneumonia---secondary:
    run: influenza-infection-secondary-care-pneumonia---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: influenza-infection-secondary-care-haemophilus---secondary/output
  against-influenza-infection-secondary-care---secondary:
    run: against-influenza-infection-secondary-care---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: influenza-infection-secondary-care-pneumonia---secondary/output
  influenza-infection-secondary-care-unspecified---secondary:
    run: influenza-infection-secondary-care-unspecified---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: against-influenza-infection-secondary-care---secondary/output
  influenza-infection-secondary-care-sepsis---secondary:
    run: influenza-infection-secondary-care-sepsis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: influenza-infection-secondary-care-unspecified---secondary/output
  influenza-infection-secondary-care-respiratory---secondary:
    run: influenza-infection-secondary-care-respiratory---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: influenza-infection-secondary-care-sepsis---secondary/output
  influenza---secondary:
    run: influenza---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: influenza-infection-secondary-care-respiratory---secondary/output
  influenza-infection-secondary-care-manifestation---secondary:
    run: influenza-infection-secondary-care-manifestation---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: influenza---secondary/output
  influenza-infection-secondary-care-novel---secondary:
    run: influenza-infection-secondary-care-novel---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: influenza-infection-secondary-care-manifestation---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: influenza-infection-secondary-care-novel---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
