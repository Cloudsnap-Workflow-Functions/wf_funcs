# Pass in the file directly from the Get Extract API

do |file:nil|
	require 'zip'

	# Unzip file and create array of files
	list_of_files = []
	Zip::File.open_buffer(StringIO.new(Base64.decode64(file))) do |zip_file|
	    zip_file.each do |f|
		list_of_files << {"file_name":f.name,"file":Base64.encode64(f.get_input_stream.read)}
	   	end
	end

	# Loop through array of files and grab the Expense file and convert to CSV to array of objects
    array = ""
	list_of_files.each do |a|
		if a[:file_name].to_s.include?("extract_CES_SAE_v3")
            headers = "Constant|Batch ID|Batch Date|Sequence Number|Employee ID|Employee Last Name|Employee First Name|Middle Initial|Employee Group ID Custom 21|Employee Org Unit 1|Employee Org Unit 2|Employee Org Unit 3|Employee Org Unit 4|Employee Org Unit 5|Employee Org Unit 6|ACH Bank Account Number|ACH Bank Routing Number|Journal Net of Total Adjusted Reclaim Tax|Report ID|Report Key|Ledger|Reimbursement Currency Alpha ISE|Home Country|Report Submit Date|Report User Defined Date|Report Payment Processing Date|Report Name|Report Image Required|Report has VAT entry|Report has TA entry|Report Total Post Amount|Report Total Approved Amount|Report Policy Name|Report Entry Budget Accrual Date|Report Org Unit 1|Report Org Unit 2|Report Org Unit 3|Report Org Unit 4|Report Org Unit 5|Report Org Unit 6|Report Custom 1|Report Custom 2|Report Custom 3|Report Custom 4|Report Custom 5|Report Custom 6|Report Custom 7|Report Custom 8|Report Custom 9|Report Custom 10|Report Custom 11|Report Custom 12|Report Custom 13|Report Custom 14|Report Custom 15|Report Custom 16|Report Custom 17|Report Custom 18|Report Custom 19|Report Custom 20|Report Entry Id|Report Entry Transaction Type|Report Entry Expense Type Name|Report Entry Transaction Date|Report Entry Currency Alpha Code|Report Entry Exchange Rate|Report Entry Exchange Rate Direction|Report Entry Is Personal Flag|Report Entry Description|Report Entry Vendor Name|Report Entry Vendor Description|Report Entry Receipt Received Flag|Report Entry Receipt Type|Total Employee Attendee|Total Spouse Attendee|Total Business Attendee|Report Entry Org Unit 1|Report Entry Org Unit 2|Report Entry Org Unit 3|Report Entry Org Unit 4|Report Entry Org Unit 5|Report Entry Org Unit 6|Report Entry Custom 1|Report Entry Custom 2|Report Entry Custom 3|Report Entry Custom 4|Report Entry Custom 5|Report Entry Custom 6|Report Entry Custom 7|Report Entry Custom 8|Report Entry Custom 9|Report Entry Custom 10|Report Entry Custom 11|Report Entry Custom 12|Report Entry Custom 13|Report Entry Custom 14|Report Entry Custom 15|Report Entry Custom 16|Report Entry Custom 17|Report Entry Custom 18|Report Entry Custom 19|Report Entry Custom 20|Report Entry Custom 21|Report Entry Custom 22|Report Entry Custom 23|Report Entry Custom 24|Report Entry Custom 25|Report Entry Custom 26|Report Entry Custom 27|Report Entry Custom 28|Report Entry Custom 29|Report Entry Custom 30|Report Entry Custom 31|Report Entry Custom 32|Report Entry Custom 33|Report Entry Custom 34|Report Entry Custom 35|Report Entry Custom 36|Report Entry Custom 37|Report Entry Custom 38|Report Entry Custom 39|Report Entry Custom 40|Report Entry Transaction Amount|Report Entry Posted Amount|Report Entry Approved Amount|Payment Type Code|Payment Code|Report Payment Reimbursement Type|Bill Date|Billed Credit Card Account Number|Billed Credit Card Description|Credit Card Transaction JR Key|Credit Card Transaction Reference Number|Credit Card Transaction CCT Key|Credit Card Transaction CCT Type|Credit Card Transaction ID|Credit Card Transaction Amount|Credit Card Transaction Tax Amount|Credit Card Transaction Currency Alpha Code|Credit Card Transaction Posted Amount|Credit Card Transaction Posted Currency Alpha Code|Credit Card Transaction Date|Credit Card Transaction Posted Date|Credit Card Transaction Description|Credit Card Transaction Master Card Code|Credit Card Transaction Merchant Name|Credit Card Transaction Merchant City|Credit Card Transaction Merchant State|Credit Card Transaction Merchant Country Code|Credit Card Transaction Merchant Reference Number|Credit Card Transaction Billing Type|Exchange Rate From Billing To Employee Currency|Billing Amount|Individual Credit Card Account Number|Individual Credit Card Name On Card|Merchant Doing Business As|Acquirer Reference Number|Report Entry Location Country Code|Report Entry Location Country Sub Code|Report Entry Foreign or Domestic Flag|Market Code|Processor Reference Number|Journal Payer Payment Type Name|Journal Payer Payment Code Name|Journal Payee Payment Type Name|Journal Payee Payment Code Name|Journal Account Code|Journal Debit or Credit|Journal Amount|Journal Key|Car Business Distance|Car Personal Distance|Car Passenger Count|Vehicle ID| Credit Card Transaction Sales|Credit Card Vendor Name|Cash Advance Request Amount|Cash Advance Request Currency Alpha Code|Cash Advance Request Currency Numeric Code|Cash Advance Exchange Rate|Cash Advance Currency Alpha Code|Cash Advance Currency Numeric Code|Cash Advance Issued Date|Cash Advance Payment Code Name|Cash Advance Transaction Type|Cash Advance Request Date|Cash Advance Key|Cash Advance Payment Method|Allocation Key|Allocation Percentage|Allocation Custom 1|Allocation Custom 2|Allocation Custom 3|Allocation Custom 4|Allocation Custom 5|Allocation Custom 6|Allocation Custom 7|Allocation Custom 8|Allocation Custom 9|Allocation Custom 10|Allocation Custom 11|Allocation Custom 12|Allocation Custom 13|Allocation Custom 14|Allocation Custom 15|Allocation Custom 16|Allocation Custom 17|Allocation Custom 18|Allocation Custom 19|Allocation Custom 20|Journal Net of Total Adjusted Tax|TA Reimb. Meal Lodging or Combined Type|TA Display Limit|TA Allowance Limit|Allowable Threshold|TA Fixed Meal Lodging Type|Base Amount|Allowance Amount|TA Fixed Overnight|TA Fixed Breakfast Provided Flag|TA Fixed Lunch Provided Flag|TA Fixed Dinner Provided Flag|Total Tax Adjusted Posted Amount|Total Reclaim Adjusted Amount|Tax Authority Name|Tax Authority Label|Report Entry Tax Transaction Amount|Report Entry Tax Posted Amount|Tax Source|Report Entry Tax Reclaim Transaction Amount|Report Entry Tax Reclaim Posted Amount|Report Entry Tax Code|Report Entry Tax Reclaim Domestic Flag|Report Entry Tax Adjusted Amount|Report Entry Tax Reclaim Adjusted Amount|Report Entry Tax Reclaim Code|Report Entry Tax Reclaim Trans Adjusted Amount|Report Entry Tax Allocation Reclaim Code|Travel Request ID|Travel Request Name|Travel Request Total Posted Amount|Travel Request Total Approved Amount|Travel Request Start Date|Travel Request End Date|Travel Request Authorized Date|Report Entry Total Tax Posted Amount|Net Tax Amount|Report Entry Total Reclaim Adjusted Amount|Net Adjusted Reclaim Amount|Report Entry Payment Type Name|Card Program Type Code|Statement Period Start Date|Statement Period End Date|Cash Account Code|Liability Account Code|Estimated Payment Date|Funding Trace|Requested Disbursement Date|Cash Advance Name|System Allocation|Future Use|Future Use|Future Use|Employee Login ID|Employee Email Address|Employee Custom 1|Employee Custom 2|Employee Custom 3|Employee Custom 4|Employee Custom 5|Employee Custom 6|Employee Custom 7|Employee Custom 8|Employee Custom 9|Employee Custom 10|Employee Custom 11|Employee Custom 12|Employee Custom 13|Employee Custom 14|Employee Custom 15|Employee Custom 16|Employee Custom 17|Employee Custom 18|Employee Custom 19|Employee Custom 20|Future Use|Future Use|Future Use|Future Use|Future Use|Employee Banking Account is Active?|Employee Banking Bank Account Type|Employee Banking Name On Account|Employee Banking Bank Name|Employee Banking Bank Branch Location|Employee Banking Bank Address Line 1|Employee Banking Bank Address Line 2|Employee Banking Bank City|Employee Banking Bank Region|Employee Banking Bank Postal Code|Employee Banking Bank Country Code|Employee Banking Tax ID|Employee Banking Is Resident?|Employee Banking Account Status|Employee Banking Account Currency|Future Use|Future Use|Future Use|Future Use|Future Use|Personal Expenses|Total Amount Claimed|Amount Due Employee|Amount Due Company Card|Amount Not Approved|Amount Company Paid|Amount Due Company|Payment Confirmed Amount|Amount Due Employee|Amount Due Company Card|Report Type|Total Tax Adjusted Amount|Net Adjusted Tax Amount|Report Start Date|Report End Date|Future Use|Cash Advance Returns Amount|Cash Advance Return Received|Cash Advance Utilized Amount|Future Use|Future Use|Future Use|Future Use|Report Entry Location City Name|Is Billable?|Report Entry From Location|Report Entry To Location|Report Entry Location Name|Country|State/Province|UUID|Supplier Tax ID|Future Use|Future Use|Future Use|Future Use|Allocation Total Tax Transaction Amount|Allocation Total Tax Posted Amount|Allocation Total Tax Reclaim Transaction Amount|Allocation Total Tax Reclaim Posted Amount|Allocation Total Tax Reclaim Transaction Adjusted Amount|Merchant Tax ID|Future Use|Future Use|Future Use|Future Use|Request Name|Total Posted Amount|Total Approved Amount|Start Date|End Date|Authorized Date|Authorization Request ID|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use|Future Use \n"
    
            file = Base64.decode64(a[:file])
            file = file.lines
            file[0] = headers
            file = file.join
            file.gsub!("\r","")
            csv = CSV.parse(file, :liberal_parsing => true, :headers => true, col_sep: '|', :header_converters => lambda {|h| h.try(:downcase).try(:gsub,' ', '_') } )
            array = csv.map {|row| row.to_hash }
        end
    end
    return{"implicit:array:implicit:object":array}
end