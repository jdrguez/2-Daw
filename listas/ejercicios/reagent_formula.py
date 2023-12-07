# ************
# ELLA QUÍMICA
# ************


def run(formula: list) -> bool:
    rule_1 = not (1 in formula and 2 in formula)
    rule_2 = not (3 in formula and 4 in formula)
    rule_3 = (5 in formula and 6 in formula) or (5 not in formula and 6 not in formula)
    rule_4 = 7 in formula or 8 in formula
    
    valid = rule_1 and rule_2 and rule_3 and rule_4

    return valid


if __name__ == '__main__':
    run([1, 3, 7])