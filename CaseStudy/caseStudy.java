package CaseStudy;

import java.util.Scanner;

abstract class BankAccount
{
	long acNo;
	String holderName;
	String accountType;
	double balance;
	static double interestRate;
	
	static
	{
		interestRate=3.5;
	}

	 BankAccount(long acNo, String holderName, String accountType, double balance)
	 {
		
		this.acNo = acNo;
		this.holderName = holderName;
		this.accountType = accountType;
		this.balance = balance;
	}
	
	 void calculateInterestRate() {

	}

	BankAccount()
	 {
		 this.acNo=00;
		 this.holderName="not given";
		 this.accountType="not given";
		 this.balance=0.0;
	 }

	long getAcNo()
	{
		return acNo;
	}

	void setAcNo(long acNo) 
	{
		this.acNo = acNo;
	}

	String getHolderName()
	{
		return holderName;
	}

	void setHolderName(String holderName)
	{
		this.holderName = holderName;
	}

	String getAccountType()
	{
		return accountType;
	}

	void setAccountType(String accountType)
	{
		this.accountType = accountType;
	}

	double getBalance() {
		return balance;
	}

	void setBalance(double balance)
	{
		this.balance = balance;
	}

	static double getIntrestRate()
	{
		return interestRate;
	}

	static void setIntrestRate(double intrestRate) 
	{
		BankAccount.interestRate = intrestRate;
	}
	
	void deposit(double amount)
	{
		this.balance=this.balance+amount;
		System.out.println("Amount Deposit:"+amount);
	}
	
	void withdrawal(double amount)
	{
		if(this.balance < amount)
		{
			System.out.println("MINIMUM BALANCE");
		}
		else
		{
			this.balance=this.balance-amount;
			System.out.println("Withdrawal SucessFull");
		}
	}
	 
	void checkBalance()
	{
		System.out.println("Bank Balance:"+this.balance);
	}
	 
	abstract void calculateIntrestRate();
	
	void display()
	{
		System.out.println("Account Number:"+acNo);
		System.out.println("Holder Name:"+holderName);
		System.out.println("Account Type:"+accountType);
		System.out.println("Bank Balance:"+balance);
	}
}///class BankAccount ends here
 
class SavingAccount extends BankAccount {
    static final double MINIMUM_BALANCE = 10000;

    SavingAccount(long acNo, String holderName, double balance) {
        super(acNo, holderName, "Saving", balance);
    }

    @Override
    void withdrawal(double amount) {
        if (balance - amount < MINIMUM_BALANCE) {
            System.out.println("Withdrawal denied: minimum balance must be maintained.");
        } else {
            balance -= amount;
            System.out.println("Withdrawal Successful: " + amount);
        }
    }

    @Override
    void calculateInterestRate() {
        if (balance > MINIMUM_BALANCE) {
            double interest = balance * interestRate / 100;
            balance += interest;
            System.out.println("Interest added. New Balance: " + balance);
        } else {
            System.out.println("No interest: balance below minimum.");
        }
    }

    @Override
    void display() {
        System.out.println("\n--- Saving Account ---");
        super.display();
    }

