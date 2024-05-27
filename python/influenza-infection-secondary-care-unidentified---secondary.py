# Chukwuma Iwundu, Clare MacRae, Eleftheria Vasileiou, 2024.

import sys, csv, re

codes = [{"code":"1E30&XN5SG","system":"icd11"},{"code":"1 E30","system":"icd11"},{"code":"1 E31","system":"icd11"},{"code":"1 E32","system":"icd11"},{"code":"488.1","system":"icd11"},{"code":"488.0","system":"icd11"},{"code":"J11.8","system":"icd11"},{"code":"J10.8","system":"icd11"},{"code":"J11.1","system":"icd11"},{"code":"J10","system":"icd11"},{"code":"J10.1","system":"icd11"},{"code":"J10.0","system":"icd11"},{"code":"J11.0","system":"icd11"},{"code":"J09","system":"icd11"},{"code":"J11","system":"icd11"},{"code":"1 E30","system":"icd11"},{"code":"1 E31","system":"icd11"},{"code":"1 E32","system":"icd11"},{"code":"1E30&XN5SG","system":"icd11"},{"code":"488.1","system":"icd11"},{"code":"488.0","system":"icd11"},{"code":"J10.0","system":"icd11"},{"code":"J10.1","system":"icd11"},{"code":"J10","system":"icd11"},{"code":"J11.0","system":"icd11"},{"code":"J09","system":"icd11"},{"code":"J11","system":"icd11"},{"code":"J11.8","system":"icd11"},{"code":"J11.1","system":"icd11"},{"code":"J10.8","system":"icd11"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('influenza-infection-secondary-care-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["influenza-infection-secondary-care-unidentified---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["influenza-infection-secondary-care-unidentified---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["influenza-infection-secondary-care-unidentified---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
