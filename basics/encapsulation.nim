type BankAccount* = object
    balance: float

proc newAccount*(initial: float): BankAccount =
    result.balance = initial

proc deposit*(acc: var BankAccount, amount: float) =
    acc.balance += amount

proc withdraw*(acc: var BankAccount, amount: float): bool =
    if amount <= acc.balance:
        acc.balance -= amount
        result = true