	@Override
	void calculateIntrestRate() {
		// TODO Auto-generated method stub
		
	}
}///class SavingAccount ends here
  
  class SalaryAccount extends BankAccount {
	    String lastTransactionDate;

	    SalaryAccount(long acNo, String holderName, double balance, String lastTransactionDate) {
	        super(acNo, holderName, "Salary", balance);
	        this.lastTransactionDate = lastTransactionDate;
	    }

	    @Override
	    void calculateInterestRate() {
	        System.out.println("No interest for Salary Account.");
	    }

	    @Override
	    void display() {
	        System.out.println("\n--- Salary Account ---");
	        super.display();
	        System.out.println("Last Transaction Date: " + lastTransactionDate);
	    }

		@Override
		void calculateIntrestRate() {
			// TODO Auto-generated method stub
			
		}
	}///class SalaryAccount ends here

  class CurrentAccount extends BankAccount {
	    double overdraftLimit;

	    CurrentAccount(long acNo, String holderName, double balance, double overdraftLimit) {
	        super(acNo, holderName, "Current", balance);
	        this.overdraftLimit = overdraftLimit;
	    }

	    @Override
	    void withdrawal(double amount) {
	        if (balance - amount < -overdraftLimit) {
	            System.out.println("Exceeds overdraft limit. Withdrawal denied.");
	        } else {
	            balance -= amount;
	            System.out.println("Withdrawal Successful: " + amount);
	        }
	    }

	    @Override
	    void calculateInterestRate() {
	        System.out.println("No interest for Current Account.");
	    }

	    @Override
	    void display() {
	        System.out.println("\n--- Current Account ---");
	        super.display();
	        System.out.println("Overdraft Limit: " + overdraftLimit);
	    }

		@Override
		void calculateIntrestRate() {
			// TODO Auto-generated method stub
			
		}
	}///class CurrentAccount ends here
  
  class LoanAccount extends BankAccount {
	    double loanAmount;
	    double repaidAmount;

	    LoanAccount(long acNo, String holderName, double balance, double loanAmount, double repaidAmount) {
	        super(acNo, holderName, "Loan", balance);
	        this.loanAmount = loanAmount;
	        this.repaidAmount = repaidAmount;
	    }

	    @Override
	    void deposit(double amount) {
	        if (amount > 0) {
	            repaidAmount += amount;
	            System.out.println("Repayment done: " + amount);
	            if (repaidAmount >= loanAmount) {
	                System.out.println("Loan fully repaid!");
	            }
	        }
	    }

	    @Override
	    void withdrawal(double amount) {
	        System.out.println("Withdrawal not allowed from Loan Account.");
	    }

	    @Override
	    void calculateInterestRate() {
	        if (loanAmount > repaidAmount) {
	            double remaining = loanAmount - repaidAmount;
	            double interest = remaining * interestRate / 100;
	            System.out.println("Interest due on remaining loan: " + interest);
	        } else {
	            System.out.println("No interest: loan cleared.");
	        }
	    }

	    @Override
	    void display() {
	        System.out.println("\n--- Loan Account ---");
	        super.display();
	        System.out.println("Loan Amount: " + loanAmount);
	        System.out.println("Repaid Amount: " + repaidAmount);
	    }

		@Override
		void calculateIntrestRate() {
			// TODO Auto-generated method stub
			
		}
	} 
public class caseStudy
{

	public static void main(String[] args) {
	
	    Scanner sc = new Scanner(System.in);
        int choice;

        do {
            System.out.println("\n--- Bank Account Menu ---");
            System.out.println("1. Saving Account");
            System.out.println("2. Salary Account");
            System.out.println("3. Current Account");
            System.out.println("4. Loan Account");
            System.out.println("5. Exit");
            System.out.print("Enter your choice: ");
            choice = sc.nextInt();

            switch (choice) {
                case 1:
                    SavingAccount s1 = new SavingAccount(1001, "Ritik", 12000);
                    s1.deposit(2000);
                    s1.withdrawal(1500);
                    s1.calculateInterestRate();
                    s1.display();
                    break;

                case 2:
                    SalaryAccount s2 = new SalaryAccount(2001, "Rahul", 20000, "20-12-2021");
                    s2.deposit(1000);
                    s2.withdrawal(5000);
                    s2.calculateInterestRate();
                    s2.display();
                    break;

                case 3:
                    CurrentAccount c1 = new CurrentAccount(3001, "Ram", 28000, 10000);
                    c1.deposit(5000);
                    c1.withdrawal(35000);
                    c1.calculateInterestRate();
                    c1.display();
                    break;

                case 4:
                    LoanAccount l1 = new LoanAccount(4001, "Rittu", 0, 30000, 5000);
                    l1.deposit(10000);
                    l1.calculateInterestRate();
                    l1.display();
                    break;

                case 5:
                    System.out.println("Thank you for using our Bank System!");
                    break;

                default:
                    System.out.println("Invalid choice! Try again.");
            }

        } while (choice != 5);

        sc.close();
    }
}
